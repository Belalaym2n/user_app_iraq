import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
  import 'package:user_app_iraq/features/addLoad/presentation/widgets/build_card_info.dart';
import 'package:user_app_iraq/generated/locale_keys.g.dart';

import 'build_date_time.dart';

class SchedulingWidget extends StatefulWidget {
  const SchedulingWidget({super.key});

  @override
  State<SchedulingWidget> createState() => _SchedulingWidgetState();
}

class _SchedulingWidgetState extends State<SchedulingWidget> {
  DateTime? pickupDate;
  DateTime? deliveryDate;

  @override
  Widget build(BuildContext context) {
    return buildSchedulingCard();
  }

   Widget buildSchedulingCard() {
    return buildCard(
      title: "Scheduling",
       icon: Icons.schedule_rounded,
       children: [
         buildDateTimeTile(
          title: LocaleKeys.Add_Load_pickupLocation.tr(),
          dateTime: pickupDate,
          onTap: _selectPickupDateTime,
          icon: Icons.event_outlined,
          color: Colors.deepOrange,
        ),
        const SizedBox(height: 16),

         buildDateTimeTile(
          title:LocaleKeys.Add_Load_deliveryLocation.tr()  ,// "Delivery Date (Optional)",
          dateTime: deliveryDate,
          onTap: _selectDeliveryDateTime,
          icon: Icons.event_available_outlined,
          color: Colors.blueAccent,
        ),

        const SizedBox(height: 12),
        _buildDurationInfo(),
      ],
    );
  }

  Future<void> _selectPickupDateTime() async {
    final date = await _pickDate();
    if (date == null) return;

    final time = await _pickTime();
    if (time == null) return;

    setState(() {
      pickupDate = DateTime(date.year, date.month, date.day, time.hour, time.minute);
    });
  }

  // ---------------------- DELIVERY SELECTOR ----------------------
  Future<void> _selectDeliveryDateTime() async {
    final date = await _pickDate();
    if (date == null) return;

    final time = await _pickTime();
    if (time == null) return;

    setState(() {
      deliveryDate = DateTime(date.year, date.month, date.day, time.hour, time.minute);
    });
  }

  // ---------------------- DATE PICKER ----------------------
  Future<DateTime?> _pickDate() async {
    return showDatePicker(
      context: context,
      firstDate: DateTime.now(),
      lastDate: DateTime(2030),
      initialDate: DateTime.now(),
    );
  }

  // ---------------------- TIME PICKER ----------------------
  Future<TimeOfDay?> _pickTime() async {
    return showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );
  }

   Widget _buildDurationInfo() {
    if (pickupDate == null || deliveryDate == null) {
      return const SizedBox.shrink();
    }

    final duration = deliveryDate!.difference(pickupDate!);
    final hours = duration.inHours;
    final minutes = duration.inMinutes % 60;

    return Text(
      "${LocaleKeys.Add_Load_estimatedDuration.tr()}: $hours hrs $minutes min",
      style: const TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
