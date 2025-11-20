import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:user_app_iraq/core/utils/app_colors.dart';
import 'package:user_app_iraq/core/utils/app_constants.dart';
import 'package:user_app_iraq/generated/locale_keys.g.dart';
import '../../../../../core/sharedWidgets/text_styles.dart';
import '../../../../../core/utils/app_images.dart';

class VehicleSelectionWidget extends StatefulWidget {
  const VehicleSelectionWidget({super.key});

  @override
  State<VehicleSelectionWidget> createState() => _VehicleSelectionWidgetState();
}

class _VehicleSelectionWidgetState extends State<VehicleSelectionWidget> {
  VehicleType? selectedVehicleType;

  @override
  Widget build(BuildContext context) {
    return _buildVehicleSelection();
  }

  // ------------------ VEHICLE SELECTION ------------------
  Widget _buildVehicleSelection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '${StringTranslateExtension(LocaleKeys.Add_Load_vehicleType).tr()} *',
          style: AppTextStyles.headlineLarge(),
        ),
        const SizedBox(height: 16),

        Row(
          children: [
            Expanded(
              child: _buildVehicleChip(
                vehicleType: VehicleType.pickup,
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: _buildVehicleChip(
                vehicleType: VehicleType.truck,
              ),
            ),
          ],
        ),
        SizedBox(
          height: AppConstants.h*0.01,
        )
      ],
    );
  }

  // ------------------ SINGLE CHIP ------------------
  Widget _buildVehicleChip({
    required VehicleType vehicleType,
  }) {
    final bool isSelected = selectedVehicleType == vehicleType;

    return GestureDetector(
      onTap: () {
        setState(() {
          selectedVehicleType = vehicleType;   // ✔ التحديد شغال
        });
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        height: 120,
        decoration: BoxDecoration(
          gradient: const LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Colors.white,
              Colors.white,
            ],
          ),
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: isSelected ? AppColors.secondaryColor : Colors.grey.shade300,
            width: isSelected ? 3 : 1,
          ),
          boxShadow: [
            BoxShadow(
              color: isSelected
                  ? AppColors.secondaryColor.withOpacity(0.35)
                  : Colors.grey.withOpacity(0.1),
              blurRadius: isSelected ? 12 : 6,
              offset: Offset(0, isSelected ? 6 : 3),
            ),
          ],
        ),
        child: Stack(
          children: [
            Center(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.asset(
                  _getVehicleImagePath(vehicleType),
                  fit: BoxFit.cover,
                  color: isSelected ? null : Colors.white,
                  colorBlendMode: isSelected ? null : BlendMode.saturation,
                ),
              ),
            ),

            if (isSelected)
              Positioned(
                top: 8,
                right: 8,
                child: Container(
                  padding: const EdgeInsets.all(4),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.2),
                        blurRadius: 4,
                        offset: const Offset(0, 2),
                      ),
                    ],
                  ),
                  child: Icon(
                    Icons.check_circle,
                    color: AppColors.secondaryColor,
                    size: 20,
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }

  // ------------------ IMAGE PATH ------------------
  String _getVehicleImagePath(VehicleType vehicleType) {
    switch (vehicleType) {
      case VehicleType.pickup:
        return AppImages.pickup;
      case VehicleType.truck:
        return AppImages.truck;
    }
  }
}

enum VehicleType {
  truck,
  pickup,
}
