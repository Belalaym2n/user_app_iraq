import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import '../../../../../../core/utils/app_colors.dart';
import '../../../../data/models/last_trip_model.dart';

class LoadBottomActionBar extends StatelessWidget {
  final TripStatus status;
  final int bidsCount;

  final VoidCallback? onShare;
  final VoidCallback? onViewBids;
  final VoidCallback? onContactDriver;
  final VoidCallback? onTrackTrip;
  final VoidCallback? onRate;
  final VoidCallback? onRepost;
  final VoidCallback? onSupport;

  const LoadBottomActionBar({
    super.key,
    required this.status,
    this.bidsCount = 0,
    this.onShare,
    this.onViewBids,
    this.onContactDriver,
    this.onTrackTrip,
    this.onRate,
    this.onRepost,
    this.onSupport,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.backgroundColor,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.08),
            blurRadius: 12,
            offset: const Offset(0, -4),
          ),
        ],
      ),
      child: SafeArea(child: Row(children: _actionsByStatus())),
    );
  }

  List<Widget> _actionsByStatus() {
    switch (status) {
      case TripStatus.pending:
        return _doubleActions(
          left: _outlinedButton(
            icon: Icons.share,
            label: 'share'.tr(),
            onTap: onShare,
          ),
          right: _primaryButton(
            icon: Icons.gavel,
            label: '${'view_bids'.tr()} ($bidsCount)',
            onTap: onViewBids,
          ),
        );
      case TripStatus.accepted:
        return _doubleActions(
          left: _outlinedButton(
            icon: Icons.share,
            label: 'share'.tr(),
            onTap: onShare,
          ),
          right: _primaryButton(

          color: AppColors.primaryColor,
          icon: Icons.message,
          label: 'contact_driver'.tr(),
          onTap: onContactDriver,
        ),
        );
      case TripStatus.started:
        return _doubleActions(
          left: _outlinedButton(

            icon: Icons.phone,
            label: 'contact_driver'.tr(),
            onTap: onContactDriver,
          ),
          right: _primaryButton(
            icon: Icons.location_on,
            label: 'track_shipment'.tr(),
            onTap: onTrackTrip,
          ),
        );

      case TripStatus.completed:
        return _doubleActions(
    left:_outlinedButton(
      icon: Icons.report_problem,
      label: 'Send Problem'.tr(),
      onTap: onTrackTrip,
    ),

      right: _primaryButton(
        icon: Icons.star,
        color: AppColors.primaryColor,


         label: 'rate_experience'.tr(),
        onTap: onRate,

    ));

      default:
        return _singleAction(
          _primaryButton(
            icon: Icons.support_agent,
            label: 'contact_support'.tr(),
            onTap: onSupport,
          ),
        );
    }
  }

  // ==============================
  // UI Helpers (DRY)
  // ==============================
  List<Widget> _doubleActions({required Widget left, required Widget right}) =>
      [
        Expanded(child: left),
        const SizedBox(width: 12),
        Expanded(child: right),
      ];

  List<Widget> _singleAction(Widget button) => [Expanded(child: button)];

  Widget _primaryButton({
    required IconData icon,
    required String label,
    required VoidCallback? onTap,
    Color? color,
  }) {
    return ElevatedButton.icon(
      onPressed: onTap, // ✅ الصح

      icon: Icon(icon),
      label: Text(label),
      style: ElevatedButton.styleFrom(

        backgroundColor: color ?? AppColors.primaryColor,
        foregroundColor: Colors.white,
        padding: const EdgeInsets.symmetric(vertical: 14),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
    );
  }

  Widget _outlinedButton({
    required IconData icon,
    required String label,
    required VoidCallback? onTap,
  }) {
    return OutlinedButton.icon(
      onPressed: onTap,
      icon: Icon(icon, color: AppColors.primaryColor),
      label: Text(label, style: TextStyle(color: AppColors.primaryColor)),
      style: OutlinedButton.styleFrom(
        padding: const EdgeInsets.symmetric(vertical: 14),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        side: BorderSide(color: AppColors.primaryColor),
      ),
    );
  }
}
