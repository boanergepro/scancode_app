import 'package:flutter/material.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'dart:io';

class AvatarPicture extends StatelessWidget {
  final String url;

  AvatarPicture(this.url);

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
              return Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.purple[200], width: 2),
                  borderRadius: BorderRadius.circular(10),
                  image: DecorationImage(
                    fit: BoxFit.fill,
                    image: FileImage(_picture),
                  ),
                ),
              );
            }
            return Icon(Icons.cached);
        }
      },
    );
  }
}
