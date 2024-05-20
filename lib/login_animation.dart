import 'package:flutter/material.dart';

class LoginAnimation extends StatefulWidget {
  const LoginAnimation({super.key});

  @override
  State<LoginAnimation> createState() => _LoginAnimationState();
}

class _LoginAnimationState extends State<LoginAnimation>
    with SingleTickerProviderStateMixin {
  late Animation<double> logoOpacity;
  late Animation<Offset> slideAnimation;
  late Animation<double> slideScaleAnimation;

  late AnimationController controller;

  @override
  void initState() {
    controller = AnimationController(
        vsync: this, duration: Duration(milliseconds: 1500));
    slideAnimation = Tween<Offset>(begin: Offset(-1, -1), end: Offset.zero)
        .animate(CurvedAnimation(parent: controller, curve: Curves.ease));
    slideScaleAnimation = Tween<double>(begin: 0, end: 1).animate(controller);
    logoOpacity = Tween<double>(begin: 0, end: 1)
        .animate(CurvedAnimation(parent: controller, curve: Curves.ease));
    super.initState();
    controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Login"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          FadeTransition(
            opacity: logoOpacity,
            child: Center(
              child: FlutterLogo(
                size: 100,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: SlideTransition(
              position: slideAnimation,
              child: ScaleTransition(
                scale: slideScaleAnimation,
                child: Column(
                  children: [
                    TextFormField(
                      decoration: InputDecoration(
                        label: Text("Username"),
                      ),
                    ),
                    SizedBox(height: 20),
                    TextFormField(
                      decoration: InputDecoration(label: Text("Password")),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    TextButton(onPressed: () {}, child: Text("login"))
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
