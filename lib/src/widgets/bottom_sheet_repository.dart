import 'package:flutter/material.dart';
import 'package:scancode_app/src/providers/user.dart';
import 'package:scancode_app/src/api/end_points.dart';
import 'package:scancode_app/src/widgets/cache_svg_picture.dart';
import 'package:scancode_app/src/widgets/item_language_detail_project.dart';

void showBottomSheetRepository(
    BuildContext context, UserProvider userState, int index) {
  showBottomSheet(
    context: context,
    builder: (BuildContext bc) {
      return Container(
        height: MediaQuery.of(context).size.height,
        color: Colors.white,
        child: Column(
          children: <Widget>[
            // header
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(left: 8),
                    child: Text(
                      'Porject Details',
                      style: TextStyle(
                        fontFamily: 'BalooDa',
                        fontSize: 18,
                      ),
                    ),
                  ),
                  IconButton(
                    icon: Icon(
                      Icons.close,
                      color: Colors.purple,
                      size: 25,
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                ],
              ),
            ),
            Spacer(
              flex: 1,
            ),
            // Body
            Expanded(
              flex: 30,
              child: Column(
                children: <Widget>[
                  // Avatar and ful name
                  Expanded(
                    flex: 1,
                    child: ListTile(
                      leading: CircleAvatar(
                        backgroundColor: Colors.transparent,
                        child: userState.user.repositories[index].private
                            ? Container(
                                child: CustomSvgPicture(
                                  '$URL_INTEGRATIONS${userState.user.repositories[index].source.toLowerCase()}.svg',
                                ),
                              )
                            : Container(
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: NetworkImage(userState
                                        .user.repositories[index].imageUrl),
                                  ),
                                ),
                              ),
                      ),
                      title: Text(
                        userState.user.repositories[index].private
                            ? 'A private repository'
                            : userState.user.repositories[index].fullName,
                        //overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontFamily: 'BalooDa',
                        ),
                      ),
                    ),
                  ),
                  // Description
                  Expanded(
                    flex: 4,
                    child: Column(
                      children: <Widget>[
                        Spacer(
                          flex: 5,
                        ),
                        // Header(Title)
                        Expanded(
                          flex: 4,
                          child: Row(
                            children: <Widget>[
                              Spacer(
                                flex: 1,
                              ),
                              Expanded(
                                flex: 30,
                                child: Text(
                                  'Description',
                                  style: TextStyle(
                                    fontFamily: 'BalooDa',
                                    fontSize: 15,
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),

                        // Items descriptions
                        Expanded(
                          flex: 8,
                          child: Container(
                            child: ListView(
                              scrollDirection: Axis.horizontal,
                              children: <Widget>[
                                SizedBox(
                                  width: 8,
                                ),
                                // starts
                                Chip(
                                  avatar: Icon(Icons.star),
                                  label: Text(
                                    'Stars ${userState.user.repositories[index].starCount.toString()}',
                                    style: TextStyle(
                                      fontFamily: 'BalooDa',
                                      color: Colors.white,
                                    ),
                                  ),
                                  backgroundColor: Colors.purple,
                                  elevation: 4,
                                ),
                                SizedBox(
                                  width: 8,
                                ),
                                // Contributors
                                Chip(
                                  avatar: Icon(Icons.people_outline),
                                  label: Text(
                                    'Contributors ${userState.user.repositories[index].contributorCount.toString()}',
                                    style: TextStyle(
                                      fontFamily: 'BalooDa',
                                      color: Colors.white,
                                    ),
                                  ),
                                  backgroundColor: Colors.purple,
                                  elevation: 4,
                                ),
                                SizedBox(
                                  width: 8,
                                ),
                                // Active Months
                                Chip(
                                  avatar: Icon(Icons.access_time),
                                  label: Text(
                                    'Months Active in the Project ${userState.user.repositories[index].activeMonthCount.toString()}',
                                    style: TextStyle(
                                      fontFamily: 'BalooDa',
                                      color: Colors.white,
                                    ),
                                  ),
                                  backgroundColor: Colors.purple,
                                  elevation: 4,
                                ),
                                SizedBox(
                                  width: 8,
                                ),
                                // Project Familiarity
                                Chip(
                                  avatar: Icon(Icons.pie_chart_outlined),
                                  label: Text(
                                    'Project Familiarity ${userState.user.repositories[index].familiarity}%',
                                    style: TextStyle(
                                      fontFamily: 'BalooDa',
                                      color: Colors.white,
                                    ),
                                  ),
                                  backgroundColor: Colors.purple,
                                  elevation: 4,
                                ),
                                SizedBox(
                                  width: 8,
                                ),
                                //Comment Coverage
                                userState.user.repositories[index]
                                            .commentCoverage !=
                                        0
                                    ? Chip(
                                        avatar: Icon(Icons.code),
                                        label: Text(
                                          'Comment Coverage ${userState.user.repositories[index].commentCoverage.toString()}%',
                                          style: TextStyle(
                                            fontFamily: 'BalooDa',
                                            color: Colors.white,
                                          ),
                                        ),
                                        backgroundColor: Colors.purple,
                                        elevation: 4,
                                      )
                                    : Text('')
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  // List Languages
                  Expanded(
                    flex: 10,
                    child: Container(
                      color: Colors.white,
                      child: userState.user.repositories[index].languages.length > 1 ? ListView.separated(
                        itemCount:
                            userState.user.repositories[index].languages.length,
                        itemBuilder: (BuildContext context, i) {
                          return itemLanguagesDetailProject(
                              userState, index, i);
                        },
                        separatorBuilder: (context, i) => Divider(),
                      ) : Center(
                        child: Text(
                          'Nothing to show',
                          style: TextStyle(
                            fontFamily: 'BalooDa',
                            fontSize: 18,
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      );
    },
  );
}
