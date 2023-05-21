import 'package:ekaksha/common/routes/names.dart';
import 'package:ekaksha/common/values/constant.dart';
import 'package:ekaksha/pages/application/bloc/app_bloc.dart';
import 'package:ekaksha/pages/application/bloc/app_events.dart';
import 'package:ekaksha/pages/profile/settings/bloc/setting_bloc.dart';
import 'package:ekaksha/pages/profile/settings/bloc/setting_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../global.dart';
import '../settings/widgets/setting_widgets.dart';

class SettingPage extends StatefulWidget {
  const SettingPage({super.key});

  @override
  State<SettingPage> createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  void removeUserData() {
    context.read<AppBlocs>().add(const TriggerAppEvent(0));
    Global.storageService.remove(AppConstants.STORAGE_USER_TOKEN_KEY);
    Navigator.of(context)
        .pushNamedAndRemoveUntil(AppRoutes.SIGN_IN, (route) => false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: buildAppbar(),
      body: SingleChildScrollView(child:
          BlocBuilder<SettingBloc, SettingStates>(builder: (context, states) {
        return Container(
          child: Column(
            children: [
              settingButton(context, removeUserData),
            ],
          ),
        );
      })),
    );
  }
}
