import 'package:flutter/material.dart';
import 'package:whatHome/model/retail_model.dart';
import 'package:whatHome/widget/navigation_drawer_widget.dart';

class FaqPage extends StatefulWidget {
  @override
  _FaqPage createState() => _FaqPage();
}

class _FaqPage extends State<FaqPage> {
  double hight = 0;
  bool isExpand = false;

  List<Model> dataList = [
    Model(
        question: "How does WhatToEat work ?",
        answer: 'We random the food for you',
        isExpand: false,
        hight: 0),
    Model(
        question: "Can I order food through WhatToEat ?",
        answer: 'Now, this is not possible.',
        isExpand: false,
        hight: 0),
    Model(
        question: "Can I use app to find restaurants aboard ?",
        answer:
            'The team is in the process of developing a system to enable this function.',
        isExpand: false,
        hight: 0),
    Model(
        question: "How can I give a service recommendation ?",
        answer: 'You can send us a message at xxxx@whattoeat.com',
        isExpand: false,
        hight: 0),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      endDrawer: NavigationDrawerWidget(),
      appBar: AppBar(
        centerTitle: true,
        leading:
            (ModalRoute.of(context)?.canPop ?? false) ? BackButton() : null,
        backgroundColor: Colors.green[800],
        elevation: 0,
      ),
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Colors.green[800],
                Colors.green[200],
              ]),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
              padding: EdgeInsets.symmetric(vertical: 30),
              child: Text(
                'FAQ',
                style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
              ),
            ),
            ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: 4,
                itemBuilder: (context, int index) {
                  final Model item = dataList[index];
                  return Container(
                    child: Column(
                      children: [
                        TextButton(
                          onPressed: () {
                            setState(() {
                              if (item.isExpand != null) {
                                item.isExpand = !item.isExpand;
                              }
                            });
                          },
                          child: Container(
                            padding: EdgeInsets.symmetric(horizontal: 20),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                // Question
                                Container(
                                  child: Text(
                                    "${item.question}",
                                    style: TextStyle(
                                        fontSize: 16, color: Colors.black),
                                  ),
                                ),

                                Icon(
                                  item.isExpand
                                      ? Icons.keyboard_arrow_up
                                      : Icons.keyboard_arrow_down,
                                  color: Colors.orange[300],
                                ),
                              ],
                            ),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: 20, vertical: 20),
                          height: item.isExpand ? null : 0,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                                colors: [
                                  Colors.green[600],
                                  Colors.green[200],
                                ]),
                          ),
                          child: Text('${item.answer}'),
                        ),
                      ],
                    ),
                  );
                }),
            SizedBox(
              height: 30,
            )
          ],
        ),
      ),
    );
  }
}
