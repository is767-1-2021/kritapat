import 'package:flutter/material.dart';
import 'package:whatHome/model/shop_model.dart';

class ShopDetailPage extends StatefulWidget {
  final ShopsModel list;

  ShopDetailPage({Key key, this.list});
  @override
  _ShopDetailPageState createState() => _ShopDetailPageState();
}

class _ShopDetailPageState extends State<ShopDetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Shop Detail'),
        backgroundColor: Colors.green[800],
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image.network(widget.list.image),
              Text(widget.list.shopName),
              Text(widget.list.location),
              ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: widget.list.menu.length,
                itemBuilder: (BuildContext contect, int index) {
                  final item = widget.list.menu[index];
                  return Container(
                    child: ListTile(
                      title: Text(item.name),
                      subtitle: Text("${item.price}"),
                    ),
                  );
                },
              ),
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Container(
                    color: Colors.yellow, child: Text('Go To Order...')),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
