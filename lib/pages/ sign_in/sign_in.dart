import 'package:ekaksha/pages/%20sign_in/bloc/sign_in_events.dart';
import 'package:ekaksha/pages/%20sign_in/sign_in_controller.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ekaksha/pages/common_widgets.dart';
import 'bloc/sign_in_blocs.dart';
import 'bloc/signin_states.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignInBloc, SignInState>(builder: (context, state) {
      return Container(
        color: Colors.white,
        child: SafeArea(
          child: Scaffold(
            backgroundColor: Colors.white,
            appBar: buildAppBar("Logn In"),
            body: SingleChildScrollView(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                buildThirdPArtyLogin(context),
                Center(
                    child: reusableText("Or use you email account to login")),
                Container(
                  margin: EdgeInsets.only(top: 36.h),
                  padding: EdgeInsets.only(left: 25.w, right: 25.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      reusableText("Email"),
                      SizedBox(height: 5.h),
                      buildTextField("Enter your email adress", "email", "user",
                          (value) {
                        context.read<SignInBloc>().add(
                              EmailEvent(value),
                            );
                      }),
                      reusableText("Password"),
                      SizedBox(height: 5.h),
                      buildTextField("Enter your password", "password", "lock",
                          (value) {
                        context.read<SignInBloc>().add(
                              PasswordEvent(value),
                            );
                      })
                    ],
                  ),
                ),
                forgotPassword(),
                SizedBox(
                  height: 70.h,
                ),
                buildLogInAndRegButton("Log in", "login", () {
                  SignInController(context: context).handleSignIn("email");
                }),
                buildLogInAndRegButton("Sign Up", "register", () {
                  Navigator.of(context).pushNamed("/register");
                }),
              ],
            )),
          ),
        ),
      );
    });
  }
}
