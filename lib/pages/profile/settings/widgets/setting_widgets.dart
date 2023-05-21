import 'package:ekaksha/common/widgets/base_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../common/values/colors.dart';

AppBar buildAppbar() {
  return AppBar(
    title: Container(
      child: Container(child: reusableText("Settings")),
    ),
  );
}

Widget settingButton(BuildContext context, void Function()? func) {
  return GestureDetector(
    onTap: () {
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: const Text("Confirm Logout"),
              content: const Text("Confirm Logout"),
              actions: [
                TextButton(
                  onPressed: () => Navigator.of(context).pop(),
                  //onPressed: () => Navigator.of(context).pop this also works
                  child: const Text("Cancel"),
                ),
                TextButton(
                  onPressed: func,
                  child: const Text("Confirm"),
                ),
              ],
            );
          });
    },
    child: Container(
      height: 100.w,
      decoration: const BoxDecoration(
          image: DecorationImage(
              fit: BoxFit.fitHeight,
              image: AssetImage("assets/icons/Logout.png"))),
    ),
  );
}
