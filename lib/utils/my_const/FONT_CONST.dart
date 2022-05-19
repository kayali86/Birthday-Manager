import 'package:flutter/material.dart';

import 'COLOR_CONST.dart';

class FONT_CONST {
  static final REGULAR = TextStyle(
      fontFamily: 'Poppins',
      fontWeight: FontWeight.w400,
      color: COLOR_CONST.BLACK);

  static final MEDIUM = TextStyle(
    fontFamily: 'Poppins',
    fontWeight: FontWeight.w500,
    color: COLOR_CONST.BLACK,
  );

  static final SEMIBOLD = TextStyle(
    fontFamily: 'Poppins',
    fontWeight: FontWeight.w600,
    color: COLOR_CONST.BLACK,
  );

  //REGULAR
  static final REGULAR_WHITE = REGULAR.copyWith(color: COLOR_CONST.WHITE);
  static final REGULAR_WHITE_10 = REGULAR_WHITE.copyWith(fontSize: 10);

  static final REGULAR_GRAY1 = REGULAR.copyWith(color: COLOR_CONST.GRAY1);
  static final REGULAR_GRAY1_12 = REGULAR_GRAY1.copyWith(fontSize: 12);

  static final REGULAR_GRAY4 = REGULAR.copyWith(color: COLOR_CONST.GRAY4);
  static final REGULAR_GRAY4_12 = REGULAR_GRAY4.copyWith(fontSize: 12);
  static final REGULAR_GRAY4_14 = REGULAR_GRAY4.copyWith(fontSize: 14);

  //MEDIUM
  static final MEDIUM_WHITE = MEDIUM.copyWith(color: COLOR_CONST.WHITE);
  static final MEDIUM_WHITE_14 = MEDIUM_WHITE.copyWith(fontSize: 14);
  static final MEDIUM_WHITE_16 = MEDIUM_WHITE.copyWith(fontSize: 16);

  static final MEDIUM_DEFAULT = MEDIUM.copyWith(color: COLOR_CONST.PRIMARY_COLOR);
  static final MEDIUM_DEFAULT_16 = MEDIUM_DEFAULT.copyWith(fontSize: 16);

  //SEMI_BOLD
  static final SEMIBOLD_WHITE = SEMIBOLD.copyWith(color: COLOR_CONST.WHITE);
  static final SEMIBOLD_WHITE_10 = SEMIBOLD_WHITE.copyWith(fontSize: 10);
  static final SEMIBOLD_WHITE_18 = SEMIBOLD_WHITE.copyWith(fontSize: 18);

}
