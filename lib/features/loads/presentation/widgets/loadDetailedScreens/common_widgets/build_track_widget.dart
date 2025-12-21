import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:user_app_iraq/core/utils/app_colors.dart';
import 'package:user_app_iraq/core/utils/app_constants.dart';
import 'package:user_app_iraq/features/loads/presentation/widgets/offers/detailsScreen/offers_on_details_screen.dart';

import '../../../../../../core/sharedWidgets/text_styles.dart';

class LoadLiveTracking extends StatelessWidget {
  const LoadLiveTracking({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(16),
      decoration: cardDecoration,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          _Header(),
          _MapSection(),
        ],
      ),
    );
  }
}

/* ===================== Header ===================== */

class _Header extends StatelessWidget {
  const _Header();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: const BoxDecoration(
        color: AppColors.primaryLight,
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      child: Row(
        children: const [
          _HeaderIcon(),
          SizedBox(width: 12),
          _HeaderTexts(),
          Spacer(),
          _CircleButton(icon: Icons.fullscreen),
        ],
      ),
    );
  }
}

class _HeaderIcon extends StatelessWidget {
  const _HeaderIcon();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: const BoxDecoration(
        color: AppColors.primaryColor,
        shape: BoxShape.circle,
      ),
      child: const Icon(Icons.location_on, color: Colors.white, size: 20),
    );
  }
}

class _HeaderTexts extends StatelessWidget {
  const _HeaderTexts();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Live Tracking', style: AppTextStyles.headlineMedium()),
        const SizedBox(height: 4),
        Row(
          children: const [
            _LiveDot(),
            SizedBox(width: 6),
            Text(
              'Tracking Active',
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w600,
                color: AppColors.successColor,
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class _LiveDot extends StatelessWidget {
  const _LiveDot();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 8,
      height: 8,
      decoration: BoxDecoration(
        color: AppColors.successColor,
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(
            color: AppColors.successColor.withOpacity(0.5),
            blurRadius: 6,
            spreadRadius: 2,
          ),
        ],
      ),
    );
  }
}

/* ===================== Map Section ===================== */

class _MapSection extends StatelessWidget {
  const _MapSection();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: AppConstants.h*0.25,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Stack(
          children: const [
            _MapView(),
            _MapControls(),
            _RouteInfo(),
           ],
        ),
      ),
    );
  }
}

class _MapView extends StatelessWidget {
  const _MapView();

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.vertical(bottom: Radius.circular(20)),
      child: GoogleMap(
        initialCameraPosition: const CameraPosition(
          target: LatLng(28.7041, 77.1025),
          zoom: 15,
        ),
        zoomControlsEnabled: false,
        myLocationButtonEnabled: false,
      ),
    );
  }
}

/* ===================== Map Controls ===================== */

class _MapControls extends StatelessWidget {
  const _MapControls();

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 12,
      right: 12,
      child: Column(
        children: const [
          _CircleButton(icon: Icons.my_location),
          SizedBox(height: 8),
          _CircleButton(icon: Icons.refresh),
          SizedBox(height: 8),
          _CircleButton(icon: Icons.layers),
        ],
      ),
    );
  }
}

/* ===================== Route Info ===================== */

class _RouteInfo extends StatelessWidget {
  const _RouteInfo();

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 12,
      left: 12,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        decoration: _cardDecoration,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children:   [
            _Dot(color: Colors.green),
            SizedBox(width: 4),
            Text('Pickup', style: AppTextStyles.bodySmall()),
            SizedBox(width: 8),
            Icon(Icons.arrow_forward, size: 12),
            SizedBox(width: 8),
            _Dot(color: Colors.red),
            SizedBox(width: 4),
            Text('Destination', style: AppTextStyles.bodySmall()),
          ],
        ),
      ),
    );
  }
}

class _Dot extends StatelessWidget {
  final Color color;
  const _Dot({required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 8,
      height: 8,
      decoration: BoxDecoration(color: color, shape: BoxShape.circle),
    );
  }
}

/* ===================== Driver Overlay ===================== */

class _DriverOverlay extends StatelessWidget {
  const _DriverOverlay();

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 80,
      left: 12,
      right: 12,
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: _cardDecoration,
        child: Column(
          children: const [
            _DriverHeader(),
            SizedBox(height: 16),
            _StatsRow(),
          ],
        ),
      ),
    );
  }
}

class _DriverHeader extends StatelessWidget {
  const _DriverHeader();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        _infoIcon(Icons.local_shipping),
        const SizedBox(width: 12),
        Expanded(
          child: Text(
            'Driver Current Location',
            style: AppTextStyles.headlineSmall(),
          ),
        ),
        const _SpeedBadge(speed: '45 km/h'),
      ],
    );
  }
}

/* ===================== Stats ===================== */

class _StatsRow extends StatelessWidget {
  const _StatsRow();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: const [
        _StatItem(
          icon: Icons.access_time,
          value: '15 min',
          label: 'ETA',
          color: AppColors.infoColor,
        ),
        SizedBox(width: 12),
        _StatItem(
          icon: Icons.straighten,
          value: '12 km',
          label: 'Remaining',
          color: AppColors.warningColor,
        ),
        SizedBox(width: 12),
        _StatItem(
          icon: Icons.info_outline,
          value: 'Moving',
          label: 'Status',
          color: AppColors.successColor,
        ),
      ],
    );
  }
}

class _StatItem extends StatelessWidget {
  final IconData icon;
  final String value;
  final String label;
  final Color color;

  const _StatItem({
    required this.icon,
    required this.value,
    required this.label,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: color.withOpacity(0.1),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Column(
          children: [
            Icon(icon, size: 16, color: color),
            const SizedBox(height: 4),
            Text(value,
                style: AppTextStyles.labelLarge().copyWith(color: color)),
            Text(label, style: AppTextStyles.bodySmall()),
          ],
        ),
      ),
    );
  }
}

/* ===================== Reusable ===================== */

class _CircleButton extends StatelessWidget {
  final IconData icon;
  const _CircleButton({required this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: _cardDecoration,
      padding: const EdgeInsets.all(10),
      child: Icon(icon, size: 20, color: AppColors.primaryColor),
    );
  }
}

class _SpeedBadge extends StatelessWidget {
  final String speed;
  const _SpeedBadge({required this.speed});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: AppColors.successColor.withOpacity(0.1),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: AppColors.successColor),
      ),
      child: Text(
        speed,
        style: AppTextStyles.labelLarge()
            .copyWith(color: AppColors.successColor),
      ),
    );
  }
}

/* ===================== Helpers ===================== */

final _cardDecoration = BoxDecoration(
  color: AppColors.cardColor,
  borderRadius: BorderRadius.circular(16),
  boxShadow: [
    BoxShadow(
      color: Colors.black.withOpacity(0.05),
      blurRadius: 10,
      offset: const Offset(0, 4),
    ),
  ],
);

Widget _infoIcon(IconData icon) {
  return Container(
    padding: const EdgeInsets.all(8),
    decoration: BoxDecoration(
      color: AppColors.primaryLight.withOpacity(0.2),
      borderRadius: BorderRadius.circular(8),
    ),
    child: Icon(icon, size: 20, color: AppColors.primaryColor),
  );
}
