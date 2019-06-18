import 'package:flutter/material.dart';
import 'package:scancode_app/src/providers/leader.dart';
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
    return Container(
      height: 200,
      child: Column(
        children: <Widget>[
          Spacer(
            flex: 1,
          ),
          Expanded(
            flex: 5,
            child: Row(
              children: <Widget>[
                Spacer(
                  flex: 1,
                ),
                Expanded(
                  flex: 10,
                  child: DropdownButton(
                    hint: Text('All languages'),
                    items: listLanguageCode,
                    value: leaderState.languageCode,
                    onChanged: (value) {
                      leaderState.currentLanguageCode = value;
                    },
                  ),
                ),
                Spacer(
                  flex: 1,
                ),
                Expanded(
                  flex: 10,
                  child: DropdownButton(
                    hint: Text('All countries'),
                    items: listCountryCode,
                    value: leaderState.countryCode,
                    onChanged: (value) {
                      print(leaderState.countryCode);
                      print(value);
                      leaderState.currentCountryCode = value;
                    },
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
            flex: 2,
            child: Container(
              color: Colors.green,
            ),
          )
        ],
      ),
    );
  }
}