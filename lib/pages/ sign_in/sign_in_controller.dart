import 'package:ekaksha/common/widgets/flutter_toast.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ekaksha/pages/ sign_in/bloc/sign_in_blocs.dart';

class SignInController {
  final BuildContext context;
  const SignInController({required this.context});
  Future<void> handleSignIn(String type) async {
    try {
      if (type == "email") {
        //BlocProvider.of<SignInBloc>(context).state
        final state = context.read<SignInBloc>().state;
        String emailAddress = state.email;
        String password = state.password;
        if (emailAddress.isEmpty) {
          //

          toastInfo(msg: "You need to fill email address");
          return;
        }
        if (password.isEmpty) {
          //
          toastInfo(msg: "Password is empty");
          return;
        }
        try {
          final credential = await FirebaseAuth.instance
              .signInWithEmailAndPassword(
                  email: emailAddress, password: password);
          if (credential.user == null) {
            //
            toastInfo(msg: "User doesn't exist");
            return;
          }
          if (!credential.user!.emailVerified) {
            //
            toastInfo(msg: "Not verified");
            return;
          }
          var user = credential.user;
          if (user != null) {
            //we got the verified user from the firebase

            toastInfo(msg: "User Exist");
            return;
          } else {
            //we have erroe getting from firebase

            toastInfo(msg: "Currently you are not user of this app");
            return;
          }
        } on FirebaseAuthException catch (e) {
          if (e.code == "user-not-found") {
            toastInfo(msg: "No User Found for that email");
            return;
          } else if (e.code == 'wrong-password') {
            toastInfo(msg: "Wrong password provided for that email");
            return;
          } else if (e.code == 'invalid-email') {
            toastInfo(msg: "Your email is invalid");
          }
        }
      }
    } catch (e) {
      print(e.toString());
    }
  }
}
