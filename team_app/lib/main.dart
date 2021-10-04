import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:whatHome/page/home_page.dart';
import 'package:whatHome/provider/feedback_position_provider.dart';
import 'package:whatHome/model/first_form_model.dart';
import 'package:whatHome/provider/bookmark_model.dart';

const Color darkBlue = Color.fromARGB(255, 18, 32, 47);

void main() {
  runApp(
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
  );
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
