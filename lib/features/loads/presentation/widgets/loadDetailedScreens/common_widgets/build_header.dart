import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';

import '../../../../../../core/utils/app_colors.dart';
import '../../../../../../core/utils/app_constants.dart';
import '../../../../../../core/sharedWidgets/text_styles.dart';
import '../../../../../../generated/locale_keys.g.dart';
import '../../../../data/models/last_trip_model.dart';

class EnhancedSliverAppBar extends StatelessWidget {
  final TripModel load;
  final Color Function(TripStatus) getStatusColor;
  final IconData Function(dynamic) getStatusIcon;

  const EnhancedSliverAppBar({
    Key? key,
    required this.load,
    required this.getStatusColor,
    required this.getStatusIcon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final statusColor = getStatusColor(load.status);
    return _buildAppBarBackground(context, statusColor);
  }

  Widget _buildAppBarBackground(BuildContext context, Color statusColor) {
    return SizedBox(
      height: AppConstants.h * 0.258, // 200 / 776
      child: Stack(
        children: [
          _buildGradientBackground(statusColor),
          _buildLoadInfo(context),
        ],
      ),
    );
  }

  Widget _buildGradientBackground(Color statusColor) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            statusColor,
            statusColor.withOpacity(0.7),
          ],
        ),
      ),
    );
  }

  Widget _buildLoadInfo(BuildContext context) {
    return Positioned(
      bottom: AppConstants.h * 0.051, // 40 / 776
      left: AppConstants.w * 0.055,   // 20 / 360
      right: AppConstants.w * 0.055,  // 20 / 360
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildStatusBadge(),
          SizedBox(height: AppConstants.h * 0.010), // 8 / 776
          _buildLoadTitle(),
          SizedBox(height: AppConstants.h * 0.005), // 4 / 776
          _buildLoadId(context),
        ],
      ),
    );
  }

  Widget _buildStatusBadge() {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: AppConstants.w * 0.033, // 12 / 360
        vertical: AppConstants.h * 0.008,   // 6 / 776
      ),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.2),
        borderRadius: BorderRadius.circular(
          AppConstants.w * 0.055, // 20 / 360
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            getStatusIcon(load.status),
            color: Colors.white,
            size: AppConstants.w * 0.044, // 16 / 360
          ),
          SizedBox(width: AppConstants.w * 0.017), // 6 / 360
          Text(
            load.status.name,
            style: AppTextStyles.headlineSmall().copyWith(
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildLoadTitle() {
    return Text(
      load.tripTitle,
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
      style: AppTextStyles.displayLarge().copyWith(
        color: Colors.white,
      ),
    );
  }

  Widget _buildLoadId(BuildContext context) {
    return Text(
      '${LocaleKeys.MyLoadsScreen_loadId.tr()}: ${_formatLoadId(load.id.toString())}',
      style: AppTextStyles.headlineSmall().copyWith(
        color: Colors.white.withOpacity(0.9),
      ),
    );
  }

  String _formatLoadId(String id) {
    return id.length >= 8
        ? id.substring(0, 8).toUpperCase()
        : id.toUpperCase();
  }
}
