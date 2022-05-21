import 'package:flutter/material.dart';

import '../../../utils/my_const/COLOR_CONST.dart';
import '../../common_widgets/widget_logo_birthdaymanager.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: COLOR_CONST.PRIMARY_COLOR,
        child: Center(
          child: SizedBox(
            width: 240,
            child: WidgetLogoBirthdayManager(),
          ),
        ),
      ),
    );
  }
}
