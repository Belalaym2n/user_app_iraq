// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:user_app_iraq/features/loads/data/models/bids_model.dart' show BidModel;
// import 'package:user_app_iraq/features/loads/data/models/load_model.dart' show LoadModel;
//
// import '../../../../../../../core/sharedWidgets/text_styles.dart';
// import '../../../../../../../core/utils/app_colors.dart';
// import '../../../../../data/models/bids_status_model.dart';
//
// class BidItem extends StatelessWidget {
//   final BidModel bid;
//
//   const BidItem({required this.bid});
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       margin: const EdgeInsets.only(bottom: 12),
//       padding: const EdgeInsets.all(16),
//       decoration: BoxDecoration(
//         border: Border.all(color: AppColors.borderColor),
//         borderRadius: BorderRadius.circular(12),
//       ),
//       child: Row(
//         children: [
//           CircleAvatar(
//             radius: 22,
//             child: Text(bid.driverName[0].toUpperCase()),
//           ),
//           const SizedBox(width: 12),
//           Expanded(
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text(bid.driverName, style: AppTextStyles.headlineSmall()),
//                 Text("⭐ ${bid.driverRating}  |  ${bid.completedTrips} trips"),
//               ],
//             ),
//           ),
//           Text(
//             "${bid.bidAmount.toStringAsFixed(0)} د.ع",
//             style: AppTextStyles.headlineMedium(),
//           ),
//         ],
//       ),
//     );
//   }
// }
