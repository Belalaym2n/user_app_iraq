import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:user_app_iraq/core/sharedWidgets/app_snack_bar.dart';
import 'package:user_app_iraq/core/utils/app_validator.dart';
import 'package:user_app_iraq/features/complaint/presentation/widgets/widgetItems/build_privacy.dart';
import 'package:user_app_iraq/features/complaint/presentation/widgets/widgetItems/section_header.dart';
import 'package:user_app_iraq/features/loads/presentation/widgets/offers/detailsScreen/offers_on_details_screen.dart';
import '../../../../../core/intialization/init_di.dart';
import '../../../../../core/sharedWidgets/custom_form_field.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_constants.dart';
import '../../../../../core/sharedWidgets/text_styles.dart';
import '../../../../../core/sharedWidgets/top_screen_widget.dart';
import '../../../data/models/complaint_mode.dart';
import '../../../domain/use_cases/send_complaint_use_case.dart';
import '../../complainBloc/complaint_blpc.dart';
import '../../complainBloc/complaint_events.dart';
import '../../complainBloc/copmlaint_states.dart';
import '../../pages/complaint_page.dart';
import '../common/build_card_continer.dart';
import '../widgetItems/complaint_type_section.dart';
import '../common/custom_larg_field.dart';
import '../common/gradiant_button.dart';
import '../widgetItems/priority_section.dart';

class ComplaintItem extends StatefulWidget {
  ComplaintItem({super.key});

  @override
  State<ComplaintItem> createState() => _ComplaintItemState();
}

class _ComplaintItemState extends State<ComplaintItem> {
  final _formKey = GlobalKey<FormState>();

  final _detailsController = TextEditingController();




  @override
  void dispose() {
    _detailsController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(children: [_buildForm(), _buildSubmitButton()]);
  }

  Widget _buildForm() {
    final state = context.watch<ComplaintBloc>().state;

    return SingleChildScrollView(
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            TopScreenWidget(showIcons: false, text: 'Submit Complaint'),
            SizedBox(height: AppConstants.h * 0.025),

            ComplaintTypeSection(
              selectedType: state.selectedType,
              onTypeSelected: (type) => context.read<ComplaintBloc>().add(
                UpdateComplaintTypeEvent(type),
              ),
            ),
            SizedBox(height: AppConstants.h * 0.025),
            _buildDetailsSection(),
            SizedBox(height: AppConstants.h * 0.025),
            PrioritySection(
              selectedPriority: state.selectedPriority,
              onPrioritySelected: (priority) => context
                  .read<ComplaintBloc>()
                  .add(UpdateComplaintPriorityEvent(priority)),
            ),
            SizedBox(height: AppConstants.h * 0.025),
            BuildPrivacy(
              changePrivacy: (value) => context.read<ComplaintBloc>().add(
                UpdateAnonymousEvent(value),
              ),
              isAnonymous: state.isAnonymous,
            ),
            SizedBox(height: AppConstants.h * 0.12),
          ],
        ),
      ),
    );
  }

  Widget _buildDetailsSection() {
    return CardContainer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SectionHeader(
            icon: Icons.description_outlined,
            title: 'Complaint Details',
            subtitle: 'Describe your issue in detail',
          ),
          SizedBox(height: AppConstants.h * 0.02),
          CustomTextField(
            controller: _detailsController,
            hint: 'Provide a detailed description of your complaint...',
            maxLines: 6,
            maxLength: 1000,
            validator: Validators.description,
          ),
        ],
      ),
    );
  }

  Widget _buildSubmitButton() {
    return Positioned(
      bottom: 0,
      left: 0,
      right: 0,
      child: Container(
        padding: EdgeInsets.all(AppConstants.w * 0.044),
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.08),
              blurRadius: 16,
              offset: const Offset(0, -4),
            ),
          ],
        ),
        child: SafeArea(
          child: GradientButton(
            onPressed: _submitComplaint,
            icon: Icons.send_rounded,
            text: 'Submit Complaint',
          ),
        ),
      ),
    );
  }

  void _submitComplaint() {
    if (!_formKey.currentState!.validate()) return;

    final state = context.read<ComplaintBloc>().state;

    if (state.selectedType == null) {
      AppSnackBar.showError(context, 'Please select complaint type');
      return;
    }
    final request = SubmitComplaintRequest(
      type: state.selectedType!,
      details: _detailsController.text.trim(),
      priority: state.selectedPriority,
      isAnonymous: state.isAnonymous,
    );

    context.read<ComplaintBloc>().add(
      SubmitComplaintEvent(request),
    );
  }

}
