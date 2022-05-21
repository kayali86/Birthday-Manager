import 'package:flutter/material.dart';

import '../../../utils/my_const/font_const.dart';
import '../../common_widgets/widget_logo_birthdaymanager.dart';
import '../../common_widgets/widget_spacer.dart';

class WidgetTopWelcome extends StatelessWidget {
  const WidgetTopWelcome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        const SizedBox(
          width: 512,
          height: 256,
          child: WidgetLogoBirthdayManager(),
        ),
        Text('Log in to see the birthdays of your work colleagues',
            style: FontConst.mediumWhite_14),
        WidgetSpacer(height: 16),
      ],
    );
  }
}
