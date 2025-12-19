import 'package:easy_localization/easy_localization.dart';
import 'package:user_app_iraq/generated/locale_keys.g.dart';

class AuthValidator {
  static bool isValidEmail(String email) {
    final regex = RegExp(r"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.com$");
    return regex.hasMatch(email);
  }

  static String? validateEmail(String? value) {
    bool isValidGmail = isValidEmail(value ?? "");

    if (value == null || value.trim().isEmpty) {
      return LocaleKeys.Validations_Auth_email_required.tr();
    }
    if (isValidGmail == false) {
      return LocaleKeys.Validations_Auth_email_invalid.tr();
    }
    return null;
  }
  static String? validatePassword(String? value) {
    if (value == null || value.length < 8) {
      return LocaleKeys.Validations_Auth_password_invalid.tr();
    }
    return null;
  }
  static String? validateIraqPhone(String? value) {
    if (value == null || value.trim().isEmpty) {
      return LocaleKeys.register_Auth_iraq_phone_required.tr();
    }

    final cleaned = value.replaceAll(RegExp(r'\s+'), '');

    // يقبل أرقام فقط مع + في الأول (اختياري)
    final regex = RegExp(r'^\+?\d{7,15}$');

    if (!regex.hasMatch(cleaned)) {
      return LocaleKeys.register_Auth_iraq_phone_required.tr();
    }

    return null;
  }


  static String? validateField(String? value) {
    if (value == null || value.trim().isEmpty) {
      return LocaleKeys.Validations_Auth_field_required.tr();
    }
    return null;
  }

  static bool isValidPhone(String phone) {
    final regex = RegExp(r'^(?:\+?\d{1,3})?\d{10,15}$');
    return regex.hasMatch(phone);
  }

  static String? validatePhone(String? value) {
    if (value == null || value.trim().isEmpty) {
      return LocaleKeys.Validations_Auth_phone_required.tr();
    }

    if (!isValidPhone(value.trim())) {
      return LocaleKeys.Validations_Auth_phone_invalid.tr();
    }

    return null;
  }
}
