import 'package:flutter/material.dart';

import '../../../utils/my_const/font_const.dart';
import '../../router.dart';

class WidgetBottomSignUp extends StatelessWidget {
  const WidgetBottomSignUp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 24),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Flexible(
            child: Text(
              'Don\'t have an account ?',
              style: FontConst.regularWhite10,
            ),
          ),
          Flexible(
            child: GestureDetector(
              onTap: () {
                Navigator.of(context).pushNamed(AppRouter.register);
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 4),
                child: Text(
                  'Sign up',
                  style: FontConst.semiBoldWhite_10.copyWith(
                    decoration: TextDecoration.underline,
                  ),
                ),
              ),
            ),
          ),
          Flexible(
            child: Text('Here', style: FontConst.semiBoldWhite_10),
          ),
        ],
      ),
    );
  }
}
