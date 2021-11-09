import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:whatHome/page/home_page.dart';
import 'package:whatHome/page/todo_page.dart';
import 'package:whatHome/provider/feedback_position_provider.dart';
import 'package:whatHome/model/first_form_model.dart';
import 'package:whatHome/provider/bookmark_model.dart';
import 'package:whatHome/services/services.dart';

import 'controllers/todo.dart';

const Color darkBlue = Color.fromARGB(255, 18, 32, 47);

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  var services = FirebaseServices();
  var controller = TodoController(services);

  runApp(TodoApp(controller: controller));
  /*runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => FeedbackPositionProvider()),
        ChangeNotifierProvider(
          create: (context) => FirstFormModel(),
        ),
        ChangeNotifierProvider(
          create: (context) => BookmarkBloc(),
        ),
      ],
      child: MyApp(),
    ),
  );*/
}

class TodoApp extends StatelessWidget {
  final TodoController controller;
  TodoApp({this.controller});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: TodoPage(
        controller: controller,
      ),
    );
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.light(),
      debugShowCheckedModeBanner: true,
      home: HomePage(),
    );
  }
}
