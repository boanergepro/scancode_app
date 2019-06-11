import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:scancode_app/src/providers/leader.dart';

class LeadersScreen extends StatelessWidget {
  static final routerName = '/leaders';

  @override
  Widget build(BuildContext context) {
    final leaderState = Provider.of<LeaderProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Leaders'),
      ),
      body: ListView.builder(
        itemCount: leaderState.leaders.length,
        itemBuilder: (context, int index) {
          return Card(
            color: Colors.purple,
            child: Row(
              children: <Widget>[
                Expanded(
                  flex: 5,
                  child: Column(
                    children: <Widget>[
                      Text(''),
                      Row(
                        children: <Widget>[
                          Spacer(flex: 3),
                          CircleAvatar(radius: 15,
                          backgroundColor: Colors.purple[200],
                            child: Text('${index+1}',style: TextStyle(
                              fontFamily: 'BalooDa',
                              color: Colors.white,
                            )),
                          ),
                          Spacer(flex: 3),
                          Container(
                            height: 100,
                            width: 100,
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.purple[200], width: 2),
                              borderRadius: BorderRadius.circular(10),
                              image: DecorationImage(
                                fit: BoxFit.fill,
                                image: NetworkImage(leaderState.leaders[index].avatarUrl),
                              ),
                            ),
                          )
                        ],
                      ),
                      Text('')
                    ],
                  )
                ),
                Spacer(),
                Expanded(
                  flex: 8,
                  child: Column(
                    children: <Widget>[
                      Text(leaderState.leaders[index].name, style: TextStyle(
                        fontFamily: 'BalooDa',
                        fontSize: 20,
                        color: Colors.white,
                      )),
                      Row(mainAxisAlignment: MainAxisAlignment.center,
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
                              leaderState.leaders[index].location,
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
                      Text(''),
                      Row(mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Flexible(
                            flex: 2,
                            child: Icon(Icons.multiline_chart),
                          ),
                          Spacer(
                            flex: 1,
                          ),
                          Expanded(
                            flex: 5,
                            child: Text(
                              _getLevel(leaderState.leaders[index].experience['total']),
                              textScaleFactor: 0.8,
                              style: TextStyle(
                                fontFamily: 'BalooDa',
                                fontSize: 15,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ],
                      )
                    ],
                  )
                )
              ],
            )
          );
        },
      ),
    );
  }

  String _getLevel(int param) {
    int _total = param;
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
  }
}

