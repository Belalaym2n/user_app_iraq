import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:user_app_iraq/features/loads/data/models/trip_details_model.dart';
import '../../../../../../core/sharedWidgets/text_styles.dart';
import '../../../../../../core/utils/app_colors.dart';

import '../../../../../../generated/locale_keys.g.dart';
import '../../../../data/models/last_trip_model.dart';
import '../../../../data/models/trip_status.dart';

class TripTimelineScreen extends StatelessWidget {
  TripTimelineScreen({super.key, required this.tripDetailsModel});

  TripDetailsModel tripDetailsModel;

  @override
  Widget build(BuildContext context) {
    final events = [
      TimelineEvent(
        title: 'Trip Created',
        description: 'Trip request has been created',
        status: TripStatus.pending,
        icon: Icons.assignment_turned_in_outlined,
        timestamp:tripDetailsModel.createdAt!),

      if(tripDetailsModel.acceptedAt!=null)
        TimelineEvent(
            title: LocaleKeys.MyLoadsScreen_accepted.tr(),
            description:  'Trip request has been accepted',
            status: tripDetailsModel.status,
            icon: Icons.assignment_turned_in_outlined,
            timestamp:tripDetailsModel.acceptedAt!),
      if(tripDetailsModel.startedAt!=null)
        TimelineEvent(
            title: LocaleKeys.MyLoadsScreen_biddingStarted.tr(),
            description:  'Trip request has been started',
            status: tripDetailsModel.status,
            icon: Icons.assignment_turned_in_outlined,
            timestamp:tripDetailsModel.startedAt!),
      if(tripDetailsModel.cancelledAt!=null)
        TimelineEvent(
            title: LocaleKeys.MyLoadsScreen_cancelled.tr(),
            description:  'Trip request has been cancelled',
            status: TripStatus.cancelled,
            icon: Icons.assignment_turned_in_outlined,
            timestamp:tripDetailsModel.cancelledAt!),

        if(tripDetailsModel.completedAt!=null)
        TimelineEvent(
            title: LocaleKeys.MyLoadsScreen_completed.tr(),
            description:  'Trip request has been completed',
            status: tripDetailsModel.status,
            icon: Icons.assignment_turned_in_outlined,
            timestamp:tripDetailsModel.completedAt !),
    ];

    return SingleChildScrollView(
      child: EnhancedTimelineCard(
        trip: tripDetailsModel,
        timelineEvents: events,
      ),
    );
  }
}

class EnhancedTimelineCard extends StatelessWidget {
  final TripDetailsModel trip;
  final List<TimelineEvent> timelineEvents;
  final VoidCallback? onViewAll;

  const EnhancedTimelineCard({
    super.key,
    required this.trip,
    required this.timelineEvents,
    this.onViewAll,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(16),
      padding: const EdgeInsets.all(20),
      decoration: _cardDecoration,
      child: Column(
        children: [
          _Header(onViewAll: onViewAll),
          const SizedBox(height: 20),
          _ProgressBar(status: trip.status),
          const SizedBox(height: 20),
          _TimelineList(events: timelineEvents),
        ],
      ),
    );
  }
}


class _Header extends StatelessWidget {
  final VoidCallback? onViewAll;

  const _Header({this.onViewAll});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        _IconBox(),
        const SizedBox(width: 12),
        Text(
          LocaleKeys.MyLoadsScreen_statusTimeline.tr(),
          style: AppTextStyles.headlineMedium(),
        ),
        const Spacer(),
        if (onViewAll != null)
          TextButton(
            onPressed: onViewAll,
            child: Text(
              LocaleKeys.MyLoadsScreen_viewAll.tr(),
              style: AppTextStyles.labelLarge().copyWith(
                color: AppColors.primaryColor,
              ),
            ),
          ),
      ],
    );
  }
}

class _IconBox extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: AppColors.primaryColor.withOpacity(0.1),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Icon(Icons.timeline_rounded, color: AppColors.primaryColor),
    );
  }
}


class _ProgressBar extends StatelessWidget {
  final TripStatus status;

  const _ProgressBar({required this.status});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(4),
      child: LinearProgressIndicator(
        value: status.progress,
        backgroundColor: AppColors.neutralGray,
        valueColor: AlwaysStoppedAnimation(status.color),
        minHeight: 8,
      ),
    );
  }
}

class _TimelineList extends StatelessWidget {
  final List<TimelineEvent> events;

  const _TimelineList({required this.events});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: List.generate(events.length, (index) {
        return _TimelineItem(
          event: events[index],
          isLast: index == events.length - 1,
        );
      }),
    );
  }
}


class _TimelineItem extends StatelessWidget {
  final TimelineEvent event;
  final bool isLast;

  const _TimelineItem({required this.event, required this.isLast});

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _Indicator(event: event, isLast: isLast),
          const SizedBox(width: 12),
          Expanded(
            child: _EventCard(event: event, isLast: isLast),
          ),
        ],
      ),
    );
  }
}


class _Indicator extends StatelessWidget {
  final TimelineEvent event;
  final bool isLast;

  const _Indicator({required this.event, required this.isLast});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 32,
          height: 32,
          decoration: BoxDecoration(
            color: event.isGreen
                ? event.color
                : event.color.withOpacity(0.3),
            shape: BoxShape.circle,
          ),
          child: Icon(event.icon, size: 16, color: Colors.white),
        ),
        if (!isLast)
          Expanded(
            child: Container(
              width: 2,
              color: event.isGreen
                  ? event.color.withOpacity(0.3)
                  : AppColors.borderColor,
            ),
          ),
      ],
    );
  }
}


class _EventCard extends StatelessWidget {
  final TimelineEvent event;
  final bool isLast;

  const _EventCard({required this.event, required this.isLast});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: isLast ? 0 : 20),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: event.isGreen
            ? Colors.green .withOpacity(0.3)
            : AppColors.neutralGray,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: event.isGreen
              ? event.color.withOpacity(0.3)
              : AppColors.borderColor,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(event.title, style: AppTextStyles.headlineSmall(
          ).copyWith(

          )),
          const SizedBox(height: 4),
          Text(
            event.description,
            style: AppTextStyles.bodySmall().copyWith(
              color: AppColors.textSecondary,
            ),
          ),
          const SizedBox(height: 6),
          Row(
            children: [
              const Icon(Icons.access_time_rounded, size: 12),
              const SizedBox(width: 4),
              Text(event.formattedTime, style: AppTextStyles.bodySmall()),
            ],
          ),
        ],
      ),
    );
  }
}

final _cardDecoration = BoxDecoration(
  color: AppColors.cardColor,
  borderRadius: BorderRadius.circular(20),
  border: Border.all(color: AppColors.borderColor),
  boxShadow: [
    BoxShadow(
      color: Colors.black12.withOpacity(0.05),
      blurRadius: 10,
      offset: const Offset(0, 4),
    ),
  ],
);
