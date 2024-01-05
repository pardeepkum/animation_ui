import 'package:animated/screen/page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
          return Padding(
            padding: const EdgeInsets.all(4.0),
            child: Card(
                elevation: 4,
                child: buildItem(items[index], animation)),
          );
        },
      ),
      floatingActionButton: Row(
        children: [
          Expanded(
            child: GestureDetector(
              onTap: (){
                Get.toNamed('/HomePageScreen');
              },
              child: Container(
                width: 200,
                padding: const EdgeInsets.symmetric(horizontal: 40,vertical: 20),
                margin: const EdgeInsets.only(left: 30),
                decoration: BoxDecoration(
                color: Colors.greenAccent,
                borderRadius: BorderRadius.circular(12)
              ),
                child: const Text("Next page"),
              ),
            ),
          ),
          const SizedBox(width: 100,),
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
      position: Tween<Offset>(begin: const Offset(1, 0), end: const Offset(0, 0)).animate(animation),
      child: ListTile(
        title: Hero(
          tag: 'item_$itemName',
          child: Text(itemName),
        ),
        onTap: () {
          Get.toNamed(itemName);
        },
        onLongPress: () {
          _removeItem(itemName);
        },
      ),
    );
  }

  Route createRoute(String itemName) {
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
       final removedItem = items[index];
       _listKey.currentState?.removeItem(
         index,
             (context, animation) => buildItem(removedItem, animation),
         duration: const Duration(milliseconds: 500),
       );
       items.removeAt(index);
     }
   }

}


