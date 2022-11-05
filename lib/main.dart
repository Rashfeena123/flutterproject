import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:newproject/screens/bottonnavbar.dart';
import 'package:newproject/screens/carouselloading.dart';
import 'package:newproject/screens/homepage.dart';
import 'package:newproject/screens/offerpage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home:   BottomNavBar(),
    );
  }
}

