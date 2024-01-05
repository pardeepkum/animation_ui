

import 'package:animated/screen/details_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller/home_controller.dart';

class HomePage extends StatelessWidget {
   HomePage({super.key});
   final  homeController = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.greenAccent,
          title: const Text('Loading Animation widget'),
        ),
        body: Padding(
          padding:  EdgeInsets.symmetric(horizontal: MediaQuery.of(context).devicePixelRatio*8),
          child: ListView.builder(
           itemCount:homeController.animationItems.length,
           itemBuilder: (context, index) {
           return ListTile(
             contentPadding: EdgeInsets.zero,
             title: Row(
               children: [
                 SizedBox(
                   width: MediaQuery.of(context).devicePixelRatio*18,
                  // height: MediaQuery.of(context).devicePixelRatio.,
                   child:homeController.animationItems[index],
                 ),
                 Expanded(
                   child: Padding(
                     padding: const EdgeInsets.symmetric(horizontal: 16.0),
                     child: Text(
                       'Loading Animation ${index + 1}',
                       textScaleFactor: 1.3,
                       style: const TextStyle(
                         fontSize: 11
                       ),
                       textAlign: TextAlign.left,
                     ),
                   ),
                 ),
               ]
             ),
           );
       }),
        ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.to(() => PageList(), transition: Transition.fade);
        },
        child: const Icon(Icons.arrow_forward),
      ),

    );
  }
}
