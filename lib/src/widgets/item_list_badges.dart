import 'package:flutter/material.dart';
import 'package:scancode_app/src/providers/user.dart';
import 'package:scancode_app/src/api/end_points.dart';
import 'package:scancode_app/src/widgets/cache_svg_picture.dart';

Widget itemListBadges(
    BoxConstraints constraints, UserProvider userState, index) {
  return Container(
    margin: EdgeInsets.only(left: 10, right: 10),
    width: constraints.maxHeight / 1,
    height: constraints.maxHeight / 1,
    child: CustomSvgPicture('$URL_BADGES${userState.user.badges[index]}.svg'),
  );
}
