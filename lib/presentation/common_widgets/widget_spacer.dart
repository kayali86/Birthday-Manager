import 'package:flutter/material.dart';

class WidgetSpacer extends StatelessWidget {
  double _height = 16;
  final double _width;

  WidgetSpacer({Key? key, double height = 16, double width = 0})
      : _height = height,
        _width = width,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: _height,
      width: _width,
    );
  }
}
