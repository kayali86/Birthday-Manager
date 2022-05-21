import 'package:flutter/material.dart';
import '../../../utils/my_const/color_const.dart';
import '../../common_widgets/widget_logo_birthdaymanager.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: ColorConst.primaryColor,
        child: const Center(
          child: SizedBox(
            width: 240,
            child: WidgetLogoBirthdayManager(),
          ),
        ),
      ),
    );
  }
}
