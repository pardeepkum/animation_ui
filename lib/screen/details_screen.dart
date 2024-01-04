import 'package:animated/screen%20/page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'third_page.dart';

class PageList extends StatelessWidget {
   PageList({super.key});

  final List<String> items = ['Item 1', 'Item 2', 'Item 3', 'Item 4'];

  final GlobalKey<AnimatedListState> _listKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Page List')),
      body: AnimatedList(
        key: _listKey,
        initialItemCount: items.length,
        itemBuilder: (context, index, animation) {
          return buildItem(items[index], animation);
        },
      ),
      floatingActionButton: Row(
        children: [
          Expanded(
            child: GestureDetector(
              onTap: (){
                Get.toNamed( HomePageScreen().toString() );
              },
              child: Container(
                height: 100,
                width: 200,
                padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
                color: Colors.greenAccent,
                child: Text("Next page"),
              ),
            ),
          ),
          SizedBox(width: 100,),
          FloatingActionButton(
            onPressed: () {
              _addItem('New Item');
            },
            child: const Icon(Icons.add),
          ),
        ],
      ),
    );
  }

  Widget buildItem(String itemName, Animation<double> animation) {
    return SlideTransition(
      position: Tween<Offset>(begin: Offset(1, 0), end: Offset(0, 0)).animate(animation),
      child: ListTile(
        title: Hero(
          tag: itemName,
          child: Text(itemName),
        ),
        onTap: () {
          //Navigator.of(context).push(_createRoute(itemName));
          Get.toNamed(itemName);
        },
        onLongPress: () {
          _removeItem(itemName);
        },
      ),
    );
  }

  Route _createRoute(String itemName) {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => Page2(itemName: itemName),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        const begin = Offset(0.0, 1.0);
        const end = Offset.zero;
        const curve = Curves.ease;

        var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

        return SlideTransition(
          position: animation.drive(tween),
          child: child,
        );
      },
    );
  }

  void _addItem(String newItem) {
    items.insert(0, newItem);
    _listKey.currentState?.insertItem(0);
  }

  void _removeItem(String itemName) {
    final index = items.indexOf(itemName);
    if (index != -1) {
      _listKey.currentState?.removeItem(
        index,
            (context, animation) => buildItem(items[index], animation),
        duration: Duration(milliseconds: 500),
      );

      items.removeAt(index);
    }
  }
}


