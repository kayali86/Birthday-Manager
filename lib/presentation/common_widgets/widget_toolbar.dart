import 'package:birthday_manager/presentation/common_widgets/widget_spacer.dart';
import 'package:flutter/material.dart';

import '../../utils/my_const/COLOR_CONST.dart';
import '../../utils/my_const/FONT_CONST.dart';
import '../custom_ui/svg_image.dart';

class WidgetToolbar extends StatelessWidget {
  String title;
  Widget actions;

  WidgetToolbar({required this.title, required this.actions});

  WidgetToolbar.defaultActions({required this.title}) : actions = _buildActions();

  @override
  Widget build(BuildContext context) {
    return Container(
      color: COLOR_CONST.BLUE,
      height: 50,
      child: Row(
        children: <Widget>[
          GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Padding(
              padding: const EdgeInsets.only(left: 12, right: 10),
              child: MySvgImage(
                width: 19,
                height: 16,
                path: 'assets/ic_back.svg',
              ),
            ),
          ),
          Expanded(
            child: Text(title, style: FONT_CONST.MEDIUM_WHITE_16),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 20),
            child: actions,
          ),
        ],
      ),
    );
  }

  static _buildActions() {
    return Row(
      children: <Widget>[
        MySvgImage(
          path: "assets/ic_search.svg",
          width: 20,
          height: 20,
        ),
        WidgetSpacer(width: 12),
        MySvgImage(
          path: "assets/ic_more.svg",
          width: 20,
          height: 20,
        ),
        WidgetSpacer(width: 12)
      ],
    );
  }
}
