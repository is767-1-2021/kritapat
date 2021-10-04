import 'package:flutter/material.dart';
import 'package:whatHome/widget/navigation_drawer_widget.dart';

class ProfilePage2 extends StatelessWidget {
  final String name;
  final String urlImage;

  const ProfilePage2({
    Key key,
    this.name,
    this.urlImage,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
        endDrawer: NavigationDrawerWidget(),
        appBar: AppBar(
          leading:
              (ModalRoute.of(context)?.canPop ?? false) ? BackButton() : null,
          backgroundColor: Colors.green[800],
          elevation: 0.0,
          title: Text(name),
          centerTitle: true,
        ),
        extendBodyBehindAppBar: true,
        body: Image.network(
          urlImage,
          width: double.infinity,
          height: double.infinity,
          fit: BoxFit.cover,
        ),
      );
}
