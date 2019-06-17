import 'package:flutter/material.dart';
import 'package:scancode_app/src/providers/user.dart';

void showBottomSheetLanguages(
    BuildContext context, UserProvider userState, int index) {
  showBottomSheet(
    context: context,
    builder: (BuildContext bc) {
      return Container(
        height: MediaQuery.of(context).size.height,
        color: Colors.white,
        child: Column(
          children: <Widget>[
            Container(
              alignment: AlignmentDirectional.topStart,
              child: IconButton(
                icon: Icon(
                  Icons.close,
                  color: Colors.purple,
                  size: 25,
                  semanticLabel: 'Close',
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ),
            Spacer(
              flex: 1,
            ),
            Expanded(
              flex: 20,
              child: Column(
                children: <Widget>[],
              ),
            )
          ],
        ),
      );
    },
  );
}
