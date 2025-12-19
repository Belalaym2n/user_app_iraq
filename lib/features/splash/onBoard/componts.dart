import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:user_app_iraq/generated/locale_keys.g.dart';
import '../../../config/routes/app_router.dart';
import '../../../core/utils/app_colors.dart';


class BaseAppButton extends StatelessWidget {
  final bool isLoading;
  final String text;
  final VoidCallback onTap;
  final bool isOutlined;
  final double fontSize;

  const BaseAppButton({
    super.key,
    required this.text,
    required this.onTap,
    this.isLoading = false,
    this.isOutlined = false,
    required this.fontSize,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: isLoading ? null : onTap,
      child: Container(
        height: 55,
        width: MediaQuery.of(context).size.width / 1.5,
        decoration: BoxDecoration(
          color: isOutlined ? Colors.transparent : AppColors.primaryColor,
          borderRadius: BorderRadius.circular(15),
          border: Border.all(
            color: AppColors.primaryColor,
            width: isOutlined ? 2 : 0,
          ),
        ),
        child: Center(
          child: isLoading
              ? _buildLoading()
              : _buildText(text, fontSize, isOutlined),
        ),
      ),
    );
  }

  /// -------- Loading Indicator --------
  Widget _buildLoading() {
    return const SizedBox(
      height: 28,
      width: 28,
      child: CircularProgressIndicator(
        color: Colors.white,
        strokeWidth: 3,
      ),
    );
  }

  /// -------- Button Text --------
  Widget _buildText(String text, double fontSize, bool outlined) {
    return Text(
      text,
      style: TextStyle(
        fontSize: fontSize,
        color: outlined ? AppColors.primaryColor : Colors.white,
        fontFamily: "Nexa Bold 650",
      ),
    );
  }
}

class GetStartBtn extends StatefulWidget {
  const GetStartBtn({super.key});

  @override
  State<GetStartBtn> createState() => _GetStartBtnState();
}

class _GetStartBtnState extends State<GetStartBtn> {
  bool isLoading = false;

  void loadingHandler() {
    setState(() => isLoading = true);

    Future.delayed(const Duration(milliseconds: 700), () {
      setState(() => isLoading = false);
      Navigator.pushReplacementNamed(context, AppRoutes.login);
    });
  }

  @override
  Widget build(BuildContext context) {
    double fontSize = MediaQuery.of(context).size.width * 0.07;

    return Padding(
      padding: const EdgeInsets.only(top: 60),
      child: BaseAppButton(
        text: LocaleKeys.onboard_get_started_now.tr(),
        onTap: loadingHandler,
        isLoading: isLoading,
        isOutlined: false,
        fontSize: fontSize,
      ),
    );
  }
}

class SkipBtn extends StatelessWidget {
  final VoidCallback onTap;

  const SkipBtn({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    double fontSize = MediaQuery.of(context).size.width * 0.07;

    return Padding(
      padding: const EdgeInsets.only(top: 60),
      child: BaseAppButton(
        text: LocaleKeys.onboard_skip.tr(),
        onTap: onTap,
        isOutlined: true,
        isLoading: false,
        fontSize: fontSize,
      ),
    );
  }
}
