import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:whatHome/controllers/favorite_controller.dart';
import 'package:whatHome/model/what_to_eat_model.dart';
import 'package:whatHome/page/bookmarks_page.dart';
import 'package:whatHome/provider/bookmark_model.dart';
import 'package:whatHome/model/food_model.dart';
import 'package:whatHome/widget/navigation_drawer_widget.dart';

class FavoritePage extends StatefulWidget {
  @override
  _FavoritePageState createState() => _FavoritePageState();
}

class _FavoritePageState extends State<FavoritePage> {
  String title = 'FavoriteButton';
  List foodList = [
    {
      'title': 'Kaijiew1',
      'subtitle': 'this is item1',
      'status': 'false',
    },
    {
      'title': 'Kaijiew2',
      'subtitle': 'this is item1',
      'status': 'false',
    },
    {
      'title': 'Kaijiew3',
      'subtitle': 'this is item1',
      'status': 'false',
    },
  ];

  FavoriteController controller = FavoriteController();

  List<WhatToEatModel> list = [];
  int favoriteCount = 0;

  Widget build(BuildContext context) {
    var bookMarkBloc = Provider.of<BookmarkBloc>(context);
  

    //FoodModel foodModel = new FoodModel();

    return Scaffold(
      endDrawer: NavigationDrawerWidget(),
      appBar: AppBar(
        title: Text('FavoritePage'),
        leading:
            (ModalRoute.of(context)?.canPop ?? false) ? BackButton() : null,
        backgroundColor: Colors.green[800],
        actions: [
          Row(
            children: [
              Text(count().toString()),
              IconButton(
                icon: Icon(Icons.favorite_border),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => bookMarkPage(),
                      ));
                },
              ),
            ],
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: list.length,
              itemBuilder: (context, index) {
                var item = list[index];
                return ListTile(
                  onTap: () async {
                    // bookMarkBloc.addCount();
                    // //print(bookMarkBloc.count);

                    // FoodModel foodModel = new FoodModel(
                    //   title: foodList[index]['title'],
                    //   subtitle: foodList[index]['subtitle'],
                    //   status: foodList[index]['status'],
                    // );

                    // bookMarkBloc.addFood(foodModel);

                    // print(bookMarkBloc.items[index].title);
                    // print(bookMarkBloc.items.length);

                    // setState(() {
                    //   foodList[index]['status'] = 'true';
                    // });
                    setState(() {
                      item.favorite = !item.favorite;
                    });
                    if(item.favorite){
                      bookMarkBloc.addCount();
                      bookMarkBloc.addFood(item);
                    }else{
                      bookMarkBloc.decreaseCount();
                      bookMarkBloc.removeFood(item);
                    }
                    await updateFavoriteToFireBase(list);
                  },
                  title: Text(item.foodName),
                  subtitle: Text(item.foodInfo),
                  trailing: item.favorite
                      ? Icon(Icons.favorite, color: Colors.red,): Icon(Icons.favorite_border),
                );
              },
            )
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
   setState(() {
     list = data;
   });
   favoriteCount = 0;
   list.forEach((element) { 
     if(element.favorite){
       setState(() {
         favoriteCount++;
       });
     }
   });
  }

  int count(){
    var count = 0;
    list.forEach((element) { 
     if(element.favorite){
       setState(() {
         count++;
       });
     }
   });
   return count;
  }

  Future<void> updateFavoriteToFireBase(List<WhatToEatModel> model) async {
    await controller.updatefavoriteList(model);
  }
}
