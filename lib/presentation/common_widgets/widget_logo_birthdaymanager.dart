import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../utils/my_const/COLOR_CONST.dart';

class WidgetLogoBirthdayManager extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      'assets/logo_birthday_manager.svg',
      color: COLOR_CONST.WHITE,
    );
  }
}
