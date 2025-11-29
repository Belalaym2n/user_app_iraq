import 'package:equatable/equatable.dart';

import '../../data/models/user_model.dart';

abstract class SignUpEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

/// لما المستخدم يضغط زر التسجيل
class SignUpButtonPressed extends SignUpEvent {
  final UserModel user;
    SignUpButtonPressed(this.user);

  @override
  List<Object?> get props => [user];
}
