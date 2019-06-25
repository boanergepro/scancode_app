import 'package:flutter/material.dart';
import 'package:scancode_app/src/providers/user.dart';
import 'package:scancode_app/src/api/end_points.dart';
import 'package:scancode_app/src/widgets/bottom_sheet_repository.dart';
import 'package:scancode_app/src/widgets/cache_svg_picture.dart';

Widget itemRepositories(
    BuildContext context, UserProvider userState, int index) {
  return Container(
    margin: EdgeInsets.only(
      top: 5,
      right: 10,
      bottom: 5,
      left: 10,
    ),
    child: Card(
      child: InkWell(
        onTap: () {
          showBottomSheetRepository(context, userState, index);
        },
        child: Container(
          height: MediaQuery.of(context).size.height / 3,
          child: Column(
            children: <Widget>[
              Spacer(
                flex: 1,
              ),
              Expanded(
                flex: 12,
                child: Container(
                  child: Column(
                    children: <Widget>[
                      // avatar and full name
                      Expanded(
                        flex: 2,
                        child: Row(
                          children: <Widget>[
                            // Avatar
                            Expanded(
                              flex: 2,
                              child: userState.user.repositories[index].private
                                  ? Container(
                                      child: CacheSvgPicture(
                                        '$URL_INTEGRATIONS${userState.user.repositories[index].source.toLowerCase()}.svg',
                                      ),
                                    )
                                  : Container(
                                      decoration: BoxDecoration(
                                        image: DecorationImage(
                                          image: NetworkImage(userState.user
                                              .repositories[index].imageUrl),
                                        ),
                                      ),
                                    ),
                            ),
                            // Full name
                            Expanded(
                              flex: 8,
                              child: Text(
                                userState.user.repositories[index].private
                                    ? 'A private repository'
                                    : userState
                                        .user.repositories[index].fullName,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  fontFamily: 'BalooDa',
                                ),
                              ),
                            ),
                            Spacer(
                              flex: 2,
                            )
                          ],
                        ),
                      ),
                      // Description
                      Expanded(
                        flex: 2,
                        child: Row(
                          children: <Widget>[
                            Spacer(flex: 1),
                            // starts
                            Expanded(
                              flex: 6,
                              child: Container(
                                child: userState
                                            .user.repositories[index].private ==
                                        false
                                    ? Row(
                                        children: <Widget>[
                                          Expanded(
                                            flex: 5,
                                            child: Icon(
                                              Icons.star,
                                              color: Colors.purple,
                                            ),
                                          ),
                                          Spacer(
                                            flex: 1,
                                          ),
                                          Expanded(
                                            flex: 5,
                                            child: Text(
                                              userState.user.repositories[index]
                                                  .starCount
                                                  .toString(),
                                              style: TextStyle(
                                                fontFamily: 'BalooDa',
                                              ),
                                            ),
                                          ),
                                        ],
                                      )
                                    : Container(
                                        child: Icon(
                                          Icons.lock_outline,
                                          color: Colors.purple,
                                        ),
                                      ),
                              ),
                            ),
                            Spacer(
                              flex: 1,
                            ),
                            // Contributors
                            Expanded(
                              flex: 6,
                              child: Container(
                                child: Row(
                                  children: <Widget>[
                                    Expanded(
                                      flex: 5,
                                      child: Icon(
                                        Icons.people_outline,
                                        color: Colors.purple,
                                      ),
                                    ),
                                    Spacer(
                                      flex: 1,
                                    ),
                                    Expanded(
                                      flex: 5,
                                      child: Text(
                                        userState.user.repositories[index]
                                            .contributorCount
                                            .toString(),
                                        style: TextStyle(
                                          fontFamily: 'BalooDa',
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Spacer(
                              flex: 1,
                            ),
                            // Active Months
                            Expanded(
                              flex: 6,
                              child: Container(
                                child: Row(
                                  children: <Widget>[
                                    Expanded(
                                      flex: 5,
                                      child: Icon(
                                        Icons.access_time,
                                        color: Colors.purple,
                                      ),
                                    ),
                                    Spacer(
                                      flex: 1,
                                    ),
                                    Expanded(
                                      flex: 5,
                                      child: Text(
                                        userState.user.repositories[index]
                                            .activeMonthCount
                                            .toString(),
                                        style: TextStyle(
                                          fontFamily: 'BalooDa',
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            // Project Familiarity
                            Expanded(
                              flex: 6,
                              child: Container(
                                child: Row(
                                  children: <Widget>[
                                    Expanded(
                                      flex: 5,
                                      child: Icon(
                                        Icons.pie_chart_outlined,
                                        color: Colors.purple,
                                      ),
                                    ),
                                    Spacer(
                                      flex: 1,
                                    ),
                                    Expanded(
                                      flex: 5,
                                      child: Text(
                                        userState.user.repositories[index]
                                                .familiarity
                                                .toString() +
                                            '%',
                                        style: TextStyle(
                                          fontFamily: 'BalooDa',
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Spacer(
                              flex: 1,
                            ),
                            //Comment Coverage
                            userState.user.repositories[index]
                                        .commentCoverage !=
                                    0
                                ? Expanded(
                                    flex: 6,
                                    child: Container(
                                      child: Row(
                                        children: <Widget>[
                                          Expanded(
                                            flex: 5,
                                            child: Icon(
                                              Icons.code,
                                              color: Colors.purple,
                                            ),
                                          ),
                                          Spacer(
                                            flex: 1,
                                          ),
                                          Expanded(
                                            flex: 5,
                                            child: Text(
                                              userState.user.repositories[index]
                                                      .commentCoverage
                                                      .toString() +
                                                  '%',
                                              style: TextStyle(
                                                fontFamily: 'BalooDa',
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  )
                                : Text('')
                          ],
                        ),
                      ),
                      Expanded(
                        flex: 8,
                        child: userState
                                    .user.repositories[index].languages.length >
                                1
                            ? LayoutBuilder(
                                builder: (context, constraints) {
                                  return GridView.count(
                                    physics: ScrollPhysics(),
                                    crossAxisCount: 5,
                                    crossAxisSpacing: 13,
                                    children: List.generate(
                                      userState.user.repositories[index]
                                          .languages.length,
                                      (indexx) {
                                        return Container(
                                          margin: EdgeInsets.only(
                                              left: 10, right: 10),
                                          width: constraints.maxHeight / 1,
                                          height: constraints.maxHeight / 1,
                                          child: CacheSvgPicture(
                                            '$URL_LANGUAGES${userState.user.repositories[index].languages[indexx]['name']}.svg',
                                          ),
                                        );
                                      },
                                    ),
                                  );
                                },
                              )
                            : Container(
                                child: Center(
                                  child: Text(
                                    'Nothing to show',
                                    style: TextStyle(
                                      fontFamily: 'BalooDa',
                                      fontSize: 18,
                                    ),
                                  ),
                                ),
                              ),
                      ),
                    ],
                  ),
                ),
              ),
              Spacer(
                flex: 1,
              ),
            ],
          ),
        ),
      ),
    ),
  );
}
