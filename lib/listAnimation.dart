import 'package:flutter/material.dart';

class ListAnimation extends StatefulWidget {
  const ListAnimation({super.key});

  @override
  State<ListAnimation> createState() => _ListAnimationState();
}

class _ListAnimationState extends State<ListAnimation>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late List<Animation<Offset>> animations = [];
  final int itemCount = 5;

  @override
  void initState() {
    controller = AnimationController(
        vsync: this, duration: Duration(milliseconds: 10000));

    animations = List.generate(
        itemCount,
        (index) => Tween<Offset>(begin: Offset(-1, 0), end: Offset.zero)
            .animate(CurvedAnimation(
                parent: controller,
                curve: Interval(index * (1 / itemCount), 1))));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
                itemCount: itemCount,
                itemBuilder: (context, index) {
                  return SlideTransition(
                      position: animations[index],
                      child: ListTile(title: Text("Hello world +$index")));
                }),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(onPressed: () {
        controller.forward();
      }),
    );
  }
}
