import 'package:flutter/material.dart';
import 'package:scancode_app/src/providers/user.dart';
import 'package:scancode_app/src/api/end_points.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

Widget itemListLanguages(BoxConstraints constraints, UserProvider userState, int index) {
  return Container(
    margin: EdgeInsets.only(left: 10, right: 10),
    width: constraints.maxHeight / 1,
    height: constraints.maxHeight / 1,
    //  '$URL_LANGUAGES${userState.user.languages[index]['name']}.svg',
    child: SvgPicture.network(
      '$URL_LANGUAGES${userState.user.languages[index]['name']}.svg',
      placeholderBuilder:
          (BuildContext context) =>
      new Container(
        padding: const EdgeInsets.all(
            30.0),
        child:
        Center(
          child: SpinKitCubeGrid (
            size: 20,
            color: Theme.of(context).primaryColor,
          ),
        ),
      ),
    ),
  );
}