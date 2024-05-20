import 'package:flutter/material.dart';

class CartAnimation extends StatefulWidget {
  const CartAnimation({super.key});

  @override
  State<CartAnimation> createState() => _CartAnimationState();
}

class _CartAnimationState extends State<CartAnimation> {
  bool isExpanded = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Cart"),
      ),
      body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Center(
            //   child: TweenAnimationBuilder(
            //       tween: Tween<double>(begin: 0, end: 200),
            //       duration: Duration(milliseconds: 1000),
            //       builder: (context, size, child) => Container(
            //           height: size,
            //           width: size,
            //           decoration: BoxDecoration(
            //               shape: BoxShape.circle,
            //               color: Colors.blue,
            //               boxShadow: [
            //                 BoxShadow(
            //                     color: Colors.blue.withOpacity(0.5),
            //                     spreadRadius: size,
            //                     blurRadius: size),
            //               ]))),
            // )

            GestureDetector(
              onTap: () {
                print("tap");
                isExpanded = !isExpanded;
                setState(() {});
              },
              child: Center(
                child: AnimatedContainer(
                  height: 40,
                  width: isExpanded ? 150 : 70,
                  decoration: BoxDecoration(
                    borderRadius: isExpanded
                        ? BorderRadius.circular(50)
                        : BorderRadius.circular(15),
                    color: isExpanded ? Colors.green : Colors.blue,
                  ),
                  duration: Duration(milliseconds: 300),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Icon(isExpanded ? Icons.check : Icons.shopping_cart,
                          color: isExpanded ? Colors.black : Colors.white),
                      if (isExpanded) Text("Added to cart")
                    ],
                  ),
                ),
              ),
            )
          ]),
    );
  }
}
