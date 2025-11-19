import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:user_app_iraq/core/utils/app_colors.dart';
import 'package:user_app_iraq/core/utils/app_images.dart';

import '../../../config/routes/app_router.dart';
import '../../../core/sharedWidgets/custom_loading.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    super.initState();


    WidgetsBinding.instance.addPostFrameCallback((_) {
      Future.delayed(const Duration(seconds: 3), () {
        print("navigation");
        Navigator.pushNamedAndRemoveUntil(
          context,
          AppRoutes.onBoard,
              (route) => false,
        );
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:AppColors.primaryColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // App Logo

            _build_logo(),
            const SizedBox(height: 60),

            const LoadingWidget(
              color: Colors.white,
              message: 'Loading...',
            ),
          ],
        ),
      ),
    );
  }
  _build_logo(){
    return  Container(
      width: 140,
      height: 140,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(70),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      padding: const EdgeInsets.all(20), // Add padding to prevent clipping
      child: ClipRRect(
        borderRadius: BorderRadius.circular(50),
        child: Image.asset(
         AppImages.logo,
          width: 100,
          height: 100,
          fit: BoxFit.contain, // Changed to contain to preserve aspect ratio
        ),
      ),
    );
  }
}