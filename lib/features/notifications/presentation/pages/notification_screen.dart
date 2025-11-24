import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:user_app_iraq/core/utils/app_colors.dart';
import 'package:user_app_iraq/generated/locale_keys.g.dart';

import '../../../../core/sharedWidgets/top_screen_widget.dart';
import '../../../../core/utils/app_constants.dart';

import '../../data/models/notification_model.dart';
import '../widgets/all_notifications.dart';
import '../widgets/empty_notification.dart';
import '../widgets/notification_loading.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  List<NotificationModel> notifications = [
    NotificationModel(
      createdAt: DateTime.now(),
      title: 'New Load Assigned',
      message:
          'A new heavy load has been assigned to your account. Check the details and confirm pickup time.',
    ),
    NotificationModel(
      createdAt: DateTime.now(),
      title: 'Bid Received',
      message:
          'You have received a new bid on one of your posted loads. Review the offer and respond as soon as possible.',
    ),
    NotificationModel(
      createdAt: DateTime.now(),
      title: 'Shipment Status Update',
      message:
          'Your current shipment status has been updated. Open the app to see the latest tracking info.',
    ),
    NotificationModel(
      createdAt: DateTime.now(),
      title: 'Document Verification Required',
      message:
          'Please upload the required documents for your heavy transport load to continue the process.',
    ),
    NotificationModel(
      createdAt: DateTime.now(),
      title: 'Payment Successful',
      message:
          'Your payment for the shipment has been successfully processed. You can download the invoice from the app.',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 0,
        elevation: 0,
        backgroundColor: AppColors.primaryColor,
      ),
      body: Column(
        children: [
          TopScreenWidget(
            screenIcon:
      Icons.notifications,


            text: LocaleKeys.Notifications_title.tr(),
            iconButton: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon:Icon(Icons.arrow_back,color: Colors.white,)
            ),
          ),
          ShowAllNotificationScreen(notifications: notifications),
        ],
      ),
    );
  }
}
