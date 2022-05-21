import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../utils/my_const/color_const.dart';

class WidgetLogoBirthdayManager extends StatelessWidget {
  const WidgetLogoBirthdayManager({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      'assets/logo_birthday_manager.svg',
      color: ColorConst.white,
    );
  }
}
