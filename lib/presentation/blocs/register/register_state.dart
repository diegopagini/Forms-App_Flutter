part of 'register_cubit.dart';

enum FormStatus { invalid, valid, validating, posting }

class RegisterFormState extends Equatable {
  final FormStatus formStatus;
  final Email email;
  final Password password;
  final Username username;
  final bool isValid;

  const RegisterFormState(
      {this.formStatus = FormStatus.invalid,
      this.username = const Username.pure(),
      this.email = const Email.pure(),
      this.password = const Password.pure(),
      this.isValid = false});

  RegisterFormState copyWith(
          {FormStatus? formStatus,
          Email? email,
          Password? password,
          Username? username,
          bool? isValid}) =>
      RegisterFormState(
        formStatus: formStatus ?? this.formStatus,
        username: username ?? this.username,
        password: password ?? this.password,
        email: email ?? this.email,
        isValid: isValid ?? this.isValid,
      );

  @override
  List<Object> get props => [formStatus, username, email, password, isValid];
}
