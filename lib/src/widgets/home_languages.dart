import 'package:flutter/material.dart';
import 'package:scancode_app/src/providers/user.dart';
import 'package:scancode_app/src/widgets/item_list_languages.dart';

Widget homeLanguages(UserProvider userState) {
  return Column(
    children: <Widget>[
      Flexible(
        flex: 2,
        child: Row(
          children: <Widget>[
            Spacer(
              flex: 1,
            ),
            Expanded(
              flex: 15,
              child: Text(
                'Languages',
                style: TextStyle(
                  fontFamily: 'BalooDa',
                  fontSize: 18,
                  color: Colors.black87,
                ),
              ),
            ),
            Spacer(
              flex: 20,
            )
          ],
        ),
      ),
      //List Badges
      Expanded(
        flex: 6,
        child: LayoutBuilder(
          builder: (context, constraints) {
            return Container(
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: userState.user.languages.length,
                itemBuilder: (context, index) {
                  return itemListLanguages(context, constraints, userState, index);
                },
              ),
            );
          },
        ),
      ),
    ],
  );
}