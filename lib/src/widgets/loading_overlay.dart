import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoadingOverlay extends StatefulWidget {
  final bool loading;

  LoadingOverlay({
    @required this.loading,
  });

  @override
  _LoadingOverlayState createState() => _LoadingOverlayState();
}

class _LoadingOverlayState extends State<LoadingOverlay> {
  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) {
        if (widget.loading) {
          return Container(
            width: double.infinity,
            height: double.infinity,
            color: Color(0x80FFFFFF),
            child: Center(
              child: SpinKitCubeGrid (
                color: Theme.of(context).primaryColor,
              ),
            ),
          );
        } else {
          return Container();
        }
      },
    );
  }
}
