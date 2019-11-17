import 'package:flutter/material.dart';
import 'package:stripe_demo/CreditCardWidget.dart';
import 'package:stripe_demo/pages/register.dart';
import 'package:stripe_demo/pages/login.dart';
import 'package:stripe_demo/pages/dashboard.dart';
import 'package:stripe_demo/pages/classify.dart';
import 'package:stripe_demo/pages/home.dart';
import 'package:stripe_demo/pages/dialog_flow.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Home(),
      initialRoute: '/home',
      routes: {
          '/register': (context) => Register(),
          '/login': (context) => Login(),
          '/dashboard': (context) => CreditCardWidget(),
          '/classify': (context) => Classify(),
          '/chat': (context) => ChatDialogFlow(),
        }
    );
  }
}

