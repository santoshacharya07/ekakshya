//unify bloc provder and routes and pages (screen name)
import 'package:ekaksha/common/routes/names.dart';
import 'package:ekaksha/pages/%20sign_in/bloc/sign_in_blocs.dart';
import 'package:ekaksha/pages/%20sign_in/sign_in.dart';
import 'package:ekaksha/pages/application/application_page.dart';
import 'package:ekaksha/pages/application/bloc/app_bloc.dart';
import 'package:ekaksha/pages/home/bloc/home_page_bloc.dart';
import 'package:ekaksha/pages/home/home_page.dart';
import 'package:ekaksha/pages/profile/settings/bloc/setting_bloc.dart';
import 'package:ekaksha/pages/profile/settings/setting_page.dart';
import 'package:ekaksha/pages/register/bloc/register_bloc.dart';
import 'package:ekaksha/pages/register/register.dart';
import 'package:ekaksha/pages/welcome/bloc/welcome_bloc.dart';
import 'package:ekaksha/pages/welcome/welcome.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../global.dart';

class AppPages {
  static List<PageEntity> routes() {
    return [
      PageEntity(
        route: AppRoutes.INITIAL,
        page: const WelcomePage(),
        bloc: BlocProvider(create: (_) => WelcomeBloc()),
      ),
      PageEntity(
        route: AppRoutes.SIGN_IN,
        page: const SignIn(),
        bloc: BlocProvider(create: (_) => SignInBloc()),
      ),
      PageEntity(
        route: AppRoutes.REGISTER,
        page: const Register(),
        bloc: BlocProvider(create: (_) => RegisterBloc()),
      ),
      PageEntity(
        route: AppRoutes.APPLICATION,
        page: const ApplicationPage(),
        bloc: BlocProvider(create: (_) => AppBlocs()),
      ),
      PageEntity(
        route: AppRoutes.HOME_PAGE,
        page: const HomePage(),
        bloc: BlocProvider(create: (_) => HomePageBloc()),
      ),
      PageEntity(
        route: AppRoutes.SETTINGS,
        page: const SettingPage(),
        bloc: BlocProvider(create: (_) => SettingBloc()),
      ),
    ];
  }

//returned all the bloc provider
  static List<dynamic> allBlocProviders(BuildContext context) {
    List<dynamic> blocProviders = <dynamic>[];
    for (var bloc in routes()) {
      blocProviders.add(bloc.bloc);
    }
    return blocProviders;
  }

  //meodel tat cover entire screen as we click in navigator objet
  static MaterialPageRoute generateRouteSetting(RouteSettings settings) {
    if (settings.name != null) {
      //check for route name matching when navigator gets tiggred
      var result = routes().where((element) => element.route == settings.name);
      if (result.isNotEmpty) {
        print("First log");
        print(result.first.route);
        bool deviceFirstOpen = Global.storageService.getDeviceFirstOpen();
        if (result.first.route == AppRoutes.INITIAL && deviceFirstOpen) {
          bool isLoggedIn = Global.storageService.getIsloggedIn();
          if (isLoggedIn) {
            return MaterialPageRoute(
                builder: (_) => const ApplicationPage(), settings: settings);
          }
          print("second log");
          return MaterialPageRoute(
              builder: (_) => const SignIn(), settings: settings);
        }
        return MaterialPageRoute(
            builder: (_) => result.first.page, settings: settings);
      }
    }
    print("invalid route name is ${settings.name}");
    return MaterialPageRoute(
        builder: (_) => const SignIn(), settings: settings);
  }
}

class PageEntity {
  String route;
  Widget page;
  dynamic bloc;
  PageEntity({required this.route, required this.page, this.bloc});
}
