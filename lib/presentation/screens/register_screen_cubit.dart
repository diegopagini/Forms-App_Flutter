import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../blocs.dart';
import '../widgets/widgets.dart';

class RegisterScreenCubit extends StatelessWidget {
  const RegisterScreenCubit({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Nuevo Usuario')),
      body: BlocProvider(
        create: (context) => RegisterFormCubit(),
        child: const _RegisterView(),
      ),
    );
  }
}

class _RegisterView extends StatelessWidget {
  const _RegisterView();

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 10,
        ),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              FlutterLogo(
                size: 100,
              ),
              _RegisterForm(),
              SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _RegisterForm extends StatelessWidget {
  const _RegisterForm();

  @override
  Widget build(BuildContext context) {
    final registerCubit = context.watch<RegisterFormCubit>();
    final username = registerCubit.state.username;
    final password = registerCubit.state.password;
    final email = registerCubit.state.email;

    return Form(
        child: Column(
      children: [
        CustomTextFormField(
          label: 'Nombre de usuario: ${username.value}',
          onChanged: registerCubit.userNameChanged,
          errorMessage: username.errorMessage,
        ),
        const SizedBox(
          height: 10,
        ),
        CustomTextFormField(
          label: 'Correo electronico',
          onChanged: registerCubit.emailChanged,
          errorMessage: email.errorMessage,
        ),
        const SizedBox(
          height: 10,
        ),
        CustomTextFormField(
          label: 'Contraseña',
          obscureText: true,
          onChanged: registerCubit.passwordChanged,
          errorMessage: password.errorMessage,
        ),
        const SizedBox(
          height: 20,
        ),
        FilledButton.tonalIcon(
          onPressed: () {
            registerCubit.onSubmit();
          },
          icon: const Icon(Icons.save),
          label: const Text('Crear usuario'),
        ),
      ],
    ));
  }
}
