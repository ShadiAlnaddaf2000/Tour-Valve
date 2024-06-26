import 'package:animate_do/animate_do.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../cubits/login_cubit/login_cubit.dart';
import '../cubits/login_cubit/login_states.dart';
import '../shared/components/buttons.dart';
import '../shared/components/form_field.dart';
import '../shared/style/colors.dart';

class LoginScreen extends StatelessWidget {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  final formKey = GlobalKey<FormState>();

  LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => LoginCubit(),
      child: BlocConsumer<LoginCubit, LoginStates>(
        listener: (context, state) {
          if (state is LoginSuccessState) {
            context.go('/home');
          }
        },
        builder: (context, state) {
          return Scaffold(
              backgroundColor: Colors.white,
              body: Center(
                child: SingleChildScrollView(
                  child: Form(
                    key: formKey,
                    child: Column(
                      children: <Widget>[
                        Container(
                          height: 270,
                          width: 270,
                          decoration: const BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage('assets/images/logo.png'),
                                  fit: BoxFit.fill)),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 0.0),
                          child: ShaderMask(
                            shaderCallback: (bounds) => const LinearGradient(
                              colors:
                                  MyColors.colorList, // Define gradient colors
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                            ).createShader(bounds),
                            child: const Text(
                              'TOUR VALVE',
                              // Replace with the desired screen name
                              style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'PlayfairDisplay',
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(30.0),
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
                                      ],
                                    ),
                                  )),
                              const SizedBox(
                                height: 15.0,
                              ),
                              ConditionalBuilder(
                                condition: state is! LoginLoadingState,
                                builder: (context) => Container(
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(30.0),
                                    color:
                                        const Color.fromARGB(255, 7, 185, 255),
                                  ),
                                  child: MaterialButton(
                                    onPressed: () async {
                                      if (formKey.currentState!.validate()) {
                                        LoginCubit.get(context).userLogin(
                                            email: emailController.text,
                                            password: passwordController.text);
                                      }
                                    },
                                    child: const Text(
                                      'LOGIN',
                                      style: TextStyle(
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ),
                                fallback: (context) => const Center(
                                    child: CircularProgressIndicator()),
                              ),
                              const SizedBox(
                                height: 20.0,
                              ),
                              FadeInUp(
                                  duration: const Duration(milliseconds: 2000),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      const Text(
                                        "Forgot Password?",
                                        style: TextStyle(
                                          color: Color.fromRGBO(8, 135, 239, 1),
                                        ),
                                      ),
                                      defaultTextButton(
                                          function1: () {
                                            // navigateTo(context, login_screen());
                                          },
                                          text: 'register')
                                    ],
                                  )),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ));
        },
      ),
    );
  }
}
