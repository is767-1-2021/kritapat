import 'package:whatHome/model/first_form_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:whatHome/widget/navigation_drawer_widget.dart';

class ResultPage extends StatefulWidget {
  @override
  State<ResultPage> createState() => _ResultPageState();
}

class _ResultPageState extends State<ResultPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      endDrawer: NavigationDrawerWidget(),
      appBar: AppBar(
        leading:
            (ModalRoute.of(context)?.canPop ?? false) ? BackButton() : null,
        backgroundColor: Colors.green[800],
        title: Text('Result Page'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.all(20.0),
              child: Consumer<FirstFormModel>(
                builder: (context, form, child) {
                  return Text(
                      'Your User name is ${form.userName} and Your Email is ${form.email}');
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
