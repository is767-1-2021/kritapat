import 'dart:async';
import 'dart:math';
import 'package:flutter_fortune_wheel/flutter_fortune_wheel.dart';
import 'package:flutter/material.dart';
import 'package:whatHome/widget/navigation_drawer_widget.dart';

class FerrisWheel extends StatefulWidget {
  @override
  _FerrisWheelState createState() => _FerrisWheelState();
}

class _FerrisWheelState extends State<FerrisWheel> {
  StreamController<int> selected = StreamController<int>();

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
          title: Text("Ferris Wheel"),
          leading:
              (ModalRoute.of(context)?.canPop ?? false) ? BackButton() : null,
          backgroundColor: Colors.green[800],
        ),
        body: GestureDetector(
          onTap: () {
            setState(() {
              selected.add(
                Random().nextInt(item.length),
              );
            });
          },
          child: Column(
            children: [
              Expanded(
                  child: FortuneWheel(
                items: [
                  for (var items in item)
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
}
