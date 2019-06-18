import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:scancode_app/src/providers/leader.dart';

Widget leadersItem(BuildContext context, int index) {
  final leaderState = Provider.of<LeaderProvider>(context);

  String _getLevel(param) {
    var _total = param;
    if (leaderState.leaders[index].experience['total'] != null) {
      if (_total < 200) {
        return 'Novice ($param xp)';
      } else if (_total >= 200 && _total < 400) {
        return 'Recruit ($param xp)';
      } else if (_total >= 400 && _total < 800) {
        return 'Pathfinder ($param xp)';
      } else if (_total >= 800 && _total < 1600) {
        return 'Ranger ($param xp)';
      } else if (_total >= 1600 && _total < 3200) {
        return 'Knight ($param xp)';
      } else if (_total >= 3200 && _total < 6400) {
        return 'King ($param xp)';
      } else if (_total >= 6400) {
        return 'Sage ($param xp)';
      } else {
        return '';
      }
    } else {
      if (_total < 200) {
        return '($param xp)';
      } else if (_total >= 200 && _total < 400) {
        return '($param xp)';
      } else if (_total >= 400 && _total < 800) {
        return '($param xp)';
      } else if (_total >= 800 && _total < 1600) {
        return '($param xp)';
      } else if (_total >= 1600 && _total < 3200) {
        return '($param xp)';
      } else if (_total >= 3200 && _total < 6400) {
        return '($param xp)';
      } else if (_total >= 6400) {
        return '($param xp)';
      } else {
        return '';
      }
    }
  }

  return Container(
    padding: EdgeInsets.only(right: 10, left: 10, top: 5, bottom: 5),
    child: Card(
        color: Colors.white,
        child: InkWell(
          onTap: () {},
          child: Container(
            height: 160,
            child: Row(
              children: <Widget>[
                Spacer(
                  flex: 1,
                ),
                Expanded(
                    flex: 6,
                    child: Container(
                      child: Column(
                        children: <Widget>[
                          Spacer(
                            flex: 1,
                          ),
                          Expanded(
                            flex: 8,
                            child: Container(
                              decoration: BoxDecoration(
                                border:
                                    Border.all(color: Colors.purple, width: 2),
                                borderRadius: BorderRadius.circular(10),
                                image: DecorationImage(
                                  fit: BoxFit.fill,
                                  image: NetworkImage(
                                      leaderState.leaders[index].avatarUrl),
                                ),
                              ),
                            ),
                          ),
                          Spacer(
                            flex: 1,
                          )
                        ],
                      ),
                    )),
                Spacer(),
                Expanded(
                    flex: 12,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Spacer(flex: 1),
                        Text(leaderState.leaders[index].name,
                            style: TextStyle(
                              fontFamily: 'BalooDa',
                              fontSize: 20,
                              color: Colors.black,
                            )),
                        Row(
                          children: <Widget>[
                            Flexible(
                              flex: 2,
                              child: Icon(Icons.place, color: Colors.purple),
                            ),
                            Spacer(
                              flex: 1,
                            ),
                            Expanded(
                              flex: 12,
                              child: Text(
                                leaderState.leaders[index].location,
                                textScaleFactor: 0.8,
                                style: TextStyle(
                                  fontFamily: 'BalooDa',
                                  fontSize: 15,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: <Widget>[
                            Flexible(
                              flex: 2,
                              child: Icon(Icons.multiline_chart,
                                  color: Colors.purple),
                            ),
                            Spacer(
                              flex: 1,
                            ),
                            Expanded(
                              flex: 12,
                              child: Text(
                                leaderState.leaders[index]
                                            .experience['total'] != null
                                    ? _getLevel(leaderState
                                        .leaders[index].experience['total'])
                                    : _getLevel(leaderState
                                        .leaders[index].experience.hashCode),
                                textScaleFactor: 0.8,
                                style: TextStyle(
                                  fontFamily: 'BalooDa',
                                  fontSize: 15,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: <Widget>[
                            Flexible(
                              flex: 2,
                              child: Icon(Icons.alternate_email,
                                  color: Colors.purple),
                            ),
                            Spacer(
                              flex: 1,
                            ),
                            Expanded(
                              flex: 12,
                              child: Text(
                                leaderState.leaders[index].username,
                                textScaleFactor: 0.8,
                                style: TextStyle(
                                  fontFamily: 'BalooDa',
                                  fontSize: 15,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                          ],
                        ),
                        Spacer(
                          flex: 1,
                        ),
                      ],
                    )),
                Spacer(
                  flex: 1,
                ),
                Expanded(
                    flex: 2,
                    child: Column(
                      children: <Widget>[
                        Spacer(
                          flex: 1,
                        ),
                        Expanded(
                          flex: 2,
                          child: CircleAvatar(
                            radius: 15,
                            backgroundColor: Colors.purple,
                            child: Text('${index + 1}',
                                style: TextStyle(
                                  fontFamily: 'BalooDa',
                                  color: Colors.white,
                                )),
                          ),
                        ),
                        Spacer(flex: 7)
                      ],
                    )),
                Spacer(
                  flex: 1,
                ),
              ],
            ),
          ),
        )),
  );
}
