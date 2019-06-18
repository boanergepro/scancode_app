import 'package:flutter/material.dart';
import 'package:scancode_app/src/providers/leader.dart';
import 'package:scancode_app/src/providers/app.dart';
import 'package:provider/provider.dart';
import 'package:scancode_app/src/widgets/dropdown_language_code.dart';
import 'package:scancode_app/src/widgets/dropdown_country_code.dart';

class ModalBottomSheet extends StatefulWidget {
  _ModalBottomSheetState createState() => _ModalBottomSheetState();
}

class _ModalBottomSheetState extends State<ModalBottomSheet>
    with SingleTickerProviderStateMixin {
  Widget build(BuildContext context) {
    final leaderState = Provider.of<LeaderProvider>(context);
    final appState = Provider.of<AppProvider>(context);
    return Container(
      height: 180,
      child: Column(
        children: <Widget>[
          Spacer(
            flex: 1,
          ),
          Expanded(
            flex: 2,
            child: Text(
              'Select an option to filter',
              style: TextStyle(
                fontFamily: 'BalooDa',
                fontSize: 15,
                color: Colors.black,
              ),
            ),
          ),
          Spacer(
            flex: 1,
          ),
          Expanded(
            flex: 4,
            child: Row(
              children: <Widget>[
                Spacer(
                  flex: 1,
                ),
                Expanded(
                  flex: 10,
                  child: Container(
                      padding: EdgeInsets.only(left: 10),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          border: Border.all(color: Colors.purple)),
                      child: DropdownButtonHideUnderline(
                        child: DropdownButton(
                          hint: Text('All languages',
                              style: TextStyle(
                                fontFamily: 'BalooDa',
                                fontSize: 15,
                                color: Colors.black,
                              )),
                          items: listLanguageCode,
                          value: leaderState.languageCode,
                          onChanged: (value) {
                            leaderState.currentLanguageCode = value;
                          },
                        ),
                      )),
                ),
                Spacer(
                  flex: 1,
                ),
                Expanded(
                  flex: 10,
                  child: Container(
                    padding: EdgeInsets.only(left: 10),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        border: Border.all(color: Colors.purple)),
                    child: DropdownButtonHideUnderline(
                        child: DropdownButton(
                      hint: Text('All countries',
                          style: TextStyle(
                            fontFamily: 'BalooDa',
                            fontSize: 15,
                            color: Colors.black,
                          )),
                      items: listCountryCode,
                      value: leaderState.countryCode,
                      onChanged: (value) {
                        leaderState.currentCountryCode = value;
                      },
                    )),
                  ),
                ),
                Spacer(
                  flex: 1,
                )
              ],
            ),
          ),
          Spacer(
            flex: 1,
          ),
          Expanded(
            flex: 4,
            child: Row(
              children: <Widget>[
                Spacer(flex: 3),
                Expanded(
                  flex: 5,
                  child: Center(
                    child: RaisedButton(
                      color: Colors.purple,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.0)),
                      child: Text(
                        'Search',
                        style: TextStyle(
                          fontFamily: 'BalooDa',
                          fontSize: 15,
                          color: Colors.white,
                        ),
                      ),
                      onPressed: () async {
                        Navigator.pop(context);
                        appState.loadingOverlay = true;
                        var responseCode = await leaderState.loadDataLeaders(
                            countryCode: leaderState.countryCode,
                            languageCode: leaderState.languageCode);

                        if (responseCode == 200) {
                          appState.loadingOverlay = false;
                        } else {
                          appState.loadingOverlay = false;
                        }
                      }, //callback when button is clicked
                    ),
                  ),
                ),
                Spacer(flex: 3)
              ],
            ),
          ),
          Spacer(
            flex: 1,
          )
        ],
      ),
    );
  }
}
