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

class _RegisterForm extends StatefulWidget {
  const _RegisterForm();

  @override
  State<_RegisterForm> createState() => _RegisterFormState();
}

class _RegisterFormState extends State<_RegisterForm> {
  // To use regular forms without a state manager.
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final registerCubit = context.watch<RegisterFormCubit>();

    return Form(
        key: _formKey,
        child: Column(
          children: [
            CustomTextFormField(
              label: 'Nombre de usuario',
              onChanged: (value) {
                registerCubit.userNameChanged(value);
                _formKey.currentState?.validate();
              },
              validator: (value) {
                if (value == null || value.isEmpty) return 'Campo requerido';
                if (value.trim().isEmpty) return 'Campo requerido';
                if (value.length < 6) return 'Más de 6 letras';
                return null;
              },
            ),
            const SizedBox(
              height: 10,
            ),
            CustomTextFormField(
                label: 'Correo electronico',
                onChanged: (value) {
                  registerCubit.emailChanged(value);
                  _formKey.currentState?.validate();
                },
                validator: (value) {
                  if (value == null || value.isEmpty) return 'Campo requerido';
                  if (value.trim().isEmpty) return 'Campo requerido';
                  final emailRegExp = RegExp(
                    r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$',
                  );
                  if (!emailRegExp.hasMatch(value)) return 'Correo no válido';

                  return null;
                }),
            const SizedBox(
              height: 10,
            ),
            CustomTextFormField(
                label: 'Contraseña',
                obscureText: true,
                onChanged: (value) {
                  registerCubit.passwordChanged(value);
                  _formKey.currentState?.validate();
                },
                validator: (value) {
                  if (value == null || value.isEmpty) return 'Campo requerido';
                  if (value.trim().isEmpty) return 'Campo requerido';
                  if (value.length < 6) return 'Más de 6 letras';

                  return null;
                }),
            const SizedBox(
              height: 20,
            ),
            FilledButton.tonalIcon(
              onPressed: () {
                final isValid = _formKey.currentState!
                    .validate(); // To activate validations.
                if (!isValid) return;

                registerCubit.onSubmit();
              },
              icon: const Icon(Icons.save),
              label: const Text('Crear usuario'),
            ),
          ],
        ));
  }
}
