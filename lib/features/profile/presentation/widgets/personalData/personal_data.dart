import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:user_app_iraq/features/profile/presentation/widgets/personalData/user_info_card.dart';
import '../../../../../core/sharedWidgets/custom_loading.dart';
import '../../../../../core/sharedWidgets/text_styles.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/sharedWidgets/app_snack_bar.dart';
import '../../../../../generated/locale_keys.g.dart';
import '../../bloc/profile_bloc.dart';
import '../../bloc/profile_event.dart';
import '../../bloc/profile_states.dart';
import '../../../data/models/profile_model.dart';
import 'editable_info_card.dart';

class EditablePersonalInfoBottomSheet extends StatefulWidget {
  final UserProfileModel userProfile;

  const EditablePersonalInfoBottomSheet({
    Key? key,
    required this.userProfile,
  }) : super(key: key);

  static void show(
      BuildContext context, {
        required UserProfileModel userProfile,
      }) {
    final profileBloc = context.read<ProfileBloc>(); // احفظ الـ bloc

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => BlocProvider.value(
        value: profileBloc, // مرر الـ bloc الموجود
        child: EditablePersonalInfoBottomSheet(
          userProfile: userProfile,
        ),
      ),
    );
  }

  @override
  State<EditablePersonalInfoBottomSheet> createState() =>
      _EditablePersonalInfoBottomSheetState();
}

class _EditablePersonalInfoBottomSheetState
    extends State<EditablePersonalInfoBottomSheet> {
  String? _editingField;
  final Map<String, TextEditingController> _controllers = {};

  @override
  void initState() {
    super.initState();
    _controllers['name'] = TextEditingController(text: widget.userProfile.name);
    _controllers['email'] = TextEditingController(text: widget.userProfile.email);
    _controllers['phone'] = TextEditingController(text: widget.userProfile.phone);
  }

  @override
  void dispose() {
    _controllers.values.forEach((controller) => controller.dispose());
    super.dispose();
  }

  void _startEditing(String field) {
    setState(() {
      _editingField = field;
    });
  }

  void _saveField(String field) {
    final name = _controllers['name']?.text ?? widget.userProfile.name;
    final email = _controllers['email']?.text ?? widget.userProfile.email;
    final phone = _controllers['phone']?.text ?? widget.userProfile.phone;

    // Create updated user model
    final updatedUser = UserProfileModel(
      type: '',

      id: widget.userProfile.id,
      name: name,
      email: email,
      phone: phone,
      photoUrl: widget.userProfile.photoUrl,
      dateOfBirth: widget.userProfile.dateOfBirth,
      city: widget.userProfile.city,
      state: widget.userProfile.state,
      postalCode: widget.userProfile.postalCode,
      country: widget.userProfile.country,
      emailVerifiedAt: widget.userProfile.emailVerifiedAt,
      twoFactorEnabled: widget.userProfile.twoFactorEnabled,
      createdAt: widget.userProfile.createdAt,
      updatedAt: widget.userProfile.updatedAt,
    );

    // Dispatch update event to Bloc
    context.read<ProfileBloc>().add(
      UpdateProfileEvent(
        userId: widget.userProfile.id,
        user: updatedUser,
      ),
    );

    setState(() {
      _editingField = null;
    });
  }

  void _cancelEditing() {
    _controllers['name']?.text = widget.userProfile.name;
    _controllers['email']?.text = widget.userProfile.email;
    _controllers['phone']?.text = widget.userProfile.phone;

    setState(() {
      _editingField = null;
    });
  }


  @override
  Widget build(BuildContext context) {
    return BlocListener<ProfileBloc, ProfileState>(
      listener: (context, state) {
        if(state is ProfileUpdateLoading ){
          showDialog(
            context: context,
            barrierDismissible: false,
            builder: (context) => const Dialog(
              backgroundColor: Colors.transparent,
              child: CustomLoadingWidget(),
            ),
          );
        }
        if (state is ProfileUpdateSuccess) {
          Navigator.pop(context);

          AppSnackBar.showSuccess(context, 'تم تحديث البيانات بنجاح');
          Navigator.pop(context);
        } else if (state is ProfileUpdateError) {
          Navigator.pop(context);

          AppSnackBar.showError(context, state.message);
          Navigator.pop(context);

        }
      },
      child: Padding(
        padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom,
        ),
        child: Container(
          constraints: BoxConstraints(
            maxHeight: MediaQuery.of(context).size.height * 0.9,
          ),
          padding: const EdgeInsets.all(20),
          decoration: _buildSheetDecoration(),
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),

            child: Column(
               crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildHeader(context),
                const SizedBox(height: 20),
                _buildInfoCards(),
                  const SizedBox(height: 8),
              ],
            ),
          ),
        ),
      ),
    );
  }


  BoxDecoration _buildSheetDecoration() {
    return BoxDecoration(
      color: AppColors.surfaceColor,
      borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
      boxShadow: [
        BoxShadow(
          color: AppColors.textMuted.withOpacity(0.1),
          blurRadius: 10,
          offset: const Offset(0, -2),
        ),
      ],
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: AppColors.primaryColor.withOpacity(0.1),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Icon(
            Icons.person_rounded,
            color: AppColors.primaryColor,
            size: 24,
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Text(
            LocaleKeys.Profile_personal_information.tr(),
            style: AppTextStyles.displaySmall(),
          ),
        ),
        IconButton(
          onPressed: () => Navigator.of(context).pop(),
          icon: Icon(Icons.close_rounded, color: AppColors.textMuted, size: 24),
        ),
      ],
    );
  }

  Widget _buildInfoCards() {
    return Column(
      children: [
        EditableInfoCard(
          title: LocaleKeys.register_full_name.tr(),
          icon: Icons.person_outline_rounded,
          color: AppColors.primaryColor,
          controller: _controllers['name']!,
          isEditing: _editingField == 'name',
          onEdit: () => _startEditing('name'),
          onSave: () => _saveField('name'),
          onCancel: _cancelEditing,
        ),
        const SizedBox(height: 12),
        EditableInfoCard(
          title: LocaleKeys.register_email.tr(),
          icon: Icons.email_outlined,
          color: AppColors.infoColor,
          controller: _controllers['email']!,
          isEditing: _editingField == 'email',
          keyboardType: TextInputType.emailAddress,
          onEdit: () => _startEditing('email'),
          onSave: () => _saveField('email'),
          onCancel: _cancelEditing,
        ),
        const SizedBox(height: 12),
        EditableInfoCard(
          title: LocaleKeys.register_phone.tr(),
          icon: Icons.phone_outlined,
          color: AppColors.successColor,
          controller: _controllers['phone']!,
          isEditing: _editingField == 'phone',
          keyboardType: TextInputType.phone,
          onEdit: () => _startEditing('phone'),
          onSave: () => _saveField('phone'),
          onCancel: _cancelEditing,
        ),
        const SizedBox(height: 12),
        StaticInfoCard(
          title: 'عضو منذ',
          value:  "1/12/2025",
          icon: Icons.calendar_today_outlined,
          color: AppColors.warningColor,
        ),
      ],
    );
  }

}