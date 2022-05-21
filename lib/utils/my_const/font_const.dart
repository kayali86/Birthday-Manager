import 'package:flutter/material.dart';

import 'color_const.dart';

class FontConst {
  static final regular = TextStyle(
      fontFamily: 'Poppins',
      fontWeight: FontWeight.w400,
      color: ColorConst.black);

  static final medium = TextStyle(
    fontFamily: 'Poppins',
    fontWeight: FontWeight.w500,
    color: ColorConst.black,
  );

  static final semiBold = TextStyle(
    fontFamily: 'Poppins',
    fontWeight: FontWeight.w600,
    color: ColorConst.black,
  );

  //REGULAR
  static final regularWhite = regular.copyWith(color: ColorConst.white);
  static final regularWhite10 = regularWhite.copyWith(fontSize: 10);

  static final regularGray1 = regular.copyWith(color: ColorConst.gray1);
  static final regularGray1_12 = regularGray1.copyWith(fontSize: 12);

  static final regularGray3 = regular.copyWith(color: ColorConst.gray3);
  static final regularGray3_12 = regularGray3.copyWith(fontSize: 12);
  static final regularGray3_14 = regularGray3.copyWith(fontSize: 14);

  //MEDIUM
  static final mediumWhite = medium.copyWith(color: ColorConst.white);
  static final mediumWhite_14 = mediumWhite.copyWith(fontSize: 14);
  static final mediumWhite_16 = mediumWhite.copyWith(fontSize: 16);

  static final mediumPrimary = medium.copyWith(color: ColorConst.primaryColor);
  static final mediumPrimary_16 = mediumPrimary.copyWith(fontSize: 16);

  //SEMI_BOLD
  static final semiBoldWhite = semiBold.copyWith(color: ColorConst.white);
  static final semiBoldWhite_10 = semiBoldWhite.copyWith(fontSize: 10);
  static final semiBoldWhite_18 = semiBoldWhite.copyWith(fontSize: 18);

}
