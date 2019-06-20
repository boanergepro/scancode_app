import 'package:flutter/material.dart';
import 'package:scancode_app/src/providers/user.dart';
import 'package:scancode_app/src/widgets/avatar_picture.dart';

Widget homeHeader(UserProvider userState) {
  return Container(
    color: Colors.purple,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Expanded(
          flex: 4,
          child: Row(
            children: <Widget>[
              Spacer(flex: 1),
              Expanded(
                flex: 3,
                child: Column(
                  children: <Widget>[
                    Spacer(
                      flex: 1,
                    ),
                    Expanded(
                      flex: 12,
                      child: AvatarPicture(userState.user.avatarUrl),
                    ),
                    Spacer(
                      flex: 1,
                    ),
                  ],
                ),
              ),
              Spacer(flex: 1),
              Expanded(
                flex: 6,
                child: Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Expanded(
                        flex: 3,
                        child: Text(
                          userState.user.name,
                          style: TextStyle(
                            fontFamily: 'BalooDa',
                            fontSize: 17,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      Spacer(flex: 1),
                      Expanded(
                        flex: 8,
                        child: Text(
                          userState.user.biography,
                          overflow: TextOverflow.fade,
                          textScaleFactor: 0.8,
                          style: TextStyle(
                            fontFamily: 'BalooDa',
                            fontSize: 15,
                            color: Colors.grey[300],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Spacer(flex: 1),
            ],
          ),
        ),
        Expanded(
          flex: 2,
          child: Container(
            child: Row(
              children: <Widget>[
                Spacer(
                  flex: 1,
                ),
                Expanded(
                  flex: 3,
                  child: Row(
                    children: <Widget>[
                      Flexible(
                        flex: 2,
                        child: Icon(Icons.place),
                      ),
                      Spacer(
                        flex: 1,
                      ),
                      Expanded(
                        flex: 5,
                        child: Text(
                          userState.user.location,
                          textScaleFactor: 0.8,
                          style: TextStyle(
                            fontFamily: 'BalooDa',
                            fontSize: 15,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Spacer(
                  flex: 1,
                ),
                Expanded(
                  flex: 8,
                  child: Container(
                    child: Row(
                      children: <Widget>[
                        Flexible(
                          flex: 2,
                          child: Icon(Icons.multiline_chart),
                        ),
                        Spacer(
                          flex: 1,
                        ),
                        Expanded(
                          flex: 3,
                          child: Text(
                            userState.user.level,
                            textScaleFactor: 0.8,
                            style: TextStyle(
                              fontFamily: 'BalooDa',
                              fontSize: 15,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        Spacer(
                          flex: 1,
                        ),
                        Flexible(
                          flex: 2,
                          child: Icon(Icons.alternate_email),
                        ),
                        Spacer(
                          flex: 1,
                        ),
                        Expanded(
                          flex: 6,
                          child: Text(
                            userState.user.username,
                            textScaleFactor: 0.8,
                            style: TextStyle(
                              fontFamily: 'BalooDa',
                              fontSize: 15,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        Expanded(
          flex: 2,
          child: Container(
            child: Row(
              children: <Widget>[
                Expanded(
                  flex: 4,
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border(
                        right: BorderSide(color: Colors.grey),
                      ),
                    ),
                    child: Column(
                      children: <Widget>[
                        Expanded(
                          flex: 2,
                          child: Text(
                            userState.user.repositoryCount.toString(),
                            textScaleFactor: 0.8,
                            style: TextStyle(
                              fontFamily: 'BalooDa',
                              fontSize: 25,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        Flexible(
                          flex: 2,
                          child: Text(
                            'Repository',
                            textScaleFactor: 0.8,
                            style: TextStyle(
                              fontFamily: 'BalooDa',
                              fontSize: 18,
                              color: Colors.white,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                Spacer(
                  flex: 1,
                ),
                Expanded(
                  flex: 4,
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border(
                        right: BorderSide(
                          color: Colors.grey,
                        ),
                      ),
                    ),
                    child: Column(
                      children: <Widget>[
                        Expanded(
                          flex: 2,
                          child: Text(
                            userState.user.experience['total'].toString(),
                            textScaleFactor: 0.8,
                            style: TextStyle(
                              fontFamily: 'BalooDa',
                              fontSize: 25,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        Flexible(
                          flex: 2,
                          child: Text(
                            'Experience',
                            textScaleFactor: 0.8,
                            style: TextStyle(
                              fontFamily: 'BalooDa',
                              fontSize: 18,
                              color: Colors.white,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                Spacer(
                  flex: 1,
                ),
                Expanded(
                  flex: 4,
                  child: Column(
                    children: <Widget>[
                      Expanded(
                        flex: 2,
                        child: Text(
                          userState.user.activeMonthCount.toString(),
                          textScaleFactor: 0.8,
                          style: TextStyle(
                            fontFamily: 'BalooDa',
                            fontSize: 25,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      Flexible(
                        flex: 2,
                        child: Text(
                          'Active month',
                          textScaleFactor: 0.8,
                          style: TextStyle(
                            fontFamily: 'BalooDa',
                            fontSize: 18,
                            color: Colors.white,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        )
      ],
    ),
  );
}
