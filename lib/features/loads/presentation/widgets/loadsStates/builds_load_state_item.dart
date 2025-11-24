import 'package:flutter/material.dart';
import 'package:user_app_iraq/core/sharedWidgets/text_styles.dart';
import 'package:user_app_iraq/core/utils/app_colors.dart';

class BuildsLoadStateItem extends StatefulWidget {
  BuildsLoadStateItem({
    super.key,
    required this.color,
    required this.title,
    required this.value,
    required this.icon,
  });

  final String title;
  final String value;
  final IconData icon;
  final Color color;

  @override
  State<BuildsLoadStateItem> createState() => _BuildsLoadStateItemState();
}

class _BuildsLoadStateItemState extends State<BuildsLoadStateItem> {
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _buildStatItem(),
      ],
    );
  }




  Widget _buildStatItem() {
    return Column(
      children: [
        _buildIconContainer(),
        const SizedBox(height: 8),
        _buildValueText(),
        const SizedBox(height: 4),
        _buildTitleText(),
      ],
    );
  }

  Widget _buildIconContainer() {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            widget.color.withOpacity(0.15),
            widget.color.withOpacity(0.08),
          ],
        ),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: widget.color.withOpacity(0.2)),
        boxShadow: [
          BoxShadow(
            color: widget.color.withOpacity(0.1),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Icon(
        widget.icon,
        color: widget.color,
        size: 24,
      ),
    );
  }

  Widget _buildValueText() {
    return Text(
      widget.value,
      style: TextStyle(
        color: widget.color,
        fontSize: 20,
        fontWeight: FontWeight.bold,
        letterSpacing: -0.5,
      ),
    );
  }

  Widget _buildTitleText() {
    return Text(
      widget.title,
      textAlign: TextAlign.center,
      style: AppTextStyles.bodySmall(),
    );
  }
}
