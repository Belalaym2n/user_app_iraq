//
//
//
// import 'package:flutter/cupertino.dart' show Widget;
//
// class EnhancedLoadDetailsCardSectionOnScreen extends StatelessWidget {
//   final TripModel load;
//
//   const EnhancedLoadDetailsCardSectionOnScreen({
//     Key? key,
//     required this.load,
//   }) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
//       padding: const EdgeInsets.all(20),
//       decoration: _buildCardDecoration(),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           _buildHeader(),
//           const SizedBox(height: 20),
//           _buildLoadTypeAndWeight(),
//           const SizedBox(height: 12),
//           _buildVehicleAndPriority(),
//           if (_hasDimensions) ...[
//             const SizedBox(height: 12),
//             _buildDimensionsCard(),
//           ],
//           if (_hasDescription) ...[
//             const SizedBox(height: 16),
//             _buildDescriptionSection(),
//           ],
//           if (_hasRequirements) ...[
//             const SizedBox(height: 16),
//             _buildRequirementsSection(),
//           ],
//         ],
//       ),
//     );
//   }
//
//   // ============== Card Decoration ==============
//
//
//   // ============== Header ==============
//
//   Widget _buildHeader() {
//     return Row(
//       children: [
//         Container(
//           padding: const EdgeInsets.all(10),
//           decoration: BoxDecoration(
//             color: AppColors.primaryColor.withOpacity(0.1),
//             borderRadius: BorderRadius.circular(12),
//           ),
//           child: Icon(
//             Icons.inventory_2_rounded,
//             color: AppColors.primaryColor,
//             size: 24,
//           ),
//         ),
//         const SizedBox(width: 12),
//         Text(
//           Icons.inventory_2_rounded,
//           LocaleKeys.MyLoadsScreen_loadDetails.tr(),
//           style: AppTextStyles.headlineMedium(),
//         ),
//       ],
//     );
//   }
//
//   // ============== Load Type & Weight ==============
//
//
//   // ============== Vehicle & Priority ==============
//
//   // bool get _hasRequirements => load.requirements.isNotEmpty;
// }
//
// ============== Detail Card Widget ==============
//
//
// // ============== Requirement Chip Widget ==============
//
// class _RequirementChip extends StatelessWidget {
//   final String requirement;
//
//   const _RequirementChip({
//     Key? key,
//     required this.requirement,
//   }) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding: const EdgeInsets.symmetric(
//         horizontal: 12,
//         vertical: 6,
//       ),
//       decoration: BoxDecoration(
//         color: AppColors.secondaryColor.withOpacity(0.1),
//         borderRadius: BorderRadius.circular(20),
//         border: Border.all(
//           color: AppColors.secondaryColor.withOpacity(0.3),
//         ),
//       ),
//       child: Text(
//         requirement,
//         style: AppTextStyles.bodySmall().copyWith(
//           color: AppColors.secondaryColor,
//           fontWeight: FontWeight.w600,
//         ),
//       ),
//     );
//   }
// }