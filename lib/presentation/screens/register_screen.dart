import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:forms_app/presentation/cubit/register_cubit.dart';
import 'package:forms_app/presentation/widgets/widgets.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Register'),
      ),
      body: BlocProvider(
        create: (context) => RegisterCubit(),
        child: const _RegisterView(),
      ),
    );
  }
}

class _RegisterView extends StatelessWidget {
  const _RegisterView();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: SingleChildScrollView(
          child: Column(
            children: const [
              FlutterLogo(size: 100),
              _RegisterForm(),
              SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}

class _RegisterForm extends StatelessWidget {
  const _RegisterForm();

  //final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final registercubit = context.watch<RegisterCubit>();
    final username = registercubit.state.username;
    final email = registercubit.state.email;
    final password = registercubit.state.password;

    return Form(
      //key: _formKey,
      child: Column(
        children: [
          CustomTextFormField(
            label: 'nombre de usuario',
            onChanged: registercubit.usernameChanged,
            errorMessage: username.errorMessage,
            //      _formKey.currentState?.validate()
          ),
          const SizedBox(height: 20),
          CustomTextFormField(
            label: 'email',
            onChanged: registercubit.emailChanged,
            //    _formKey.currentState?.validate()

            errorMessage: email.errorMessage,
          ),
          const SizedBox(height: 20),
          CustomTextFormField(
            label: 'password',
            obscureText: true,
            onChanged: registercubit.passwordChanged,
            errorMessage: password.errorMessage,
            //_formKey.currentState?.validate()
          ),
          const SizedBox(height: 20),
          FilledButton.tonalIcon(
            onPressed: () {
              //final isValid = _formKey.currentState!.validate();
              //if (!isValid) return;
              registercubit.onSubmit();
            },
            icon: const Icon(Icons.person),
            label: const Text('Register'),
          )
        ],
      ),
    );
  }
}
