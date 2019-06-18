import 'package:flutter/material.dart';
import 'package:scancode_app/src/providers/user.dart';
import 'package:scancode_app/src/api/end_points.dart';
import 'package:scancode_app/src/widgets/cache_svg_picture.dart';
import 'package:scancode_app/src/widgets/bottom_sheet_languages.dart';

Widget itemListLanguages(BuildContext context, BoxConstraints constraints,
    UserProvider userState, int index) {
  return InkWell(
    onTap: () {
      showBottomSheetLanguages(context, userState, index);
    },
    child: Container(
      margin: EdgeInsets.only(left: 10, right: 10),
      width: constraints.maxHeight / 1,
      height: constraints.maxHeight / 1,
      //  '$URL_LANGUAGES${userState.user.languages[index]['name']}.svg',
      child: CacheSvgPicture(
          '$URL_LANGUAGES${userState.user.languages[index]['name']}.svg'),
    ),
  );
}
