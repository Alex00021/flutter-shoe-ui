import 'package:flutter/material.dart';
import 'package:flutter_shoes_app_ui/view/home_page.dart';

///@program: flutter_shoes_app_ui
///@description: 卖鞋UI
///@author: Alex.LingJiaHua
///@create: 2022


void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
        fontFamily: "Averta"
    ),
    home: const HomePage(),
  ));
}



