import 'package:flutter/material.dart';

class Page2 extends StatelessWidget {
  final String itemName;

  const Page2({required this.itemName, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Hero(
          tag: itemName,
          child: Text(itemName),
        ),
      ),
    );
  }
}