import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:user_app_iraq/core/utils/app_constants.dart';
import '../../../../../core/sharedWidgets/text_styles.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../../generated/locale_keys.g.dart';
import '../../../../addLoad/data/models/load_model.dart';
import '../../../data/models/bids_model.dart';
import '../../../data/models/bids_status_model.dart';
class EnhancedBidsSection extends StatelessWidget {
  final BidModel bid;
   final ThemeData theme;
  final Color primaryColor;

  const EnhancedBidsSection({
    required this.bid,
     required this.theme,
    required this.primaryColor,
   });

  @override
  Widget build(BuildContext context) {

      return Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              primaryColor.withOpacity(0.08),
              primaryColor.withOpacity(0.03),
            ],
          ),
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: primaryColor.withOpacity(0.2),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _BidsSectionHeader(
               theme: theme,
              primaryColor: primaryColor,
              bidCount: 2,
            ),

            const SizedBox(height: 12),

            _BidPreviewCard(

              bid: bid,
              theme: theme,
             ),

               const SizedBox(height: 12),
              _ViewAllBidsButton(
                count: 2,
                 primaryColor: primaryColor,
                onPressed: () {}



        ),])
      );

  }
}

///////////////////////////////////////////////////////////////
///                 🔵 TITLE + COUNTER HEADER              ///
///////////////////////////////////////////////////////////////

class _BidsSectionHeader extends StatelessWidget {
   final ThemeData theme;
  final Color primaryColor;
  final int bidCount;

  const _BidsSectionHeader({
     required this.theme,
    required this.primaryColor,
    required this.bidCount,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Container(
              padding: const EdgeInsets.all(6),
              decoration: BoxDecoration(
                color: primaryColor.withOpacity(0.15),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Icon(Icons.gavel_rounded,
                  size: 16, color: primaryColor),
            ),
            const SizedBox(width: 8),
            Text(
              LocaleKeys.MyLoadsScreen_receivedBids.tr(),
              style: theme.textTheme.titleSmall?.copyWith(
                fontWeight: FontWeight.bold,
                color: primaryColor,
              ),
            ),
          ],
        ),

        _BidCounterChip(
          count: bidCount,
          primaryColor: primaryColor,
          theme: theme,
        )
      ],
    );
  }
}

class _BidCounterChip extends StatelessWidget {
  final int count;
  final Color primaryColor;
  final ThemeData theme;

  const _BidCounterChip({
    required this.count,
    required this.primaryColor,
    required this.theme,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: primaryColor.withOpacity(0.2),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Text(
        '$count',
        style: theme.textTheme.bodySmall?.copyWith(
          color: primaryColor,
          fontWeight: FontWeight.bold,
          fontSize: 12,
        ),
      ),
    );
  }
}

///////////////////////////////////////////////////////////////
///                🔵 BID PREVIEW CARD                     ///
///////////////////////////////////////////////////////////////

class _BidPreviewCard extends StatelessWidget {
  final BidModel bid;
   final ThemeData theme;

  const _BidPreviewCard({
    required this.bid,
     required this.theme,
    });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: theme.colorScheme.surface,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: theme.colorScheme.outline.withOpacity(0.1),
        ),
      ),
      child: Row(
        children: [
          _BidAvatar(letter: _firstLetter(bid.driverName)),

          const SizedBox(width: 12),

          Expanded(
            child: _BidInfoSection(
              bid: bid,
              theme: theme,
            ),
          ),

          _BidActions(
            bid: bid,
           ),
        ],
      ),
    );
  }

  String _firstLetter(String name) {
    if (name.isEmpty) return '?';
    return name[0].toUpperCase();
  }
}

///////////////////////////////////////////////////////////////
///                   🔵 DRIVER AVATAR                     ///
///////////////////////////////////////////////////////////////

class _BidAvatar extends StatelessWidget {
  final String letter;

  const _BidAvatar({required this.letter});

  @override
  Widget build(BuildContext context) {

    return Container(
      width: 32,
      height: 32,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            AppColors.primaryColor.withOpacity(0.2),
            AppColors.primaryColor.withOpacity(0.1),
          ],
        ),
        shape: BoxShape.circle,
      ),
      child: Center(
        child: Text(
          letter,
          style: TextStyle(
            color: AppColors.primaryColor,
            fontWeight: FontWeight.bold,
            fontSize: 14,
          ),
        ),
      ),
    );
  }
}

///////////////////////////////////////////////////////////////
///                   🔵 BID INFO SECTION                  ///
///////////////////////////////////////////////////////////////

class _BidInfoSection extends StatelessWidget {
  final BidModel bid;
  final ThemeData theme;

  const _BidInfoSection({
    required this.bid,
    required this.theme,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          bid.driverName.isNotEmpty ? bid.driverName : 'Unknown Transporter',
          style: theme.textTheme.bodyMedium?.copyWith(
            fontWeight: FontWeight.w600,
            color: theme.colorScheme.onSurface,
          ),
        ),
        const SizedBox(height: 4),
        Row(
          children: [
            Icon(Icons.star_rounded, size: 14, color: AppColors.warningColor),
            const SizedBox(width: 4),
            Text(
              bid.driverRating.toStringAsFixed(1),
              style: theme.textTheme.bodySmall?.copyWith(
                color: theme.colorScheme.onSurfaceVariant,
                fontWeight: FontWeight.w500,
                fontSize: 12,
              ),
            ),
          ],
        ),
      ],
    );
  }
}

///////////////////////////////////////////////////////////////
///                   🔵 BID ACTION BUTTONS                ///
///////////////////////////////////////////////////////////////

class _BidActions extends StatelessWidget {
  final BidModel bid;

  const _BidActions({
    required this.bid,
   });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        _PriceChip(amount: bid.bidAmount),

        if (bid.status == BidStatus.pending) ...[
          const SizedBox(height: 8),
          Row(
            children: [
              _BidActionIcon(
                icon: Icons.check_rounded,
                color: AppColors.successColor,
                onPressed: () => {}
              ),
              const SizedBox(width: 4),
              _BidActionIcon(
                icon: Icons.handshake_rounded,
                color: AppColors.warningColor,
                onPressed: () {

                },
              ),
              const SizedBox(width: 4),
              _BidActionIcon(
                icon: Icons.close_rounded,
                color: AppColors.errorColor,
                onPressed: () {
                }
              ),
            ],
          ),
        ],
      ],
    );
  }
}

///////////////////////////////////////////////////////////////
///                  🔵 ACTION ICON                        ///
///////////////////////////////////////////////////////////////

class _BidActionIcon extends StatelessWidget {
  final IconData icon;
  final Color color;
  final VoidCallback onPressed;

  const _BidActionIcon({
    required this.icon,
    required this.color,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 24,
      height: 24,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            color.withOpacity(0.15),
            color.withOpacity(0.05),
          ],
        ),
        borderRadius: BorderRadius.circular(6),
        border: Border.all(color: color.withOpacity(0.3)),
      ),
      child: IconButton(
        onPressed: onPressed,
        icon: Icon(icon, size: 12, color: color),
        padding: EdgeInsets.zero,
      ),
    );
  }
}

///////////////////////////////////////////////////////////////
///                     🔵 PRICE CHIP                       ///
///////////////////////////////////////////////////////////////

class _PriceChip extends StatelessWidget {
  final double amount;

  const _PriceChip({required this.amount});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            AppColors.successColor.withOpacity(0.15),
            AppColors.successColor.withOpacity(0.05),
          ],
        ),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Text(
        'د.ع ${amount.toStringAsFixed(0)}',
        style: TextStyle(
          fontWeight: FontWeight.bold,
          color: AppColors.successColor,
          fontSize: 13,
        ),
      ),
    );
  }
}

///////////////////////////////////////////////////////////////
///               🔵 VIEW ALL BIDS BUTTON                  ///
///////////////////////////////////////////////////////////////

class _ViewAllBidsButton extends StatelessWidget {
  final int count;
   final Color primaryColor;
  final VoidCallback onPressed;

  const _ViewAllBidsButton({
    required this.count,
     required this.primaryColor,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton.icon(
      onPressed: onPressed,
      icon: Icon(Icons.visibility_rounded, size: 16, color: primaryColor),
      label: Text(
        ' $count ${LocaleKeys.MyLoadsScreen_viewBids.tr()}',
        style: TextStyle(
          color: primaryColor,
          fontWeight: FontWeight.w600,
          fontSize: 12,
        ),
      ),
      style: TextButton.styleFrom(
        backgroundColor: primaryColor.withOpacity(0.1),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
    );
  }
}
