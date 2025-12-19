 import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:user_app_iraq/features/loads/data/models/trip_details_model.dart';
import 'package:user_app_iraq/features/loads/presentation/bloc/get_trip_details/get_trip_details_states.dart';
import 'package:user_app_iraq/features/loads/presentation/widgets/loadDetailedScreens/common_widgets/build_widget_header.dart';

import '../../../../../../core/sharedWidgets/text_styles.dart';
import '../../../../../../core/utils/app_colors.dart';
import '../../../../../../generated/locale_keys.g.dart' show LocaleKeys;

class LoadInfo extends StatelessWidget {
     LoadInfo({super.key,required this.load});
 TripDetailsModel load;
   @override
   Widget build(BuildContext context) {
     return
       buildWidgetHeaderOnTrip(icon:
           Icons.inventory_2_rounded, name:
           LocaleKeys.MyLoadsScreen_loadDetails.tr(),child:
           Column(
             crossAxisAlignment: CrossAxisAlignment.start,
             children: [
           const SizedBox(height: 20),
           _buildLoadTypeAndWeight(),
           const SizedBox(height: 12),
           _buildVehicleAndPriority(),

           if (_hasDescription) ...[
             const SizedBox(height: 16),
             _buildDescriptionSection(),
           ],
           // if (_hasRequirements) ...[
           //   const SizedBox(height: 16),
           //   _buildRequirementsSection(),
           // ],
         ],
       ),
     );
   }

   Widget _buildLoadTypeAndWeight() {
     return Row(
       children: [
         Expanded(
           child: _DetailCard(
             icon: Icons.category_rounded,
             label: LocaleKeys.Add_Load_materialType.tr(),
             value: load.vehicleType,
             iconColor: AppColors.infoColor,
           ),
         ),
         const SizedBox(width: 12),
         Expanded(
           child: _DetailCard(
             icon: Icons.fitness_center_rounded,
             label: LocaleKeys.MyLoadsScreen_weight.tr(),
             value:"weight" //'${load.weight.toStringAsFixed(0)} '
                 '${LocaleKeys.MyLoadsScreen_kg.tr()}',
             iconColor: AppColors.warningColor,
           ),
         ),
       ],
     );
   }

   Widget _buildVehicleAndPriority() {
     return Row(
       children: [
         Expanded(
           child: _DetailCard(
             icon: Icons.local_shipping_rounded,
             label: LocaleKeys.Add_Load_vehicleType.tr(),
             value: load.vehicleType,
             iconColor: AppColors.primaryColor,
           ),
         ),
         const SizedBox(width: 12),
         Expanded(
           child: _DetailCard(
             icon: Icons.schedule_rounded,
             label: LocaleKeys.MyLoadsScreen_priorityVehicleRequired.tr(),
             value:load.status.name. toString(),
             iconColor:

             AppColors.successColor,
           ),
         ),
       ],
     );
   }



    Widget _buildDescriptionSection() {
     return Container(
       width: double.infinity,
       padding: const EdgeInsets.all(12),
       decoration: BoxDecoration(
         color: AppColors.neutralGray,
         borderRadius: BorderRadius.circular(12),
       ),
       child: Column(
         crossAxisAlignment: CrossAxisAlignment.start,
         children: [
           Text(
             LocaleKeys.MyLoadsScreen_description.tr(),
             style: AppTextStyles.labelLarge().copyWith(
               color: AppColors.textMuted,
             ),
           ),
           const SizedBox(height: 8),
           Text(
             load.description,
             style: AppTextStyles.bodyMedium(),
           ),
         ],
       ),
     );
   }


   bool get _hasDescription => load.description.isNotEmpty == true;

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
 }

 class _DetailCard extends StatelessWidget {
   final IconData icon;
   final String label;
   final String value;
   final Color iconColor;
   final bool fullWidth;

   const _DetailCard({
     Key? key,
     required this.icon,
     required this.label,
     required this.value,
     required this.iconColor,
     this.fullWidth = false,
   }) : super(key: key);

   @override
   Widget build(BuildContext context) {
     return Container(
       padding: const EdgeInsets.all(12),
       decoration: BoxDecoration(
         color: iconColor.withOpacity(0.1),
         borderRadius: BorderRadius.circular(12),
       ),
       child: Row(
         children: [
           Icon(
             icon,
             color: iconColor,
             size: 20,
           ),
           const SizedBox(width: 12),
           Expanded(
             child: Column(
               crossAxisAlignment: CrossAxisAlignment.start,
               children: [
                 Text(
                   label,
                   style: AppTextStyles.bodySmall().copyWith(
                     color: AppColors.textMuted,
                   ),
                 ),
                 const SizedBox(height: 2),
                 Text(
                   value,
                   style: AppTextStyles.headlineSmall(),
                   maxLines: fullWidth ? 2 : 1,
                   overflow: TextOverflow.ellipsis,
                 ),
               ],
             ),
           ),
         ],
       ),
     );
   }
 }

