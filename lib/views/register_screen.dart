import 'package:animate_do/animate_do.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:toast/toast.dart';
import 'package:tour_valve/shared/components/shader_mask.dart';

import '../cubits/register_cubit/register_cubit.dart';
import '../shared/components/buttons.dart';
import '../shared/components/form_field.dart';

class RegisterScreen extends StatelessWidget {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final addressController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    ToastContext().init(context);
    return BlocConsumer<RegisterCubit, RegisterState>(
        listener: (context, state) {
      if (state is RegisterSuccessState) {
        context.go('/home');
      } else if (state is RegisterErrorState) {
        Toast.show('Something went wrong',
            duration: Toast.lengthShort, gravity: Toast.bottom);
      }
    }, builder: (context, state) {
      return SafeArea(
        child: Scaffold(
          backgroundColor: Colors.white,
          body: Stack(
            children: <Widget>[
              Opacity(
                opacity: 0.2,
                child: Container(
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/images/logo.png'),
                      fit: BoxFit.fitWidth,
                    ),
                  ),
                ),
              ),
              SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(top: 20.0),
                      child: customShaderMask(title: 'Tour Valve'),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(30.0),
                      child: Form(
                        key: formKey,
                        child: Column(
                          children: <Widget>[
                            FadeInUp(
                                duration: const Duration(milliseconds: 1800),
                                child: Container(
                                  padding: const EdgeInsets.all(5),
                                  child: Column(
                                    children: <Widget>[
                                      defaultFormField(
                                        controller: emailController,
                                        type: TextInputType.emailAddress,
                                        validate: (value) {
                                          if (value.isEmpty) {
                                            return 'Please Enter Email Address';
                                          }
                                          return null;
                                        },
                                        label: 'Email Address',
                                        prefix: Icons.email_outlined,
                                      ),
                                      const SizedBox(
                                        height: 15.0,
                                      ),
                                      defaultFormField(
                                        controller: firstNameController,
                                        type: TextInputType.name,
                                        validate: (value) {
                                          if (value.isEmpty) {
                                            return 'Please Enter your first name';
                                          }
                                          return null;
                                        },
                                        label: 'First name',
                                        prefix: Icons.person,
                                      ),
                                      const SizedBox(
                                        height: 15.0,
                                      ),
                                      defaultFormField(
                                        controller: lastNameController,
                                        type: TextInputType.name,
                                        validate: (value) {
                                          if (value.isEmpty) {
                                            return 'Please Enter your last name';
                                          }
                                          return null;
                                        },
                                        label: 'last name',
                                        prefix: Icons.person,
                                      ),
                                      const SizedBox(
                                        height: 15.0,
                                      ),
                                      defaultFormField(
                                        controller: addressController,
                                        type: TextInputType.name,
                                        validate: (value) {
                                          if (value.isEmpty) {
                                            return 'Please Enter your address';
                                          }
                                          return null;
                                        },
                                        label: 'address',
                                        prefix: Icons.home,
                                      ),
                                      const SizedBox(
                                        height: 15.0,
                                      ),
                                      defaultFormField(
                                        controller: passwordController,
                                        type: TextInputType.visiblePassword,
                                        suffix: Icons.visibility_outlined,
                                        suffixPressed: () {},
                                        validate: (value) {
                                          if (value.isEmpty) {
                                            return 'password is too short';
                                          }
                                          return null;
                                        },
                                        label: 'Password',
                                        prefix: Icons.lock_outline,
                                      ),
                                      const SizedBox(height: 15.0),
                                      defaultFormField(
                                        controller: confirmPasswordController,
                                        type: TextInputType.visiblePassword,
                                        suffix: Icons.visibility_outlined,
                                        suffixPressed: () {},
                                        validate: (value) {
                                          if (value.isEmpty) {
                                            return 'Please confirm your password';
                                          }
                                          if (value !=
                                              passwordController.text) {
                                            return 'Passwords do not match';
                                          }
                                          return null;
                                        },
                                        label: 'Confirm Password',
                                        prefix: Icons.lock_outline,
                                      ),
                                    ],
                                  ),
                                )),
                            const SizedBox(
                              height: 30,
                            ),
                            ConditionalBuilder(
                              condition: state is! RegisterLoadingState,
                              builder: (context) =>
                                  buildRegisterButton(context),
                              fallback: (context) => const Center(
                                  child: CircularProgressIndicator()),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            FadeInUp(
                              duration: const Duration(milliseconds: 2000),
                              child: defaultTextButton(
                                function1: () {
                                  context.go('/login');
                                },
                                text: "Already have an account? Sign in",
                              ),
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      );
    });
  }

  Container buildRegisterButton(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30.0),
        color: const Color.fromARGB(255, 7, 185, 255),
      ),
      child: MaterialButton(
        onPressed: () async {
          if (formKey.currentState!.validate()) {
            BlocProvider.of<RegisterCubit>(context).userRegister(
                email: emailController.text,
                password: passwordController.text,
                address: addressController.text,
                lastname: lastNameController.text,
                firstname: firstNameController.text,
                confirmedPassword: confirmPasswordController.text);
          }
        },
        child: const Text(
          'REG',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
