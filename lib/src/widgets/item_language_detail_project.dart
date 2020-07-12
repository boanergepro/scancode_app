import 'package:flutter/material.dart';
import 'package:scancode_app/src/providers/user.dart';
import 'package:scancode_app/src/api/end_points.dart';
import 'package:scancode_app/src/utils/capitalize.dart';
import 'package:scancode_app/src/widgets/cache_svg_picture.dart';

Widget itemLanguagesDetailProject(UserProvider userState, int index, int i) {
  // [int index]  => referencing al item project
  // [int i] => refer to the language in the list
  return ListTile(
    leading: CircleAvatar(
      backgroundColor: Colors.transparent,
      child: Container(
        child: CustomSvgPicture(
          '$URL_LANGUAGES${userState.user.repositories[index].languages[i]['name']}.svg',
        ),
      ),
    ),
    //Details from the language
    subtitle: Container(
      height: 200,
      child: Column(
        children: <Widget>[
          Text(
            capitalize(userState.user.repositories[index].languages[i]['name']),
            style: TextStyle(
                fontFamily: 'BalooDa', color: Colors.purple, fontSize: 18),
          ),
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
                    userState
                        .user.repositories[index].languages[i]['additionCount']
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
                    userState
                        .user.repositories[index].languages[i]['deletionCount']
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
                    userState
                        .user.repositories[index].languages[i]['commitCount']
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
                    userState
                        .user.repositories[index].languages[i]['experience']
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
                    '${userState.user.repositories[index].languages[i]['temperature'].toString()}°',
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
        ],
      ),
    ),
  );
}
