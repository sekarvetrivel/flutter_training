import 'package:flutter/material.dart';

import 'my_animated_widget.dart';
import 'product_box.dart';

class ProductHomePage extends StatelessWidget {
  ProductHomePage({Key? key, required this.title, required this.animation})
      : super(key: key);
  final String title;
  final Animation<double> animation;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("Product Listing")),
        body: ListView(
          shrinkWrap: true,
          padding: const EdgeInsets.fromLTRB(2.0, 10.0, 2.0, 10.0),
          children: <Widget>[
            FadeTransition(
                child: ProductBox(
                    name: "iPhone",
                    description: "iPhone is the stylist phone ever",
                    price: 1000,
                    image: "image_1.jpg"),
                opacity: animation),
            MyAnimatedWidget(
                child: ProductBox(
                    name: "Pixel",
                    description: "Pixel is the most featureful phone ever",
                    price: 800,
                    image: "image_2.jpg"),
                animation: animation),
            ProductBox(
                name: "Laptop",
                description: "Laptop is most productive development tool",
                price: 2000,
                image: "image_3.jpg"),
            ProductBox(
                name: "Tablet",
                description:
                    "Tablet is the most useful device ever for meeting",
                price: 1500,
                image: "image_4.jpg"),
            ProductBox(
                name: "Pendrive",
                description: "Pendrive is useful storage medium",
                price: 100,
                image: "image_5.jpg"),
            ProductBox(
                name: "Floppy Drive",
                description: "Floppy drive is useful rescue storage medium",
                price: 20,
                image: "image_1.jpg"),
          ],
        ));
  }
}
