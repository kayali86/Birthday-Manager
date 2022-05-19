import 'package:flutter/material.dart';

import '../../../utils/my_const/FONT_CONST.dart';
import '../../common_widgets/widget_logo_birthdaymanager.dart';
import '../../common_widgets/widget_spacer.dart';

class WidgetTopWelcome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        SizedBox(
          width: 512,
          height: 256,
          child: WidgetLogoBirthdayManager(),
        ),
        Text('Log in to see the birthdays of your work colleagues',
            style: FONT_CONST.MEDIUM_WHITE_14),
        WidgetSpacer(height: 16),
      ],
    );
  }
}
