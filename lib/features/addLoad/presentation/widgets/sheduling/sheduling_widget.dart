import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
  import 'package:user_app_iraq/features/addLoad/presentation/widgets/build_card_info.dart';
import 'package:user_app_iraq/generated/locale_keys.g.dart';

import '../../bloc/add_load_bloc.dart';
import '../../bloc/add_load_event.dart';
import '../../bloc/add_load_states.dart';
import 'build_date_time.dart';

class SchedulingWidget extends StatelessWidget {
  const SchedulingWidget({super.key});

  Future<DateTime?> _pickDate(BuildContext context) {
    return showDatePicker(
      context: context,
      firstDate: DateTime.now(),
      lastDate: DateTime(2030),
      initialDate: DateTime.now(),
    );
  }

  Future<TimeOfDay?> _pickTime(BuildContext context) {
    return showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );
  }

  Future<void> _selectPickupDateTime(BuildContext context) async {
    final date = await _pickDate(context);
    if (date == null) return;

    final time = await _pickTime(context);
    if (time == null) return;

    final selected = DateTime(date.year, date.month, date.day, time.hour, time.minute);

    context.read<AddLoadBloc>().add(
      SelectPickupDateEvent(selected),
    );
  }

  Future<void> _selectDeliveryDateTime(BuildContext context) async {
    final date = await _pickDate(context);
    if (date == null) return;

    final time = await _pickTime(context);
    if (time == null) return;

    final selected = DateTime(date.year, date.month, date.day, time.hour, time.minute);

    context.read<AddLoadBloc>().add(
      SelectDeliveryDateEvent(selected),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AddLoadBloc, AddLoadState>(
      builder: (context, state) {
        return buildCard(
          title: "Scheduling",
          icon: Icons.schedule_rounded,
          children: [
            buildDateTimeTile(
              title: LocaleKeys.Add_Load_pickupDate.tr(),
              dateTime: state.pickupDate,
              onTap: () => _selectPickupDateTime(context),
              icon: Icons.event_outlined,
              color: Colors.deepOrange,
            ),

            const SizedBox(height: 16),

            buildDateTimeTile(
              title: LocaleKeys.Add_Load_deliveryDate.tr(),
              dateTime: state.deliveryDate,
              onTap: () => _selectDeliveryDateTime(context),
              icon: Icons.event_available_outlined,
              color: Colors.blueAccent,
            ),

            const SizedBox(height: 12),
            _buildDurationInfo(state),
          ],
        );
      },
    );
  }

  Widget _buildDurationInfo(AddLoadState state) {
    if (state.pickupDate == null || state.deliveryDate == null) {
      return const SizedBox.shrink();
    }

    final duration = state.deliveryDate!.difference(state.pickupDate!);
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
