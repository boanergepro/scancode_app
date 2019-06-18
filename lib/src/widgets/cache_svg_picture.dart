import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'dart:io';

class CacheSvgPicture extends StatelessWidget {
  final String url;

  CacheSvgPicture(this.url);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: DefaultCacheManager().getSingleFile(url),
      builder: (BuildContext context, AsyncSnapshot<File> snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.waiting:
            return Container(
              padding: const EdgeInsets.all(30.0),
              child: Center(
                child: SpinKitCubeGrid(
                  size: 20,
                  color: Theme.of(context).primaryColor,
                ),
              ),
            );
          default:
            if (snapshot.hasData) {
              final _picture = snapshot.data;
              return SvgPicture.file(_picture);
            }
            return Icon(Icons.cached);
        }
      },
    );
  }
}
