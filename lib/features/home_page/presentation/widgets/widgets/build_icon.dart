import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BuildIcon extends StatefulWidget {
    BuildIcon({super.key,required this.iconData});
    IconData iconData;
  @override
  State<BuildIcon> createState() => _BuildIconState();
}

class _BuildIconState extends State<BuildIcon> {
  @override
  Widget build(BuildContext context) {
    return     Container(
      width: 32, // Reduced from 40
      height: 32, // Reduced from 40
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.2),
        borderRadius: BorderRadius.circular(10), // Reduced from 12
        border: Border.all(
          color: Colors.white.withOpacity(0.3),
          width: 1,
        ),
      ),
      child:   Icon(
       widget. iconData,
        color: Colors.white,
        size: 20, // Reduced from 24
      ),
    );
  }
}
