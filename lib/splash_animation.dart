import 'dart:async';

import 'package:flutter/material.dart';

class SplashAnimations extends StatefulWidget {
  const SplashAnimations({super.key});

  @override
  State<SplashAnimations> createState() => _SplashAnimationsState();
}

class _SplashAnimationsState extends State<SplashAnimations>
    with SingleTickerProviderStateMixin {
  late Animation<double> scaleAnimation;
  late AnimationController controller;

  @override
  void initState() {
    controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 1000));
    controller.addListener(
      () {
        if (controller.isCompleted) {
          Navigator.of(context).push(PageRouteBuilder(
              pageBuilder: (context, animation, secondaryAnimation) {
            return const Destination();
          }, transitionsBuilder:
                  (context, animation, secondaryAnimation, child) {
            final tween = Tween(begin: const Offset(0, -1), end: Offset.zero)
                .animate(CurvedAnimation(
                    parent: animation, curve: Curves.easeInOut));
            return SlideTransition(
              position: tween,
              child: child,
            );
          }));
          Timer(const Duration(milliseconds: 500), () {
            controller.reset();
          });
        }
      },
    );
    scaleAnimation = Tween<double>(begin: 1, end: 50).animate(controller);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: GestureDetector(
        onTap: () {
          controller.forward();
        },
        child: ScaleTransition(
          scale: scaleAnimation,
          child: Container(
            height: 100,
            width: 100,
            decoration:
                const BoxDecoration(color: Colors.blue, shape: BoxShape.circle),
          ),
        ),
      )),
    );
  }
}

class Destination extends StatefulWidget {
  const Destination({super.key});

  @override
  State<Destination> createState() => _DestinationState();
}

class _DestinationState extends State<Destination> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Destination"),
      ),
    );
  }
}
