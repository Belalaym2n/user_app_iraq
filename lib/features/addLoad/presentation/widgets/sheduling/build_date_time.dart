import 'dart:ui';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:user_app_iraq/generated/locale_keys.g.dart';

Widget  buildDateTimeTile({
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
                        .format(dateTime)
                        : LocaleKeys.Add_Load_tapToSelect.tr( ),
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
