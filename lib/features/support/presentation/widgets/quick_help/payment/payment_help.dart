import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:user_app_iraq/core/utils/app_constants.dart';
import 'package:user_app_iraq/core/utils/app_colors.dart';

import 'build_contact_section.dart';
import 'build_payment_description.dart';
import 'build_payment_footor.dart';
import 'build_payment_header.dart';
import 'build_payment_methods.dart';

class PaymentHelpDialog extends StatelessWidget {
  const PaymentHelpDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.transparent,
      insetPadding: EdgeInsets.symmetric(
        horizontal: AppConstants.w * 0.055,
      ),
      child: Container(
        height: AppConstants.h * 0.60,
        constraints: BoxConstraints(
          maxWidth: AppConstants.w * 1.38,
        ),
        decoration: BoxDecoration(
          color: AppColors.surfaceColor,
          borderRadius: BorderRadius.circular(
            AppConstants.w * 0.066,
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            buildPaymentHeader(context),
            Flexible(
              child: SingleChildScrollView(
                padding: EdgeInsets.symmetric(
                  horizontal: AppConstants.w * 0.066,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: AppConstants.h * 0.010),
                    buildPaymentDescription(),
                    SizedBox(height: AppConstants.h * 0.031),
                    buildPaymentMethods(),
                    SizedBox(height: AppConstants.h * 0.031),
                    buildContactSection(),
                    SizedBox(height: AppConstants.h * 0.031),
                  ],
                ),
              ),
            ),
            buildPaymentFooter(context),
          ],
        ),
      ),
    );
  }
}
