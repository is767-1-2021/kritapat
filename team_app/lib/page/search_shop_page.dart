import 'package:flutter/material.dart';
import 'package:whatHome/model/retail_model.dart';
import 'package:whatHome/widget/navigation_drawer_widget.dart';

class SearchShopPage extends StatefulWidget {
  @override
  _SearchShopPage createState() => _SearchShopPage();
}

class _SearchShopPage extends State<SearchShopPage> {
  final _formKey = GlobalKey<FormState>();
  List<FoodListModel> dataList = [
    FoodListModel(
        name: 'Pornchai Tamsung',
        location:
            'Soi Pridi Banomyong 46, Sukhumvit 71, Khlong Tan, Watthana, Bangkok, 10110',
        menu: [
          MenuModel(name: 'Fried Rice', price: 60),
          MenuModel(name: 'Thai Rice Porridge Soup', price: 70),
          MenuModel(name: 'Sukiyaki', price: 70),
          MenuModel(name: 'Tom Yum Fried Rice', price: 60),
        ],
        image:
            'https://lh5.googleusercontent.com/p/AF1QipN-eUmgt5f4l4wLgX0dIUdDrmnoXBLGbF7yC_-n=w1080-k-no'),
    FoodListModel(
        name: 'Som Tum Rak Dee',
        location:
            '324 Soi Ramkhmahaeng 24 Yak 18, Huamark, Bangkapi, Bangkok, 10240',
        menu: [
          MenuModel(name: 'Grilled Pork', price: 109),
          MenuModel(name: 'Spicy Chicken Feet Soup', price: 79),
          MenuModel(name: 'Thai Papaya Salad', price: 59),
          MenuModel(name: 'Sticky Rice', price: 15),
        ],
        image:
            'https://i.pinimg.com/originals/1d/6d/13/1d6d1334a297c1ce180f78dc551ecf4c.jpg'),
    FoodListModel(
        name: 'Fruit Chae Yen',
        location:
            '2011/1-3 Soi Ramkhmahaeng 29, Huamark, Bangkapi, Bangkok, 10240',
        menu: [
          MenuModel(name: 'Phuket Pineapple', price: 35),
          MenuModel(name: 'Watermelon', price: 30),
          MenuModel(name: 'Dragon Fruit', price: 60),
          MenuModel(name: 'Apple', price: 35),
        ],
        image:
            'https://img.wongnai.com/p/1920x0/2020/03/23/2d383bc54d784f0289426fb0f9b1d69f.jpg'),
    FoodListModel(
        name: 'Roti Abdul',
        location:
            '2223/24 Soi Ramkhamhaeng 51/2, Hua Mak, Bangkapi, Bangkok, 10240',
        menu: [
          MenuModel(name: 'Roti Milo', price: 25),
          MenuModel(name: 'Roti with egg', price: 25),
          MenuModel(name: 'Roti with yam', price: 30),
          MenuModel(name: 'Regular Roti', price: 15),
        ],
        image:
            'https://media.edgeprop.my/s3fs-public/editorial/my/2020/April/22/118115353_s.jpg'),
    FoodListModel(
        name: 'Chincha Bubble Tea',
        location: '100 Soi Ramkhmahaeng 24, Huamark, Bangkapi, Bangkok, 10240',
        menu: [
          MenuModel(name: 'Taiwan Milk Tea', price: 25),
        ],
        image:
            'https://10619-2.s.cdn12.com/rests/small/w550/h367/110_508774904.jpg'),
    FoodListModel(
        name: 'Sam Grilled',
        location: 'Point Plaza, Phatthanakan 29, Bangkok, 10250',
        menu: [
          MenuModel(name: 'Fried Chicken Kabab', price: 75),
          MenuModel(name: 'Grilled Beef Steck Kebab', price: 50),
          MenuModel(name: 'Biryani Rice', price: 50),
          MenuModel(name: 'Chicken Zinger Burger', price: 149),
        ],
        image:
            'https://d1ralsognjng37.cloudfront.net/310c0443-2ec4-43d3-a7cc-c6004d6ed67b.webp'),
  ];

  List<FoodListModel> dataTemp;
  FoodListModel selectData;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    dataTemp = dataList;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      endDrawer: NavigationDrawerWidget(),
      appBar: AppBar(
        title: Text("Search Rastaurant"),
        leading:
            (ModalRoute.of(context)?.canPop ?? false) ? BackButton() : null,
        backgroundColor: Colors.green[800],
      ),
      body: Form(
        key: _formKey,
        child: Container(
          // padding: ,
          // margin: ,
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.all(25),
                  child: Row(
                    children: [
                      Icon(Icons.search),
                      Expanded(
                        child: TextField(
                          onTap: () {
                            setState(() {
                              dataTemp = dataList;
                            });
                          },
                          onChanged: (text) {
                            setState(() {
                              dataTemp = dataList
                                  .where((item) => item.name
                                      .toLowerCase()
                                      .contains(text.toLowerCase()))
                                  .toList();
                            });
                          },
                          decoration: InputDecoration(
                            hintText: 'type in Rastaurant name...',
                            border: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.teal)),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  // height: 100,
                  child: ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: dataTemp?.length ?? 0,
                    itemBuilder: (BuildContext contect, int index) {
                      final item = dataTemp[index];
                      return Container(
                        padding: EdgeInsets.all(20),
                        child: ListTile(
                          onTap: () {
                            if (_formKey.currentState.validate()) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                    content: Text('Processing Data')),
                              );
                            }
                            setState(() {
                              selectData = item;
                              dataTemp = [];
                            });
                            print(item.name);
                          },
                          title: Text(item.name),
                          subtitle: Text(item.location),
                        ),
                      );
                    },
                  ),
                ),
                selectData != null
                    ? Container(
                        padding: EdgeInsets.all(20),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Image.network(selectData.image),
                            Text(selectData.name),
                            Text(selectData.location),
                            ListView.builder(
                              shrinkWrap: true,
                              physics: NeverScrollableScrollPhysics(),
                              itemCount: selectData.menu.length,
                              itemBuilder: (BuildContext contect, int index) {
                                final item = selectData.menu[index];
                                return Container(
                                  child: ListTile(
                                    title: Text(item.name),
                                    subtitle: Text("${item.price}"),
                                  ),
                                );
                              },
                            ),
                            TextButton(
                              onPressed: () {},
                              child: Container(
                                  color: Colors.yellow,
                                  child: Text('Go To Order...')),
                            ),
                          ],
                        ),
                      )
                    : Container(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
