import 'dart:io';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:user_app_iraq/core/sharedWidgets/custom_form_field.dart';
import 'package:user_app_iraq/generated/locale_keys.g.dart';

import '../../../../core/sharedWidgets/buttons.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_constants.dart';

class AddProblemItem extends StatefulWidget {
  AddProblemItem({super.key, required this.problemController});

  TextEditingController problemController;

  @override
  State<AddProblemItem> createState() => _AddProblemItemState();
}

class _AddProblemItemState extends State<AddProblemItem>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _fadeAnimation;
  late Animation<Offset> _slideAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 1000),
      vsync: this,
    )..forward();

    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(_controller);
    _slideAnimation = Tween<Offset>(
      begin: Offset(0.0, 0.1),
      end: Offset.zero,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));
    //
    widget.problemController.addListener(updateValidation);
    // TODO: implement initState
    updateValidation();
  }

  final ValueNotifier<bool> isValidNotifier = ValueNotifier(false);

  void updateValidation() {
    isValidNotifier.value = widget.problemController.text.isNotEmpty;
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back_ios_new, color: Colors.white),
          ),
          title: Text(
            "Problems",
            style: TextStyle(
              color: Colors.white,
              fontSize: AppConstants.w * 0.062,
              fontWeight: FontWeight.bold,
            ),
          ),
          centerTitle: true,
          automaticallyImplyLeading: false,
          backgroundColor: AppColors.primaryColor,
          elevation: 0,
        ),
        body: Padding(
          padding: EdgeInsets.all(AppConstants.w * 0.04),
          child: FadeTransition(
            opacity: _fadeAnimation,
            child: SlideTransition(
              position: _slideAnimation,
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(LocaleKeys.Problems_writeProblemDetails.tr(),
                      style: TextStyle(
                        color: AppColors.primaryColor,
                        fontSize: AppConstants.w * 0.047,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: AppConstants.h * 0.012),
                     SizedBox(height: AppConstants.h * 0.012),

                    Padding(
                      padding: EdgeInsets.only(
                        bottom:
                            MediaQuery.of(context).viewInsets.bottom +
                            8, // خليها تتحرك مع الكيبورد
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: CustomTextField(
                          label: LocaleKeys.Problems_problem.tr(),
                          hint: LocaleKeys.Problems_enterProblem.tr(),
                          controller: TextEditingController(),
                          textInputAction: TextInputAction.next,
                          prefixIcon: const Icon(Icons.person_outline),
                        ),
                      ),
                    ),
                    SizedBox(height: AppConstants.h * 0.035),
                    ValueListenableBuilder<bool>(
                      valueListenable: isValidNotifier,
                      builder: (context, isValid, _) {
                        return Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: large_button(
                            isDisable: isValid,
                            onPressed: () {},
                            buttonName:LocaleKeys.Problems_submitIssue.tr(),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
