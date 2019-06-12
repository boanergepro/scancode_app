import 'package:flutter/material.dart';
import 'package:scancode_app/src/providers/user.dart';
import 'package:scancode_app/src/utils/capitalize.dart';

void showBottomSheetLanguages(
    BuildContext context, UserProvider userState, int index) {
  showBottomSheet(
    context: context,
    builder: (BuildContext bc) {
      return Container(
        height: MediaQuery.of(context).size.height / 3,
        color: Colors.white,
        child: Column(
          children: <Widget>[
            // name
            Expanded(
              flex: 1,
              child: Container(
                margin: EdgeInsets.only(left: 8),
                alignment: AlignmentDirectional.topStart,
                child: Text(
                  capitalize(userState.user.languages[index]['name']),
                  style: TextStyle(
                    fontFamily: 'BalooDa',
                    fontSize: 20,
                    color: Colors.black87,
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 7,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  // Rows added
                  Expanded(
                    flex: 1,
                    child: Row(
                      children: <Widget>[
                        Expanded(
                          flex: 3,
                          child: Icon(
                            Icons.add,
                            color: Colors.green,
                          ),
                        ),
                        Expanded(
                          flex: 10,
                          child: Text(
                            'Rows added',
                            style: TextStyle(
                              fontFamily: 'BalooDa',
                              fontSize: 16,
                              color: Colors.black87,
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 3,
                          child: Text(
                            userState.user.languages[index]['additionCount']
                                .toString(),
                            style: TextStyle(
                              fontFamily: 'BalooDa',
                              fontSize: 16,
                              color: Colors.black87,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  // Rows deleted
                  Expanded(
                    flex: 1,
                    child: Row(
                      children: <Widget>[
                        Expanded(
                          flex: 3,
                          child: Icon(
                            Icons.remove,
                            color: Colors.red,
                          ),
                        ),
                        Expanded(
                          flex: 10,
                          child: Text(
                            'Rows deleted',
                            style: TextStyle(
                              fontFamily: 'BalooDa',
                              fontSize: 16,
                              color: Colors.black87,
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 3,
                          child: Text(
                            userState.user.languages[index]['deletionCount']
                                .toString(),
                            style: TextStyle(
                              fontFamily: 'BalooDa',
                              fontSize: 16,
                              color: Colors.black87,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  // Commits
                  Expanded(
                    flex: 1,
                    child: Row(
                      children: <Widget>[
                        Expanded(
                          flex: 3,
                          child: Icon(
                            Icons.check,
                            color: Colors.purple,
                          ),
                        ),
                        Expanded(
                          flex: 10,
                          child: Text(
                            'Commits',
                            style: TextStyle(
                              fontFamily: 'BalooDa',
                              fontSize: 16,
                              color: Colors.black87,
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 3,
                          child: Text(
                            userState.user.languages[index]['commitCount']
                                .toString(),
                            style: TextStyle(
                              fontFamily: 'BalooDa',
                              fontSize: 16,
                              color: Colors.black87,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  // Experience
                  Expanded(
                    flex: 1,
                    child: Row(
                      children: <Widget>[
                        Expanded(
                          flex: 3,
                          child: Icon(
                            Icons.multiline_chart,
                            color: Colors.orange,
                          ),
                        ),
                        Expanded(
                          flex: 10,
                          child: Text(
                            'Experience',
                            style: TextStyle(
                              fontFamily: 'BalooDa',
                              fontSize: 16,
                              color: Colors.black87,
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 3,
                          child: Text(
                            userState.user.languages[index]['experience']
                                .toString(),
                            style: TextStyle(
                              fontFamily: 'BalooDa',
                              fontSize: 16,
                              color: Colors.black87,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  // Temperature
                  Expanded(
                    flex: 1,
                    child: Row(
                      children: <Widget>[
                        Expanded(
                          flex: 3,
                          child: Icon(
                            Icons.whatshot,
                            color: Colors.yellowAccent,
                          ),
                        ),
                        Expanded(
                          flex: 10,
                          child: Text(
                            'Temperature',
                            style: TextStyle(
                              fontFamily: 'BalooDa',
                              fontSize: 16,
                              color: Colors.black87,
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 3,
                          child: Text(
                            '${userState.user.languages[index]['temperature'].toString()}°',
                            style: TextStyle(
                              fontFamily: 'BalooDa',
                              fontSize: 16,
                              color: Colors.black87,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Row(
                      children: <Widget>[
                        Expanded(
                          flex: 1,
                          child: FlatButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: Text(
                              'Close',
                              style: TextStyle(
                                fontFamily: 'BalooDa',
                                fontSize: 18,
                                color: Colors.purple,
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      );
    },
  );
}
