import 'dart:io';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:user_app_iraq/core/sharedWidgets/custom_form_field.dart';
import 'package:user_app_iraq/features/sendProblem/presentation/widgets/screen_widgets/build_main_content.dart';
import 'package:user_app_iraq/features/sendProblem/presentation/widgets/screen_widgets/build_problem_header.dart';
import 'package:user_app_iraq/generated/locale_keys.g.dart';

import '../../../../core/sharedWidgets/buttons.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_constants.dart';
import '../../data/models/problem_category.dart';
import '../../data/models/problem_model.dart';
import '../bloc/events.dart';
import '../bloc/problem_bloc.dart';

class AddProblemItem extends StatefulWidget {
  AddProblemItem({super.key});

  @override
  State<AddProblemItem> createState() => _AddProblemItemState();
}

class _AddProblemItemState extends State<AddProblemItem> {
  String? selectedCategory;
  TextEditingController problemController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 0,
        backgroundColor: AppColors.primaryColor,
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
         child: Form(
          key: _formKey,
          child: Column(
            children: [
              build_problem_header(),
              ProblemMainContent(
                problem: problemController,
              ),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: large_button(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      final bloc = context.read<ProblemBloc>();
                      final problem = ProblemModel(
                        category: categories
                            .indexOf(bloc.selectedCategory ?? "")
                            .toString(),
                        description: problemController.text,
                      );

                      context.read<ProblemBloc>().add(
                        SubmitProblemEvent(problem),
                      );
                    }
                  },
                  buttonName: LocaleKeys.Problems_submitIssue.tr(),
                ),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
