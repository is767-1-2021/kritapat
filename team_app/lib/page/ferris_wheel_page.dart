import 'dart:async';
import 'dart:math';
import 'package:flutter_fortune_wheel/flutter_fortune_wheel.dart';
import 'package:flutter/material.dart';
import 'package:whatHome/controllers/what_to_eat_controller.dart';
import 'package:whatHome/widget/navigation_drawer_widget.dart';

class FerrisWheel extends StatefulWidget {
  @override
  _FerrisWheelState createState() => _FerrisWheelState();
}

class _FerrisWheelState extends State<FerrisWheel> {
  StreamController<int> selected = StreamController<int>();

  WhatToEatController controller = WhatToEatController();

  List list = [];
  bool isLoading = false;

  @override
  void dispose() {
    selected.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final item = <String>[
      "กระเพราหมูสับ",
      "ไข่เจียวปู",
      "ต้มยำกุ้ง",
      "เกาเหลาหมูสับ",
    ];

    return Scaffold(
        endDrawer: NavigationDrawerWidget(),
        appBar: AppBar(
          centerTitle: true,
          title: Text("Ferris Wheel"),
          leading:
              (ModalRoute.of(context)?.canPop ?? false) ? BackButton() : null,
          backgroundColor: Colors.green[800],
        ),
        body: isLoading? CircularProgressIndicator() : list.length == 0? Center(child: Text('please select filter')):GestureDetector(
          onTap: () {
            setState(() {
              selected.add(
                Random().nextInt(list.length != 0 ? list.length: item.length),
              );
            });
          },
          child: Column(
            children: [
              Expanded(
                  child: FortuneWheel(
                items: [
                  for (var items in list)
                    FortuneItem(
                      child: Text(items),
                    )
                ],
                selected: selected.stream,
              ))
            ],
          ),
        ));
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
     controller.onSync
        .listen((bool syncState) => setState(() => isLoading = syncState));

    callFoodList();
  }

  Future<void> callFoodList() async {
    var data = await controller.fecthWhatToEatList();
    data.forEach((element) { 
      list.add(element.foodName);
    });
  }
}
