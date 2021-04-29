import 'package:flutter/material.dart';
import 'package:get/get.dart';

import "home.dart";

void main() {
  //Entry of app
  runApp(GetMaterialApp(
    title: 'Memory Game',
    home: HomeScreen(),
  ));
}
