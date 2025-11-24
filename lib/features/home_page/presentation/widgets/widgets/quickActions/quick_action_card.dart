import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:user_app_iraq/core/utils/app_colors.dart';
import 'package:user_app_iraq/core/utils/app_constants.dart';

class QuickActionCard extends StatefulWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  final Color color;
  final VoidCallback onTap;

  const QuickActionCard({
    Key? key,
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.color,
    required this.onTap,
  }) : super(key: key);

  @override
  State<QuickActionCard> createState() => _QuickActionCardState();
}

class _QuickActionCardState extends State<QuickActionCard> {
  bool _isPressed = false;

  @override
  Widget build(BuildContext context) {
    return AnimatedScale(
      scale: _isPressed ? 0.95 : 1.0,
      duration: const Duration(milliseconds: 100),
      child: Material(
        elevation: 8,
        borderRadius: _cardRadius,
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: _cardRadius,
          ),
          child: _buildInkWell(),
        ),
      ),
    );
  }

  Widget _buildInkWell() {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        borderRadius: _cardRadius,
        onTap: widget.onTap,
        onTapDown: (_) => setState(() => _isPressed = true),
        onTapUp: (_) => setState(() => _isPressed = false),
        onTapCancel: () => setState(() => _isPressed = false),
        child: Padding(
          padding: EdgeInsets.all(AppConstants.w * 0.044), // 16
          child: Row(
            children: [
              _buildLeadingIcon(),
              SizedBox(width: AppConstants.w * 0.033), // 12
              _buildTexts(),
              SizedBox(width: AppConstants.w * 0.01),
              _buildArrow(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildLeadingIcon() {
    return Container(
      width: AppConstants.w * 0.10,
      height: AppConstants.w * 0.10,
      decoration: BoxDecoration(
        color: AppColors.primaryColor.withOpacity(0.2),
        borderRadius: BorderRadius.circular(AppConstants.w * 0.028),
      ),
      child: Icon(
        widget.icon,
        color: AppColors.primaryColor,
        size: AppConstants.w * 0.055,
      ),
    );
  }

  Widget _buildTexts() {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            widget.title,
            style: TextStyle(
              color: AppColors.primaryColor,
              fontSize: AppConstants.w * 0.039,
              fontWeight: FontWeight.w700,
            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          SizedBox(height: AppConstants.h * 0.0025),
          Text(
            widget.subtitle,
            style: TextStyle(
              color: AppColors.primaryColor.withOpacity(0.8),
              fontSize: AppConstants.w * 0.028,
              fontWeight: FontWeight.w500,
            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }

  Widget _buildArrow() {
    return Container(
      width: AppConstants.w * 0.055,
      height: AppConstants.w * 0.055,
      decoration: BoxDecoration(
        color: AppColors.primaryColor.withOpacity(0.2),
        borderRadius: BorderRadius.circular(AppConstants.w * 0.014),
      ),
      child: Icon(
        Icons.arrow_forward_rounded,
        color: AppColors.primaryColor.withOpacity(0.9),
        size: AppConstants.w * 0.033,
      ),
    );
  }

  BorderRadius get _cardRadius =>
      BorderRadius.circular(AppConstants.w * 0.055); // 20
}
