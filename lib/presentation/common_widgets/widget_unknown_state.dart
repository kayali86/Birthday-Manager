import 'package:flutter/material.dart';

import '../../utils/my_const/FONT_CONST.dart';

class WidgetUnknownState extends StatelessWidget {
  WidgetUnknownState();

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32),
          child: Text('Unknown state', style: FONT_CONST.REGULAR_GRAY4_14),
        ),
      ),
    );
  }
}
