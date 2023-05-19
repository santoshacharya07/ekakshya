import 'package:ekaksha/common/routes/pages.dart';
import 'package:ekaksha/pages/%20sign_in/sign_in.dart';
import 'package:ekaksha/pages/application/application_page.dart';
import 'package:ekaksha/pages/bloc_providers.dart';
import 'package:ekaksha/pages/register/register.dart';
import 'package:ekaksha/pages/welcome/welcome.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:firebase_core/firebase_core.dart';
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
        providers: [...AppPages.allBlocProviders(context)],
        child: ScreenUtilInit(
          builder: (context, child) => MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              appBarTheme: const AppBarTheme(
                  iconTheme: IconThemeData(color: AppColors.primaryText),
                  elevation: 0,
                  backgroundColor: Colors.white),
            ),
            // home: const WelcomePage(),
            onGenerateRoute: AppPages.generateRouteSetting,
            //initialRoute:
            // routes: {
            //   "signIn": (context) => const SignIn(),
            //   "register": (context) => const Register(),
            // },
          ),
        ));
  }
}
