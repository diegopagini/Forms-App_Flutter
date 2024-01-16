part of 'register_cubit.dart';

enum FormStatus { invalid, valid, validating, posting }

class RegisterFormState extends Equatable {
  final FormStatus formStatus;
  final String email;
  final String password;
  final String username;

  const RegisterFormState(
      {this.formStatus = FormStatus.invalid,
      this.username = '',
      this.email = '',
      this.password = ''});

  RegisterFormState copyWith(
          {FormStatus? formStatus,
          String? email,
          String? password,
          String? username}) =>
      RegisterFormState(
          formStatus: formStatus ?? this.formStatus,
          username: username ?? this.username,
          password: password ?? this.password,
          email: email ?? this.email);

  @override
  List<Object> get props => [formStatus, username, email, password];
}
