import 'package:flutter/material.dart';
import 'package:uptodo/hello_page/first_screen.dart';
import 'package:uptodo/hello_page/fourth_screen.dart';
import 'package:uptodo/hello_page/second_screen.dart';
import 'package:uptodo/hello_page/third_screen.dart';
import 'package:uptodo/login_page/login_screen.dart';
import 'package:uptodo/main_screen/main_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        scaffoldBackgroundColor: const Color.fromARGB(255, 20, 20, 20),
        appBarTheme: AppBarTheme(
          backgroundColor: const Color.fromARGB(255, 20, 20, 20),
        ),
      ),

      home: FirstScreenWidget(),

      routes: {
        '/first': (context) => FirstScreenWidget(),
        '/second': (context) => SecondScreenWidget(),
        '/third': (context) => ThirdSreenWidget(),
        '/fourth': (context) => FourthScreenWidget(),
        '/login': (context) => LoginScreenWidget(),
        '/main': (context) => MainScreenWidget(),
      },
    );
  }
}
