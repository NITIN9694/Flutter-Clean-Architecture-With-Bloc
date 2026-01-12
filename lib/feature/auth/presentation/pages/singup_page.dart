import 'dart:developer';

import 'package:clean_architure/core/common/widgets/loader.dart';
import 'package:clean_architure/core/utills/show_snacbar.dart';
import 'package:clean_architure/feature/auth/presentation/auth/bloc.dart';
import 'package:clean_architure/feature/auth/presentation/auth/event.dart';
import 'package:clean_architure/feature/auth/presentation/auth/state.dart';
import 'package:clean_architure/feature/auth/presentation/widgets/auth_filed.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/theme/app_pallete.dart';
import '../widgets/auth_gradient_button.dart';

class SingUpPage extends StatefulWidget {
  const SingUpPage({super.key});

  @override
  State<SingUpPage> createState() => _SingUpPageState();
}

class _SingUpPageState extends State<SingUpPage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final nameController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    nameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: BlocConsumer<AuthBloc, AuthState>(
  listener: (context, state) {
    if(state is AuthFailure){
      showSnackBar(context, state.message);
    }
  },
  builder: (context, state) {
    if(state is AuthLoading){
      return const Loader();
    }
    return Form(
            key: formKey,
            child: Column(
              children: [
                const Text(
                  'Sign Up.',
                  style: TextStyle(
                    fontSize: 50,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 30),
                AuthField(
                  hintText: 'Name',
                  controller: nameController,
                ),
                const SizedBox(height: 15),
                AuthField(
                  hintText: 'Email',
                  controller: emailController,
                ),
                const SizedBox(height: 15),
                AuthField(
                  hintText: 'Password',
                  controller: passwordController,
                  isObscureText: true,
                ),
                const SizedBox(height: 20),
                AuthGradientButton(
                  buttonText: 'Sign Up',

                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      log("message");
                      context.read<AuthBloc>().add(
                          AuthSingUpEvent(email: emailController.text,
                              password: passwordController.text,
                              name: nameController.text));
                    }
                  },
                ),
                const SizedBox(height: 20),
                GestureDetector(
                  onTap: () {

                  },
                  child: RichText(
                    text: TextSpan(
                      text: 'Already have an account? ',
                      style: Theme.of(context).textTheme.titleMedium,
                      children: [
                        TextSpan(
                          text: 'Sign In',
                          style: Theme.of(context)
                              .textTheme
                              .titleMedium
                              ?.copyWith(
                            color: AppPallete.gradient2,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
  },
),
        ),
      ),
    );
  }
}
