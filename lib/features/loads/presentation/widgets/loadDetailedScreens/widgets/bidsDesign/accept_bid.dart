//
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:user_app_iraq/features/loads/data/models/bids_model.dart' show BidModel;
// import 'package:user_app_iraq/features/loads/data/models/load_model.dart' show LoadModel;
//
// import '../../../../../../../core/sharedWidgets/text_styles.dart';
// import '../../../../../../../core/utils/app_colors.dart';
// import '../../../../../data/models/bids_status_model.dart';
//
// class AcceptedBidWidget extends StatelessWidget {
//   final BidModel bid;
//
//   const AcceptedBidWidget({required this.bid});
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding: const EdgeInsets.all(16),
//       decoration: BoxDecoration(
//         color: AppColors.successColor.withOpacity(0.1),
//         borderRadius: BorderRadius.circular(12),
//       ),
//       child: Row(
//         children: [
//           Icon(Icons.check_circle, color: AppColors.successColor, size: 32),
//           const SizedBox(width: 12),
//           Expanded(
//             child: Text(
//               "${bid.driverName}\nAccepted",
//               style: AppTextStyles.headlineSmall(),
//             ),
//           ),
//           Text(
//             "${bid.bidAmount.toStringAsFixed(0)} د.ع",
//             style: AppTextStyles.displayMedium()
//                 .copyWith(color: AppColors.successColor),
//           ),
//         ],
//       ),
//     );
//   }
// }
