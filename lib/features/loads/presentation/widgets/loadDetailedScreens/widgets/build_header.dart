import 'package:flutter/material.dart';
 import 'package:easy_localization/easy_localization.dart';
import 'package:user_app_iraq/core/utils/app_colors.dart';

import '../../../../../../core/sharedWidgets/text_styles.dart';
import '../../../../../../generated/locale_keys.g.dart';
import '../../../../data/models/load_model.dart';

class EnhancedSliverAppBar extends StatelessWidget {
  final LoadModel load;
  // final VoidCallback? onMenuAction;
  // final List<PopupMenuEntry<String>> Function(LoadModel, BuildContext) buildMenuItems;
  final Color Function(dynamic) getStatusColor;
  final IconData Function(dynamic) getStatusIcon;

  const EnhancedSliverAppBar({
    Key? key,
    required this.load,
    // required this.buildMenuItems,
    required this.getStatusColor,
    required this.getStatusIcon,
    // this.onMenuAction,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final statusColor = getStatusColor(load.status);

    return   _buildAppBarBackground(context, statusColor

    );
  }

  Widget _buildAppBarBackground(BuildContext context, Color statusColor) {
    return SizedBox(
      height: 200, // اضبط الارتفاع اللي يناسب تصميمك
      child: Stack(
        children: [
          _buildGradientBackground(statusColor),

          _buildLoadInfo(context), // ده Positioned ← تمام هنا
        ],
      ),
    );
  }


  Widget _buildGradientBackground(Color statusColor) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.red,
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
      bottom: 40,
      left: 20,
      right: 20,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildStatusBadge(),
          const SizedBox(height: 8),
          _buildLoadTitle(),
          const SizedBox(height: 4),
          _buildLoadId(context),
        ],
      ),
    );
  }

  Widget _buildStatusBadge() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.2),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            getStatusIcon(load.status),
            color: Colors.white,
            size: 16,
          ),
          const SizedBox(width: 6),
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
      load.title,
      style: AppTextStyles.displayLarge().copyWith(
        color: Colors.white,
      ),
    );
  }

  Widget _buildLoadId(BuildContext context) {
    return Text(
      '${LocaleKeys.MyLoadsScreen_loadId.tr()}: ${_formatLoadId(load.id)}',
      style: AppTextStyles.headlineSmall().copyWith(
        color: Colors.white.withOpacity(0.9),
      ),
    );
  }

  String _formatLoadId(String id) {
    return id.length >= 8 ? id.substring(0, 8).toUpperCase() : id.toUpperCase();
  }

  BoxDecoration _buildGlassDecoration() {
    return BoxDecoration(
      color: Colors.black.withOpacity(0.2),
      borderRadius: BorderRadius.circular(12),
    );
  }
}