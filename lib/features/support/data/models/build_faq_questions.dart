import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../../../generated/locale_keys.g.dart';
import '../../presentation/widgets/contactSupport/buildFAQ/build_faq.dart';
class FaqItem {
  final String question;
  final String answer;
  final IconData icon;

  FaqItem({
    required this.question,
    required this.answer,
    required this.icon,
  });
}
 final Map<String, List<FaqItem>> faqs = {
LocaleKeys.Support_General.tr(): [
    FaqItem(
      question: LocaleKeys.Support_howDoesTheAppWork.tr(),
      answer: LocaleKeys.Support_howDoesTheAppWorkAnswer.tr(),
      icon: Icons.help_outline,
    ),
    FaqItem(
      question: LocaleKeys.Support_isServiceAvailable247.tr(),
      answer: LocaleKeys.Support_isServiceAvailable247Answer.tr(),
      icon: Icons.schedule,
    ),
    FaqItem(
      question: LocaleKeys.Support_whatAreasDoYouCover.tr(),
      answer: LocaleKeys.Support_whatAreasDoYouCoverAnswer.tr(),
      icon: Icons.location_on,
    ),
  ],

LocaleKeys.Support_Requests.tr(): [
    FaqItem(
      question: LocaleKeys.Support_howToCreateRequest.tr(),
      answer: LocaleKeys.Support_howToCreateRequestAnswer.tr(),
      icon: Icons.add_circle_outline,
    ),
    FaqItem(
      question: LocaleKeys.Support_canIEditRequest.tr(),
      answer: LocaleKeys.Support_canIEditRequestAnswer.tr(),
      icon: Icons.edit,
    ),
    FaqItem(
      question: LocaleKeys.Support_whatInfoToInclude.tr(),
      answer: LocaleKeys.Support_whatInfoToIncludeAnswer.tr(),
      icon: Icons.info_outline,
    ),
    FaqItem(
      question: LocaleKeys.Support_canICancelRequest.tr(),
      answer: LocaleKeys.Support_canICancelRequestAnswer.tr(),
      icon: Icons.cancel_outlined,
    ),
  ],

  LocaleKeys.Support_payment.tr(): [
    FaqItem(
      question: LocaleKeys.Support_howDoOffersWork.tr(),
      answer: LocaleKeys.Support_howDoOffersWorkAnswer.tr(),
      icon: Icons.local_offer,
    ),
    FaqItem(
      question: LocaleKeys.Support_whenDoIPay.tr(),
      answer: LocaleKeys.Support_whenDoIPayAnswer.tr(),
      icon: Icons.payment,
    ),
    FaqItem(
      question: LocaleKeys.Support_areThereHiddenFees.tr(),
      answer: LocaleKeys.Support_areThereHiddenFeesAnswer.tr(),
      icon: Icons.money_off,
    ),
    FaqItem(
      question: LocaleKeys.Support_notSatisfiedWhatToDo.tr(),
      answer: LocaleKeys.Support_notSatisfiedWhatToDoAnswer.tr(),
      icon: Icons.sentiment_dissatisfied,
    ),
  ],

   LocaleKeys.Support_Tracking.tr(): [
    FaqItem(
      question: LocaleKeys.Support_howToTrackDelivery.tr(),
      answer: LocaleKeys.Support_howToTrackDeliveryAnswer.tr(),
      icon: Icons.my_location,
    ),
    FaqItem(
      question: LocaleKeys.Support_canIContactDriver.tr(),
      answer: LocaleKeys.Support_canIContactDriverAnswer.tr(),
      icon: Icons.phone,
    ),
    FaqItem(
      question: LocaleKeys.Support_whatIfDriverIsLate.tr(),
      answer: LocaleKeys.Support_whatIfDriverIsLateAnswer.tr(),
      icon: Icons.access_time,
    ),
    FaqItem(
      question: LocaleKeys.Support_howToConfirmDelivery.tr(),
      answer: LocaleKeys.Support_howToConfirmDeliveryAnswer.tr(),
      icon: Icons.check_circle_outline,
    ),
  ],
};
