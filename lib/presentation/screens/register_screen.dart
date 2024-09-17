import 'package:flutter/material.dart';
import 'package:forms_app/presentation/widgets/widgets.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Register'),
      ),
      body: const _RegisterView(),
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

class _RegisterForm extends StatefulWidget {
  const _RegisterForm();

  @override
  State<_RegisterForm> createState() => _RegisterFormState();
}

class _RegisterFormState extends State<_RegisterForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String username = '';
  String email = '';
  String password = '';

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          CustomTextFormField(
            label: 'nombre de usuario',
            onChanged: (value) => username = value,
            validator: (value) {
              if (value == null || value.isEmpty) return 'campo requerido';
              if (value.trim().isEmpty) return 'campo requerido';
              if (value.length < 6) return 'debe tener al menos 6 caracteres';
              return null;
            },
          ),
          const SizedBox(height: 20),
          CustomTextFormField(
            label: 'email',
            onChanged: (value) => email = value,
            validator: (value) {
              if (value == null || value.isEmpty) return 'campo requerido';
              if (value.trim().isEmpty) return 'campo requerido';
              final emailRegExp = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');

              if (!emailRegExp.hasMatch(value)) return 'email inválido';
              return null;
            },
          ),
          const SizedBox(height: 20),
          CustomTextFormField(
            label: 'password',
            obscureText: true,
            onChanged: (value) => password = value,
            validator: (value) {
              if (value == null || value.isEmpty) return 'campo requerido';
              if (value.trim().isEmpty) return 'campo requerido';
              if (value.length < 6) return 'debe tener al menos 6 caracteres';
              return null;
            },
          ),
          const SizedBox(height: 20),
          FilledButton.tonalIcon(
            onPressed: () {
              final isValid = _formKey.currentState!.validate();
              if (!isValid) return;
            },
            icon: const Icon(Icons.person),
            label: const Text('Register'),
          )
        ],
      ),
    );
  }
}
