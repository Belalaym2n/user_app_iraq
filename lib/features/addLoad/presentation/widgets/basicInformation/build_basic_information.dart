import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:user_app_iraq/core/utils/app_colors.dart';
import 'package:user_app_iraq/core/utils/app_constants.dart';
import 'package:user_app_iraq/core/utils/app_validator.dart';

import '../../../../../core/sharedWidgets/custom_form_field.dart';
import '../../../../../core/sharedWidgets/text_styles.dart';
import '../../../../../generated/locale_keys.g.dart';
import '../../../data/models/vehicle_model.dart';
import '../../bloc/add_load_bloc.dart';
import '../../bloc/add_load_event.dart';
import '../build_card_info.dart';
import 'build_vehicle.dart';

class BuildBasicInformation extends StatefulWidget {
  BuildBasicInformation({
    super.key,

    required this.vehicles,
    required this.loadDescription,
    required this.material,
    required this.weight,
    required this.loadTitle,
    this.isLoading = false,
  });
  TextEditingController loadTitle;
  TextEditingController loadDescription;
  TextEditingController material;
  TextEditingController weight;
   bool isLoading;
  List<VehicleModel> vehicles;

  @override
  State<BuildBasicInformation> createState() => _BuildBasicInformationState();
}

class _BuildBasicInformationState extends State<BuildBasicInformation> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _buildBasicInfoCard(),
        SizedBox(height: AppConstants.h * 0.03),
        _buildLoadDetailsCard(),
      ],
    );
  }

  Widget _buildBasicInfoCard() {
    return buildCard(
      isLoading: widget.isLoading,
      title: LocaleKeys.Add_Load_basicInformation.tr(),
      icon: Icons.info_outline,
      children: [
        CustomTextField(

          validator: Validators.requiredField,
          label: '${LocaleKeys.Add_Load_loadTitle.tr()} *',
          hint: LocaleKeys.Add_Load_loadTitleHint.tr(),
          controller:widget.loadTitle,
          prefixIcon: const Icon(Icons.title, color: AppColors.primaryColor),
        ),
        const SizedBox(height: 16),

        CustomTextField(
          validator: Validators.description,
          label: LocaleKeys.Add_Load_description.tr(),
          hint: LocaleKeys.Add_Load_descriptionHint.tr(),
          controller: widget.loadDescription,
          maxLines: 2,
          prefixIcon: const Icon(
            Icons.description,
            color: AppColors.primaryColor,
          ),
        ),
      ],
    );
  }

  Widget _buildLoadDetailsCard() {
    return buildCard(
      isLoading: widget.isLoading,

      title: LocaleKeys.Add_Load_loadDetails.tr(),
      icon: Icons.inventory_2_outlined,
      children: [
        CustomTextField(
          validator: (value) => Validators.requiredField(
            value,
            message: LocaleKeys.Validations_enterYourMaterial.tr(),
          ),

          label: '${LocaleKeys.Add_Load_materialType.tr()} *',
          hint: LocaleKeys.Add_Load_materialTypeHint.tr(),
          controller:widget.material,
          prefixIcon: const Icon(Icons.category, color: AppColors.primaryColor),
        ),
        const SizedBox(height: 16),

        CustomTextField(
          validator: (value) => Validators.requiredField(
            value,
            message: LocaleKeys.Validations_enterWeight.tr(),
          ),
          label:
              '${LocaleKeys.Add_Load_weight.tr()} (${LocaleKeys.Add_Load_kilogram.tr()}) *',
          hint: '20',
          keyboardType: TextInputType.number,
          controller: widget.weight,
          prefixIcon: const Icon(
            Icons.fitness_center,
            color: AppColors.primaryColor,
          ),
        ),

        const SizedBox(height: 20),

        DefaultDropdown<VehicleModel>(
          hintText: 'Select vehicle',
          items: widget.vehicles
              .map(
                (v) => DropdownMenuItem<VehicleModel>(
                  value: v,
                  child: Text(v.name),
                ),
              )
              .toList(),
          value: context.watch<AddLoadBloc>().state.selectedVehicle,
          onChanged: (value) {
            if (value != null) {
              context.read<AddLoadBloc>().add(SelectVehicleEvent(value));
            }
          },
        ),
      ],
    );
  }
}
