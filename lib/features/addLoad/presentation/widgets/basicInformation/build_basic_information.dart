import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:user_app_iraq/core/utils/app_colors.dart';
import 'package:user_app_iraq/core/utils/app_constants.dart';

import '../../../../../core/sharedWidgets/custom_form_field.dart';
import '../../../../../core/sharedWidgets/text_styles.dart';
import '../../../../../generated/locale_keys.g.dart';
import '../build_card_info.dart';
import 'build_vehicle.dart';

class BuildBasicInformation extends StatefulWidget {
  const BuildBasicInformation({super.key});

  @override
  State<BuildBasicInformation> createState() => _BuildBasicInformationState();
}

class _BuildBasicInformationState extends State<BuildBasicInformation> {
  @override
  Widget build(BuildContext context) {
    return   Column(
      children: [
        _buildBasicInfoCard(),
        SizedBox(height: AppConstants.h*0.03,),
        _buildLoadDetailsCard()
      ],
    );
  }


  Widget _buildBasicInfoCard() {
    return buildCard(
      title: LocaleKeys.Add_Load_basicInformation.tr(),
      icon: Icons.info_outline,
      children: [
        CustomTextField(
          label: '${LocaleKeys.Add_Load_loadTitle.tr()} *',
          hint: LocaleKeys.Add_Load_loadTitleHint.tr(),
          controller:TextEditingController(),
          prefixIcon: const Icon(Icons.title, color: AppColors.primaryColor),
        ),
        const SizedBox(height: 16),

        CustomTextField(
          label: LocaleKeys.Add_Load_description.tr(),
          hint: LocaleKeys.Add_Load_descriptionHint.tr(),
          controller:TextEditingController(),
          maxLines: 2,
          prefixIcon: const Icon(Icons.description, color: AppColors.primaryColor),
        ),
      ],
    );
  }

  // -----------------------------
  // LOAD DETAILS CARD
  // -----------------------------
  Widget _buildLoadDetailsCard() {
    return buildCard(
      title: LocaleKeys.Add_Load_loadDetails.tr(),
      icon: Icons.inventory_2_outlined,
      children: [
        CustomTextField(
          label: '${LocaleKeys.Add_Load_materialType.tr()} *',
          hint: LocaleKeys.Add_Load_materialTypeHint.tr(),
          controller: TextEditingController(),
          prefixIcon: const Icon(Icons.category, color: AppColors.primaryColor),
        ),
        const SizedBox(height: 16),

        CustomTextField(
          label:
          '${LocaleKeys.Add_Load_weight.tr()} (${LocaleKeys.Add_Load_kilogram.tr()}) *',
          hint: '0',
          keyboardType: TextInputType.number,
          controller: TextEditingController(),
          prefixIcon:
          const Icon(Icons.fitness_center, color: AppColors.primaryColor),
        ),

        const SizedBox(height: 20),

        VehicleSelectionWidget(),
      ],
    );
  }


}
