import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:forms_app/infrastructure/inputs.dart';
import 'package:formz/formz.dart';

part 'register_state.dart';

class RegisterFormCubit extends Cubit<RegisterFormState> {
  RegisterFormCubit() : super(const RegisterFormState());

  void onSubmit() {
    emit(state.copyWith(
        formStatus: FormStatus.validating,
        username: Username.dirty(state.username.value),
        password: Password.dirty(state.password.value),
        email: Email.dirty(state.email.value),
        isValid: Formz.validate([state.username, state.password])));

    print('Submit: $state');
  }

  void userNameChanged(String value) {
    final username = Username.dirty(value);
    emit(state.copyWith(
        username: username,
        isValid: Formz.validate([
          username,
          state.password,
          state.email
        ]))); // To validate the entire form.
  }

  void emailChanged(String value) {
    final email = Email.dirty(value);
    emit(state.copyWith(
        email: email,
        isValid: Formz.validate([
          email,
          state.username,
          state.password
        ]))); // To validate the entire form.
  }

  void passwordChanged(String value) {
    final password = Password.dirty(value);
    emit(state.copyWith(
        password: password,
        isValid: Formz.validate([
          password,
          state.username,
          state.email
        ]))); // To validate the entire form.
  }
}
