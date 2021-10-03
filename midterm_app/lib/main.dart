import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:team_app/models/first_form_model.dart';
import 'package:team_app/pages/blank_page1.dart';
import 'package:team_app/pages/blank_page2.dart';
import 'package:team_app/pages/blank_page3.dart';
import 'package:team_app/pages/blank_page4.dart';
import 'package:team_app/pages/menu_page.dart';
import 'package:team_app/pages/result_page.dart';
import 'pages/filter_page.dart';
import 'pages/register_page.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => FirstFormModel(),
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
        title: 'Flutter Demo',
        theme: ThemeData(
          primaryColor: Colors.amber,
          accentColor: Colors.blue[200],
          textTheme: TextTheme(
            bodyText2: TextStyle(color: Colors.purple),
          ),
        ),
        initialRoute: '/7',
        routes: <String, WidgetBuilder>{
          '/1': (context) => MyHomePage(title: 'Filter Page'),
          '/2': (context) => RegisterPage(),
          '/3': (context) => BlankPage1(),
          '/4': (context) => BlankPage2(),
          '/5': (context) => BlankPage3(),
          '/6': (context) => BlankPage4(),
          '/7': (context) => MenuPage(),
          '/8': (context) => ResultPage(),
        });
  }
}
