import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:whatHome/controllers/favorite_controller.dart';
import 'package:whatHome/model/what_to_eat_model.dart';
import 'package:whatHome/provider/bookmark_model.dart';
import 'package:whatHome/widget/navigation_drawer_widget.dart';

class bookMarkPage extends StatefulWidget {
  const bookMarkPage({Key key}) : super(key: key);

  @override
  _bookMarkPageState createState() => _bookMarkPageState();
}

class _bookMarkPageState extends State<bookMarkPage> {
  FavoriteController controller = FavoriteController();
  List<WhatToEatModel> list = [];

  @override
  Widget build(BuildContext context) {
    var bookMarkBloc = Provider.of<BookmarkBloc>(context);

    return Scaffold(
      endDrawer: NavigationDrawerWidget(),
      appBar: AppBar(
         centerTitle: true,
        title: Text('Bookmarks'),
        leading:
            (ModalRoute.of(context)?.canPop ?? false) ? BackButton() : null,
        backgroundColor: Colors.green[800],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ListView.builder(
              itemCount: list.length,
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                var item = list[index];
                return ListTile(
                  title: Text(item.foodName),
                  subtitle: Text(item.foodInfo),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    callFavoriteList();
  }

  Future<void> callFavoriteList() async {
    var data = await controller.favoriteList();
    data.forEach((element) {
      if (element.favorite) {
        setState(() {
          list.add(element);
        });
      }
    });
  }
}
