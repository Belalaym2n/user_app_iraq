import 'package:flutter/material.dart';
 import 'package:easy_localization/easy_localization.dart';
import 'package:get/get_navigation/src/root/parse_route.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart' show RxList;
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart' show Obx;
import '../../../../../../core/sharedWidgets/text_styles.dart';
import '../../../../../../core/utils/app_colors.dart';
import '../../../../../../generated/locale_keys.g.dart';
import '../../../../data/models/bids_model.dart';
import '../../../../data/models/bids_status_model.dart';
import '../../../../data/models/load_model.dart';

class EnhancedBidsSection extends StatelessWidget {
  final LoadModel load;
  final RxList<BidModel> loadBids;
  final VoidCallback? onViewAll;
  final Function(BidModel)? onShowBidDetails;
  final Function(BidModel)? onAcceptBid;
  final VoidCallback? onShareLoad;

  const EnhancedBidsSection({
    Key? key,
    required this.load,
    required this.loadBids,
    this.onViewAll,
    this.onShowBidDetails,
    this.onAcceptBid,
    this.onShareLoad,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      padding: const EdgeInsets.all(20),
      decoration: _buildCardDecoration(),
      child: Column(
        children: [
          _buildHeader(),
          const SizedBox(height: 16),
          _buildBidsContent(),
        ],
      ),
    );
  }

  // ============== Card Decoration ==============

  BoxDecoration _buildCardDecoration() {
    return BoxDecoration(
      color: AppColors.cardColor,
      borderRadius: BorderRadius.circular(20),
      border: Border.all(color: AppColors.borderColor),
      boxShadow: [
        BoxShadow(
          color: AppColors.textMuted.withOpacity(0.05),
          blurRadius: 10,
          offset: const Offset(0, 4),
        ),
      ],
    );
  }

  // ============== Header ==============

  Widget _buildHeader() {
    return Row(
      children: [
        _buildHeaderIcon(),
        const SizedBox(width: 12),
        Expanded(child: _buildHeaderInfo()),
        if (loadBids.isNotEmpty) _buildViewAllButton(),
      ],
    );
  }

  Widget _buildHeaderIcon() {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: AppColors.primaryColor.withOpacity(0.1),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Icon(
        Icons.gavel_rounded,
        color: AppColors.primaryColor,
        size: 24,
      ),
    );
  }

  Widget _buildHeaderInfo() {
    return Obx(() => Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          LocaleKeys.MyLoadsScreen_bidManagement.tr(),
          style: AppTextStyles.headlineMedium(),
        ),
        Text(
          '${loadBids.length} ${LocaleKeys.MyLoadsScreen_receivedBids.tr()}',
          style: AppTextStyles.bodySmall(),
        ),
      ],
    ));
  }

  Widget _buildViewAllButton() {
    return TextButton(
      onPressed: onViewAll,
      style: TextButton.styleFrom(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      ),
      child: Text(
        LocaleKeys.MyLoadsScreen_viewAll.tr(),
        style: AppTextStyles.labelLarge().copyWith(
          color: AppColors.primaryColor,
        ),
      ),
    );
  }

  // ============== Bids Content ==============

  Widget _buildBidsContent() {
    return Obx(() {
      if (loadBids.isEmpty) {
        return _NoBidsWidget(onShareLoad: onShareLoad);
      }

      final acceptedBid = loadBids.firstWhereOrNull(
            (bid) => bid.status == BidStatus.accepted,
      );

      if (acceptedBid != null) {
        return _AcceptedBidWidget(bid: acceptedBid);
      }

      return Column(
        children: loadBids.take(3).map((bid) {
          return _BidItem(
            bid: bid,
            onShowDetails: onShowBidDetails,
            onAccept: onAcceptBid,
          );
        }).toList(),
      );
    });
  }
}

// ============== Bid Item Widget ==============

class _BidItem extends StatelessWidget {
  final BidModel bid;
  final Function(BidModel)? onShowDetails;
  final Function(BidModel)? onAccept;

  const _BidItem({
    Key? key,
    required this.bid,
    this.onShowDetails,
    this.onAccept,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.borderColor),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          _buildBidHeader(),
          if (_hasNotes) ...[
            const SizedBox(height: 8),
            _buildNotesSection(),
          ],
          const SizedBox(height: 12),
          _buildActionButtons(),
        ],
      ),
    );
  }

  Widget _buildBidHeader() {
    return Row(
      children: [
        _buildDriverAvatar(),
        const SizedBox(width: 12),
        Expanded(child: _buildDriverInfo()),
        _buildBidAmount(),
      ],
    );
  }

  Widget _buildDriverAvatar() {
    return CircleAvatar(
      radius: 20,
      backgroundColor: AppColors.primaryColor.withOpacity(0.1),
      backgroundImage: bid.driverInfo?.photoUrl != null
          ? NetworkImage(bid.driverInfo!.photoUrl!)
          : null,
      child: bid.driverInfo?.photoUrl == null
          ? Text(
        bid.driverName[0].toUpperCase(),
        style: AppTextStyles.headlineSmall().copyWith(
          color: AppColors.primaryColor,
        ),
      )
          : null,
    );
  }

  Widget _buildDriverInfo() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          bid.driverName,
          style: AppTextStyles.headlineSmall(),
        ),
        const SizedBox(height: 2),
        _buildDriverStats(),
      ],
    );
  }

  Widget _buildDriverStats() {
    return Row(
      children: [
        Icon(
          Icons.star_rounded,
          color: AppColors.warningColor,
          size: 14,
        ),
        const SizedBox(width: 2),
        Text(
          bid.driverRating.toStringAsFixed(1),
          style: AppTextStyles.bodySmall(),
        ),
        const SizedBox(width: 8),
        Text(
          '${bid.completedTrips} ${LocaleKeys.Support_recentloads.tr()}',
          style: AppTextStyles.bodySmall(),
        ),
      ],
    );
  }

  Widget _buildBidAmount() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Text(
          'د.ع ${bid.bidAmount.toStringAsFixed(0)}',
          style: AppTextStyles.displayMedium().copyWith(
            color: AppColors.primaryColor,
          ),
        ),
        Text(
          bid.getTimeAgo(),
          style: AppTextStyles.bodySmall().copyWith(fontSize: 10),
        ),
      ],
    );
  }

  Widget _buildNotesSection() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: AppColors.neutralGray,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Text(
        bid.notes!,
        style: AppTextStyles.bodySmall(),
      ),
    );
  }

  Widget _buildActionButtons() {
    return Row(
      children: [
        Expanded(
          child: OutlinedButton.icon(
            onPressed: () => onShowDetails?.call(bid),
            icon: const Icon(Icons.info_outline_rounded, size: 16),
            label: Text(LocaleKeys.MyLoadsScreen_viewDetails.tr()),
            style: OutlinedButton.styleFrom(
              padding: const EdgeInsets.symmetric(vertical: 8),
              foregroundColor: AppColors.primaryColor,
              side: BorderSide(color: AppColors.primaryColor),
            ),
          ),
        ),
        const SizedBox(width: 8),
        Expanded(
          child: ElevatedButton.icon(
            onPressed: () => onAccept?.call(bid),
            icon: const Icon(Icons.check_rounded, size: 16),
            label: Text(LocaleKeys.MyLoadsScreen_actions.tr()),
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.symmetric(vertical: 8),
              backgroundColor: AppColors.primaryColor,
              foregroundColor: Colors.white,
            ),
          ),
        ),
      ],
    );
  }

  bool get _hasNotes => bid.notes?.isNotEmpty == true;
}

// ============== Accepted Bid Widget ==============

class _AcceptedBidWidget extends StatelessWidget {
  final BidModel bid;

  const _AcceptedBidWidget({
    Key? key,
    required this.bid,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.successColor.withOpacity(0.1),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: AppColors.successColor.withOpacity(0.3),
        ),
      ),
      child: Column(
        children: [
          _buildHeader(),
          const SizedBox(height: 12),
          _buildDriverStats(),
        ],
      ),
    );
  }

  Widget _buildHeader() {
    return Row(
      children: [
        _buildSuccessIcon(),
        const SizedBox(width: 12),
        Expanded(child: _buildTransporterInfo()),
        _buildAmount(),
      ],
    );
  }

  Widget _buildSuccessIcon() {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: AppColors.successColor.withOpacity(0.2),
        shape: BoxShape.circle,
      ),
      child: Icon(
        Icons.check_circle_rounded,
        color: AppColors.successColor,
        size: 24,
      ),
    );
  }

  Widget _buildTransporterInfo() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          LocaleKeys.MyLoadsScreen_transportAssigned.tr(),
          style: AppTextStyles.headlineSmall().copyWith(
            color: AppColors.successColor,
          ),
        ),
        Text(
          bid.driverName,
          style: AppTextStyles.bodySmall().copyWith(
            color: AppColors.successColor,
          ),
        ),
      ],
    );
  }

  Widget _buildAmount() {
    return Text(
      'د.ع ${bid.bidAmount.toStringAsFixed(0)}',
      style: AppTextStyles.displayMedium().copyWith(
        color: AppColors.successColor,
        fontSize: 20,
      ),
    );
  }

  Widget _buildDriverStats() {
    return Row(
      children: [
        Expanded(
          child: _BidDetailItem(
            icon: Icons.star_rounded,
            label: LocaleKeys.Profile_feedback.tr(),
            value: bid.driverRating.toStringAsFixed(1),
          ),
        ),
        Expanded(
          child: _BidDetailItem(
            icon: Icons.local_shipping_rounded,
            label: LocaleKeys.Support_recentloads.tr(),
            value: '${bid.completedTrips}',
          ),
        ),
        Expanded(
          child: _BidDetailItem(
            icon: Icons.schedule_rounded,
            label: 'ETA',
            value: DateFormat('MMM dd').format(bid.estimatedDelivery),
          ),
        ),
      ],
    );
  }
}

// ============== Bid Detail Item ==============

class _BidDetailItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;

  const _BidDetailItem({
    Key? key,
    required this.icon,
    required this.label,
    required this.value,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(
          icon,
          color: AppColors.successColor,
          size: 20,
        ),
        const SizedBox(height: 4),
        Text(
          value,
          style: AppTextStyles.headlineSmall(),
        ),
        Text(
          label,
          style: AppTextStyles.bodySmall(),
        ),
      ],
    );
  }
}

// ============== No Bids Widget ==============

class _NoBidsWidget extends StatelessWidget {
  final VoidCallback? onShareLoad;

  const _NoBidsWidget({
    Key? key,
    this.onShareLoad,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 24),
      child: Column(
        children: [
          Icon(
            Icons.gavel_outlined,
            size: 48,
            color: AppColors.textMuted.withOpacity(0.5),
          ),
          const SizedBox(height: 12),
          Text(
            LocaleKeys.MyLoadsScreen_receivedBids.tr(),
            style: AppTextStyles.headlineSmall().copyWith(
              color: AppColors.textMuted,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            LocaleKeys.MyLoadsScreen_shareLoad.tr(),
            style: AppTextStyles.bodySmall(),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 16),
          OutlinedButton.icon(
            onPressed: onShareLoad,
            icon: const Icon(Icons.share_rounded, size: 16),
            label: Text(LocaleKeys.MyLoadsScreen_shareLoad.tr()),
            style: OutlinedButton.styleFrom(
              foregroundColor: AppColors.primaryColor,
              side: BorderSide(color: AppColors.primaryColor),
            ),
          ),
        ],
      ),
    );
  }
}