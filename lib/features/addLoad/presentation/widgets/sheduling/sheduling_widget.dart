import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:user_app_iraq/features/addLoad/presentation/widgets/build_card_info.dart';

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

  // ---------------------- CARD UI ----------------------
  Widget buildSchedulingCard() {
    return buildCard(
      title: "Scheduling",
       icon: Icons.schedule_rounded,
       children: [
        _buildDateTimeTile(
          title: "Pickup Date *",
          dateTime: pickupDate,
          onTap: _selectPickupDateTime,
          icon: Icons.event_outlined,
          color: Colors.deepOrange,
        ),
        const SizedBox(height: 16),

        _buildDateTimeTile(
          title: "Delivery Date (Optional)",
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

  // ---------------------- TILE UI ----------------------
  Widget _buildDateTimeTile({
    required String title,
    required DateTime? dateTime,
    required VoidCallback onTap,
    required IconData icon,
    required Color color,
  }) {
    final hasDateTime = dateTime != null;

    return Material(
      borderRadius: BorderRadius.circular(16),
      color: Colors.transparent,
      child: InkWell(
        borderRadius: BorderRadius.circular(16),
        onTap: onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 250),
          padding: const EdgeInsets.all(18),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            border: Border.all(
              color: hasDateTime ? color : Colors.grey.shade300,
              width: hasDateTime ? 2 : 1,
            ),
            color: hasDateTime ? color.withOpacity(0.08) : Colors.white,
            boxShadow: [
              BoxShadow(
                color: hasDateTime
                    ? color.withOpacity(0.25)
                    : Colors.grey.withOpacity(0.1),
                blurRadius: hasDateTime ? 10 : 6,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: Row(
            children: [
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: hasDateTime ? color : Colors.grey[400],
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Icon(icon, color: Colors.white, size: 20),
              ),
              const SizedBox(width: 16),

              // Text
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 14,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      hasDateTime
                          ? DateFormat('MMM dd, yyyy - hh:mm a')
                          .format(dateTime!)
                          : 'Tap to select date & time',
                      style: TextStyle(
                        fontSize: 15,
                        color: hasDateTime ? Colors.black87 : Colors.grey[500],
                      ),
                    ),
                  ],
                ),
              ),

              Icon(
                hasDateTime ? Icons.check_circle : Icons.arrow_forward_ios,
                size: 20,
                color: hasDateTime ? color : Colors.grey[400],
              ),
            ],
          ),
        ),
      ),
    );
  }

  // ---------------------- PICKUP SELECTOR ----------------------
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

  // ---------------------- DURATION INFO ----------------------
  Widget _buildDurationInfo() {
    if (pickupDate == null || deliveryDate == null) {
      return const SizedBox.shrink();
    }

    final duration = deliveryDate!.difference(pickupDate!);
    final hours = duration.inHours;
    final minutes = duration.inMinutes % 60;

    return Text(
      "Estimated duration: $hours hrs $minutes min",
      style: const TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
