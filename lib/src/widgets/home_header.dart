import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:scancode_app/src/providers/user.dart';
import 'package:scancode_app/src/widgets/avatar_picture.dart';
//281

class HomeHeader extends StatelessWidget {
  UserProvider userState;

  HomeHeader({ this.userState });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Container(
      height: size.height * 0.4,
      color: Colors.purple,
      child: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Container(
                width: size.width * 0.4,
                height: size.height * 0.2,
                child: AvatarPicture(userState.user.avatarUrl),
              ),
              //info
              Container(
                width: size.width * 0.5,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      userState.user.name,
                      style: TextStyle(
                        fontFamily: 'BalooDa',
                        fontSize: 20,
                        color: Colors.white,
                      ),
                    ),
                    Text(
                      userState.user.company,
                      style: TextStyle(
                        fontFamily: 'BalooDa',
                        fontSize: 17,
                        color: Colors.white,
                      ),
                    ),
                    Text(
                      userState.user.biography,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 5,
                      textScaleFactor: 0.8,
                      style: TextStyle(
                        fontFamily: 'BalooDa',
                        fontSize: 15,
                        color: Colors.grey[300],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Item(
                icon: FaIcon(
                  FontAwesomeIcons.mapMarkedAlt,
                ),
                title: userState.user.location,
              ),
              Item(
                icon: FaIcon(
                  FontAwesomeIcons.chartLine
                ),
                title: userState.user.level,
              ),
              Item(
                icon: FaIcon(
                  FontAwesomeIcons.at
                ),
                title: userState.user.username,
              ),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Column(
                children: <Widget>[
                  Text(
                    userState.user.repositoryCount.toString(),
                    textScaleFactor: 0.8,
                    style: TextStyle(
                      fontFamily: 'BalooDa',
                      fontSize: 25,
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    'Repository',
                    textScaleFactor: 0.8,
                    style: TextStyle(
                      fontFamily: 'BalooDa',
                      fontSize: 18,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
              Column(
                children: <Widget>[
                  Text(
                    userState.user.experience['total'].toString(),
                    textScaleFactor: 0.8,
                    style: TextStyle(
                      fontFamily: 'BalooDa',
                      fontSize: 25,
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    'Experience',
                    textScaleFactor: 0.8,
                    style: TextStyle(
                      fontFamily: 'BalooDa',
                      fontSize: 18,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
              Column(
                children: <Widget>[
                  Text(
                    userState.user.activeMonthCount.toString(),
                    textScaleFactor: 0.8,
                    style: TextStyle(
                      fontFamily: 'BalooDa',
                      fontSize: 25,
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    'Active month',
                    textScaleFactor: 0.8,
                    style: TextStyle(
                      fontFamily: 'BalooDa',
                      fontSize: 18,
                      color: Colors.white,
                    ),
                  ),
                ],
              )
            ],
          ),
        ],
      ),
    );;
  }
}

class Item extends StatelessWidget {
  FaIcon icon;
  String title;
  Item({this.icon, this.title});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        icon,
        SizedBox(width: 10,),
        Text(
          title,
          textScaleFactor: 0.8,
          style: TextStyle(
            fontFamily: 'BalooDa',
            fontSize: 20,
            color: Colors.white,
          ),
        )
      ],
    );
  }
}
