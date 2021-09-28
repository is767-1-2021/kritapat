import 'dart:async';
import 'dart:math';

import 'package:flutter_fortune_wheel/flutter_fortune_wheel.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  StreamController<int> selected = StreamController<int>();

  @override
  void dispose() {
    selected.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final item = <String>[
      "Java",
      "Python",
      "C/C++",
      "Dart",
    ];

    return Scaffold(
        appBar: AppBar(
          title: Text("Fortune Wheel"),
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
