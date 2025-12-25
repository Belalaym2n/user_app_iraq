import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_constants.dart';
import 'ad_details.dart';
import 'ad_images_carsoual.dart';


class AdDetailSheet extends StatefulWidget {
  final AdModel ad;

  const AdDetailSheet({super.key, required this.ad});

  @override
  State<AdDetailSheet> createState() => _AdDetailSheetState();
}

class _AdDetailSheetState extends State<AdDetailSheet> {
  int _currentImageIndex = 0;
  final PageController _imageController = PageController();

  @override
  void dispose() {
    _imageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: AppConstants.h * 0.85,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(24),
          topRight: Radius.circular(24),
        ),
      ),
      child: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AdImageCarousel(
                    images: widget.ad.images,
                    controller: _imageController,
                    currentIndex: _currentImageIndex,
                    onPageChanged: (index) {
                      setState(() => _currentImageIndex = index);
                    },
                  ),
                  AdDetailContent(ad: widget.ad),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
