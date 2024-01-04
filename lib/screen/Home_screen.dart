// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
//
// import '../controller/home_controller.dart';
//
// class HomePage extends StatelessWidget {
//   final HomeController homeController = Get.put(HomeController());
//
//   final List<String> items = ["Item 1", "Item 2", "Item 3", "Item 4"];
//
//    HomePage({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         centerTitle: true,
//         title: const Text('Animated Transition '),
//       ),
//       body: ListView.builder(
//         itemCount: items.length,
//         itemBuilder: (context, index) {
//           return GestureDetector(
//             onTap: () {
//               homeController.changePage(index);
//             },
//             child:Obx(
//                   () => AnimatedOpacity(
//                 opacity: homeController.currentPageIndex.value == index ? 1.0 : 0.5,
//                 duration: const Duration(milliseconds: 300),
//                 child: Container(
//                   padding: const EdgeInsets.all(16.0),
//                   color: homeController.currentPageIndex.value == index
//                       ? Colors.blue
//                       : Colors.transparent,
//                   child: Text(
//                     items[index],
//                     style: TextStyle(
//                       color: homeController.currentPageIndex.value == index
//                           ? Colors.white
//                           : Colors.black,
//                     ),
//                   ),
//                 ),
//               ),
//             ),
//           );
//         },
//       ),
//     );
//   }
// }

import 'package:animated/screen%20/details_screen.dart';
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
          padding:  EdgeInsets.symmetric(horizontal: MediaQuery.of(context).devicePixelRatio*5),
          child: ListView.builder(
           itemCount:homeController.animationItems.length,
           itemBuilder: (context, index) {
           return ListTile(
             contentPadding: EdgeInsets.zero,
             title: Row(
               children: [
                 SizedBox(
                   width: MediaQuery.of(context).devicePixelRatio*12,
                  // height: MediaQuery.of(context).devicePixelRatio.,
                   child:homeController.animationItems[index],
                 ),
                 Expanded(
                   child: Padding(
                     padding: const EdgeInsets.symmetric(horizontal: 16.0),
                     child: Text(
                       'Loading Animation ${index + 1}',
                       textScaleFactor: 1.3,
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
