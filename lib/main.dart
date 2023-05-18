import 'package:ekaksha/app_blocs.dart';
import 'package:ekaksha/app_events.dart';
import 'package:ekaksha/pages/%20sign_in/sign_in.dart';
import 'package:ekaksha/pages/bloc_providers.dart';
import 'package:ekaksha/pages/register/register.dart';

import 'package:ekaksha/pages/welcome/welcome.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:firebase_core/firebase_core.dart';
import 'app_states.dart';
import 'common/values/colors.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // return BlocProvider(
    //   lazy: true,
    //   create: (context) => WelcomeBloc(),
    //   child: ScreenUtilInit(
    //     builder: (context, child) => const MaterialApp(
    //       debugShowCheckedModeBanner: false,
    //       home: WelcomePage(),
    //     ),
    //   ),
    // );
    return MultiBlocProvider(
        providers: AppBlocProviders.allBlocProviders,
        child: ScreenUtilInit(
          builder: (context, child) => MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              appBarTheme: const AppBarTheme(
                  iconTheme: IconThemeData(color: AppColors.primaryText),
                  elevation: 0,
                  backgroundColor: Colors.white),
            ),
            home: const WelcomePage(),
            routes: {
              "signIn": (context) => const SignIn(),
              "register": (context) => const Register(),
            },
          ),
        ));
  }
}
