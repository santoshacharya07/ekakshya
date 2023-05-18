import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:ekaksha/pages/common_widgets.dart';



class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.white,
          appBar: buildAppBar(),
          body: SingleChildScrollView(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              buildThirdPArtyLogin(context),
              Center(child: reusableText("Or use you email account to login")),
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
                      //context.read<SignInBloc>().add(EmailEvent(value));
                    }),
                    reusableText("Password"),
                    SizedBox(height: 5.h),
                    buildTextField("Enter your password", "password", "lock",
                        (value) {
                      //context.read<SignInBloc>().add(PasswordEvent(value));
                    })
                  ],
                ),
              ),
              forgotPassword(),
              buildLogInAndRegButton("Log in", "login", () {
                //SignInController(context: context).handleSignIn("email");
              }),
              buildLogInAndRegButton("Register", "register", () {
                Navigator.of(context).pushNamed("register");
              }),
            ],
          )),
        ),
      ),
    );
  }
}
