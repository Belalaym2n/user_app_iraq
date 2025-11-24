// import 'package:flutter/cupertino.dart';
//
// import '../../../../generated/locale_keys.g.dart';
// import '../../presentation/widgets/contactSupport/build_contact_widget.dart';
//
// class ContactModel{
//   List<Widget>contact=[
//
//       buildContactOption(
//       title: LocaleKeys.Support_callNow.tr(),
//       subtitle: LocaleKeys.Support_availableNow.tr(),
//       icon: Icons.phone_outlined,
//       iconColor: Colors.green,
//       enabled: true,
//       onTap: () {},
//     ),
//
//   // ---------------------------------------------------------
//   buildContactOption(
//       title: LocaleKeys.Support_chat.tr(),
//       subtitle: LocaleKeys.Support_online.tr(),
//
//       icon: Icons.chat_outlined,
//       iconColor: AppColors.primaryColor,
//       enabled: true,
//       onTap: () {},
//     ),
//
//
//   Widget _buildSendProblemOption(BuildContext context) {
//     return buildContactOption(
//       title: LocaleKeys.Problems_problem.tr(),
//       subtitle: LocaleKeys.Problems_enterProblem.tr(),
//
//       icon: Icons.report_problem_outlined,
//       iconColor: Colors.red,
//       enabled: true,
//       onTap: () {
//         Navigator.pushNamed(context, AppRoutes.problems);
//       },
//     );
//   }
//
//   ];
// }