import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:user_app_iraq/core/utils/app_colors.dart';
import 'package:user_app_iraq/core/utils/app_constants.dart';
import 'package:user_app_iraq/features/loads/data/models/offers_model.dart';
import 'package:user_app_iraq/features/loads/data/models/trip_details_model.dart';
import 'package:user_app_iraq/features/loads/presentation/widgets/loadDetailedScreens/common_widgets/build_widget_header.dart';
import 'package:user_app_iraq/generated/locale_keys.g.dart';

import '../detailsScreen/offers_on_details_screen.dart';
import '../mainScreen/offer_header.dart';

class DriverAccepted extends StatelessWidget {
  DriverAccepted({super.key, required this.offerModel});

  OfferModel offerModel;

  @override
  Widget build(BuildContext context) {
    return buildAcceptedBidWidget();
  }

  Widget buildAcceptedBidWidget() {
    return buildWidgetHeaderOnTrip(
      icon: Icons.gavel_rounded,
      name: LocaleKeys.MyLoadsScreen_bidManagement.tr(),
      child: Column(
        children: [
          SizedBox(height: AppConstants.h * 0.02),

          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.green[50],
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: Colors.green[200]!),
            ),
            child: Column(
              children: [
                SizedBox(height: AppConstants.h * 0.02),
                Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: Colors.green[100],
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                        Icons.check_circle,
                        color: Colors.green[700],
                        size: 24,
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            LocaleKeys.MyLoadsScreen_transportAssigned.tr(),
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.green[800],
                            ),
                          ),
                          Text(
                            offerModel.driver.user.name,
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.green[700],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Text(
                      'د.ع ${offerModel.offeredPrice.toStringAsFixed(0)}',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: Colors.green[700],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                Row(
                  children: [
                    Expanded(
                      child: _buildBidDetail(
                        icon: Icons.star,
                        label: LocaleKeys.MyLoadsScreen_rateTrip.tr(),
                        value: offerModel.driver.rating.toStringAsFixed(1),
                      ),
                    ),
                    Expanded(
                      child: _buildBidDetail(
                        icon: Icons.local_shipping,
                        label: LocaleKeys.MyLoadsScreen_totalLoad.tr(),
                        value: '${offerModel.driver.totalRides}',
                      ),
                    ),
                    Expanded(
                      child: _buildBidDetail(
                        icon: Icons.schedule,
                        label: LocaleKeys.Add_Load_scheduling.tr(),
                        value: DateFormat(
                          'MMM dd',
                        ).format(offerModel.createdAt),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBidDetail({
    required IconData icon,
    required String label,
    required String value,
  }) {
    return Column(
      children: [
        Icon(icon, color: Colors.green[600], size: 20),
        const SizedBox(height: 4),
        Text(
          value,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
        ),
        Text(
          label,
          style: TextStyle(
            fontSize: 10,
            color: AppColors.surfaceColor.withOpacity(0.6),
          ),
        ),
      ],
    );
  }
}
