import 'package:aminationworld/animatedContainer.dart';
import 'package:aminationworld/listAnimation.dart';
import 'package:aminationworld/login_animation.dart';
import 'package:aminationworld/splash_animation.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: SplashAnimations());
  }
}
