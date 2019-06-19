import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:scancode_app/src/providers/leader.dart';
import 'package:scancode_app/src/providers/app.dart';
import 'package:scancode_app/src/widgets/drawer.dart';
import 'package:scancode_app/src/widgets/leaders.item.dart';
import 'package:scancode_app/src/widgets/bottom_sheet_filter_leaders.dart';
import 'package:scancode_app/src/widgets/loading_overlay.dart';

class LeadersScreen extends StatelessWidget {
  static final routerName = '/leaders';

  @override
  Widget build(BuildContext context) {
    final leaderState = Provider.of<LeaderProvider>(context);
    final appState = Provider.of<AppProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Leaders',
          style: TextStyle(
            fontFamily: 'BalooDa',
            fontSize: 20,
            color: Colors.white,
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Future(
            () => showModalBottomSheet(
                  context: context,
                  builder: (context) {
                    return ModalBottomSheet();
                  },
                ),
          );
        },
        backgroundColor: Colors.white,
        icon: Icon(
          Icons.filter_list,
          color: Colors.purple,
        ),
        label: Text(
          'Filter',
          style: TextStyle(
            fontFamily: 'BalooDa',
            fontSize: 15,
            color: Colors.black,
          ),
        ),
      ),
      drawer: drawer(context),
      body: Stack(
        children: <Widget>[
          Column(
            children: <Widget>[
              Expanded(
                  flex: 9,
                  child: ListView.builder(
                    itemCount: leaderState.leaders.length,
                    itemBuilder: (context, int index) {
                      return leadersItem(context, index);
                    },
                  ))
            ],
          ),
          LoadingOverlay(
            loading: appState.loadingOverlay,
          ),
        ],
      ),
    );
  }
}
