import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class CustomSvgPicture extends StatelessWidget {
  final String url;

  CustomSvgPicture(this.url);

  @override
  Widget build(BuildContext context) {
    return SvgPicture.network(
      url,
      placeholderBuilder: (BuildContext context) => Container(
        padding: const EdgeInsets.all(30.0),
        child: Center(
          child: SpinKitCubeGrid(
            size: 20,
            color: Theme.of(context).primaryColor,
          ),
        ),
      ),
    );
  }
}
