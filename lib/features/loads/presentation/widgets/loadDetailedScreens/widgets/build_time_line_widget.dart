import 'package:flutter/material.dart';
 import 'package:easy_localization/easy_localization.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import '../../../../../../core/sharedWidgets/text_styles.dart';
import '../../../../../../core/utils/app_colors.dart';

import '../../../../../../generated/locale_keys.g.dart';
import '../../../../data/models/load_model.dart';

class EnhancedTimelineCard extends StatelessWidget {
  final LoadModel load;
  final VoidCallback? onViewAll;
  final RxList<TimelineEvent> timelineEvents;
  final Color Function(dynamic) getStatusColor;
  final double Function(dynamic) calculateProgress;

  const EnhancedTimelineCard({
    Key? key,
    required this.load,
    required this.timelineEvents,
    required this.getStatusColor,
    required this.calculateProgress,
    this.onViewAll,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      padding: const EdgeInsets.all(20),
      decoration: _buildCardDecoration(),
      child: Column(
        children: [
          _buildHeader(),
          const SizedBox(height: 20),
          _buildProgressBar(),
          const SizedBox(height: 20),
          _buildTimelineList(),
        ],
      ),
    );
  }

  // ============== Card Decoration ==============

  BoxDecoration _buildCardDecoration() {
    return BoxDecoration(
      color: AppColors.cardColor,
      borderRadius: BorderRadius.circular(20),
      border: Border.all(color: AppColors.borderColor),
      boxShadow: [
        BoxShadow(
          color: AppColors.textMuted.withOpacity(0.05),
          blurRadius: 10,
          offset: const Offset(0, 4),
        ),
      ],
    );
  }

  // ============== Header ==============

  Widget _buildHeader() {
    return Row(
      children: [
        _buildHeaderIcon(),
        const SizedBox(width: 12),
        Text(
          LocaleKeys.MyLoadsScreen_statusTimeline.tr(),
          style: AppTextStyles.headlineMedium(),
        ),
        const Spacer(),
        _buildViewAllButton(),
      ],
    );
  }

  Widget _buildHeaderIcon() {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: AppColors.primaryColor.withOpacity(0.1),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Icon(
        Icons.timeline_rounded,
        color: AppColors.primaryColor,
        size: 24,
      ),
    );
  }

  Widget _buildViewAllButton() {
    return TextButton(
      onPressed: onViewAll,
      style: TextButton.styleFrom(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      ),
      child: Text(
        LocaleKeys.MyLoadsScreen_viewAll.tr(),
        style: AppTextStyles.labelLarge().copyWith(
          color: AppColors.primaryColor,
        ),
      ),
    );
  }

  // ============== Progress Bar ==============

  Widget _buildProgressBar() {
    final statusColor = getStatusColor(load.status);
    final progress = calculateProgress(load.status);

    return Container(
      height: 8,
      decoration: BoxDecoration(
        color: AppColors.neutralGray,
        borderRadius: BorderRadius.circular(4),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(4),
        child: LinearProgressIndicator(
          value: progress,
          backgroundColor: Colors.transparent,
          valueColor: AlwaysStoppedAnimation<Color>(statusColor),
        ),
      ),
    );
  }

  // ============== Timeline List ==============

  Widget _buildTimelineList() {
    return  Column(
        children: timelineEvents.asMap().entries.map((entry) {
          final index = entry.key;
          final event = entry.value;
          final isLast = index == timelineEvents.length - 1;

          return _TimelineItem(
            event: event,
            isLast: isLast,
          );
        }).toList(),

    );
  }
}

// ============== Timeline Item Widget ==============

class _TimelineItem extends StatelessWidget {
  final TimelineEvent event;
  final bool isLast;

  const _TimelineItem({
    Key? key,
    required this.event,
    required this.isLast,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildTimelineIndicator(),
          const SizedBox(width: 12),
          Expanded(child: _buildEventCard()),
        ],
      ),
    );
  }

  // ============== Timeline Indicator ==============

  Widget _buildTimelineIndicator() {
    return Column(
      children: [
        _buildCircleIcon(),
        if (!isLast) _buildConnectorLine(),
      ],
    );
  }

  Widget _buildCircleIcon() {
    return Container(
      width: 32,
      height: 32,
      decoration: BoxDecoration(
        color: event.isCompleted
            ? event.color
            : event.color.withOpacity(0.3),
        shape: BoxShape.circle,
      ),
      child: Icon(
        event.icon,
        color: Colors.white,
        size: 16,
      ),
    );
  }

  Widget _buildConnectorLine() {
    return Expanded(
      child: Container(
        width: 2,
        color: event.isCompleted
            ? event.color.withOpacity(0.3)
            : AppColors.borderColor,
      ),
    );
  }

  // ============== Event Card ==============

  Widget _buildEventCard() {
    return Container(
      margin: EdgeInsets.only(bottom: isLast ? 0 : 20),
      padding: const EdgeInsets.all(12),
      decoration: _buildEventCardDecoration(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildEventHeader(),
          const SizedBox(height: 4),
          _buildEventDescription(),
          const SizedBox(height: 6),
          _buildEventTime(),
        ],
      ),
    );
  }

  BoxDecoration _buildEventCardDecoration() {
    return BoxDecoration(
      color: event.isCompleted
          ? event.color.withOpacity(0.1)
          : AppColors.neutralGray,
      borderRadius: BorderRadius.circular(12),
      border: Border.all(
        color: event.isCompleted
            ? event.color.withOpacity(0.3)
            : AppColors.borderColor,
      ),
    );
  }

  Widget _buildEventHeader() {
    return Row(
      children: [
        Expanded(child: _buildEventTitle()),
        if (event.status != null) _buildStatusBadge(),
      ],
    );
  }

  Widget _buildEventTitle() {
    return Text(
      event.title,
      style: AppTextStyles.headlineSmall().copyWith(
        color: event.isCompleted
            ? AppColors.textPrimary
            : AppColors.textMuted,
      ),
    );
  }

  Widget _buildStatusBadge() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: event.isCompleted
            ? AppColors.successColor.withOpacity(0.1)
            : AppColors.neutralGray,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Text(
        event.status!,
        style: AppTextStyles.bodySmall().copyWith(
          fontWeight: FontWeight.w600,
          color: event.isCompleted
              ? AppColors.successColor
              : AppColors.textMuted,
        ),
      ),
    );
  }

  Widget _buildEventDescription() {
    return Text(
      event.description,
      style: AppTextStyles.bodySmall().copyWith(
        color: AppColors.textSecondary,
      ),
    );
  }

  Widget _buildEventTime() {
    return Row(
      children: [
        Icon(
          Icons.access_time_rounded,
          size: 12,
          color: AppColors.textMuted,
        ),
        const SizedBox(width: 4),
        Text(
          event.getFormattedTime(),
          style: AppTextStyles.bodySmall(),
        ),
      ],
    );
  }
}

// ============== Timeline Event Model ==============

class TimelineEvent {
  final String title;
  final String description;
  final String? status;
  final IconData icon;
  final Color color;
  final DateTime timestamp;
  final bool isCompleted;

  TimelineEvent({
    required this.title,
    required this.description,
    this.status,
    required this.icon,
    required this.color,
    required this.timestamp,
    required this.isCompleted,
  });

  String getFormattedTime() {
    return DateFormat('MMM dd, yyyy - HH:mm').format(timestamp);
  }
}