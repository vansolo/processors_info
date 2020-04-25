import 'package:flutter/material.dart';
import 'package:processors_info/screens/processors_details_screen.dart';
import 'package:processors_info/screens/processors_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Processors List',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => ProcessorsScreen(),
        '/processors_details': (context) => ProcessorsDetailScreen(),
      },
    );
  }
}
