import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:user_app_iraq/core/utils/app_constants.dart';
 import 'package:user_app_iraq/features/loads/presentation/widgets/loads_screens/loadsTap/tap_item.dart';
import 'package:user_app_iraq/generated/locale_keys.g.dart';

import '../../../../../../core/utils/app_colors.dart';
import '../../../bloc/getTripsBloc/trips_bloc.dart';
import '../../../bloc/getTripsBloc/trips_events.dart';


class OrderStatusWidget extends StatelessWidget {
  final bool isSelected;
  final String statusName;
  final int orderCount;

  const OrderStatusWidget({
    super.key,
    required this.isSelected,
    required this.statusName,
    required this.orderCount,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
       height: AppConstants.h*0.12,
         padding: EdgeInsets.symmetric(
        horizontal: AppConstants.w * 0.03,
        vertical: AppConstants.h * 0.01,
      ),
      decoration: BoxDecoration(
        color:
        isSelected?
            AppColors.primaryColor:
        Colors.white,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color:   Colors.grey.shade300,
          width: 2,
        ),


      ),
      child: Row(
         children: [
          Text(
            statusName,
            style: TextStyle(
              color: !isSelected ? AppColors.primaryColor
                  : Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: AppConstants.w * 0.038,
            ),
          ),
          const SizedBox(width: 6),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
            decoration: BoxDecoration(
              color: !isSelected ?  AppColors.primaryColor:
              Colors.white,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Text(
              orderCount.toString(),
              style: TextStyle(
                color: isSelected?AppColors.primaryColor:Colors.white,
                fontSize: AppConstants.w * 0.032,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
