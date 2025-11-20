import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:user_app_iraq/core/sharedWidgets/text_styles.dart';
import 'package:user_app_iraq/core/utils/app_colors.dart';

class BuildsLoadStateItem extends StatefulWidget {

  BuildsLoadStateItem({super.key,

    required this.color,
    required this.title,
    required this.value,
    required this.icon,
  });

  String title;
  String value;
  IconData icon;
  Color color;

  @override
  State<BuildsLoadStateItem> createState() => _BuildsLoadStateItemState();
}

class _BuildsLoadStateItemState extends State<BuildsLoadStateItem> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        _buildEnhancedStatItem(),
        _buildAnimatedDivider()
      ],
    );
  }
  Widget _buildAnimatedDivider(   ) {
    return Container(
      width: 3,
      height: 40,
      margin: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Colors.transparent,
            AppColors.primaryColor.withOpacity(0.2),
            Colors.transparent,
          ],
        ),
      ),
    );
  }
  Widget _buildEnhancedStatItem(

  ) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [widget.color.withOpacity(0.15), widget.color.withOpacity(0.08)],
            ),
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color:widget. color.withOpacity(0.2)),
            boxShadow: [
              BoxShadow(
                color:widget. color.withOpacity(0.1),
                blurRadius: 8,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: Icon(widget.icon, color: widget.color, size: 24),
        ),
        const SizedBox(height: 8),
        Text(
          widget.   value,
          style: TextStyle(
            color:widget. color,
            fontSize: 20,
            fontWeight: FontWeight.bold,
            letterSpacing: -0.5,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          widget.title,
          style: AppTextStyles.bodySmall(),

          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
