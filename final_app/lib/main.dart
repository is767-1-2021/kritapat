import 'package:final_app/provider/calculator_provider.dart';
import 'package:final_app/screens/calculator.dart';
import 'package:final_app/screens/history.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:final_app/imports.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<CalculatorProvider>(
      create: (_) => CalculatorProvider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          scaffoldBackgroundColor: backgroundColor,
          brightness: Brightness.dark,
          accentColor: yellowColor,
          appBarTheme: AppBarTheme(
            color: backgroundColor,
            elevation: 0.0,
          ),
          textTheme: TextTheme(
            headline3: TextStyle(
              fontWeight: FontWeight.bold,
            ),
            caption: TextStyle(
              fontWeight: FontWeight.w500,
              color: Colors.grey[300],
              fontSize: 18.0,
            ),
          ),
        ),
        routes: {
          '/': (context) => Calculator(),
          '/history': (context) => HistoryView(),
        },
      ),
    );
  }
}
