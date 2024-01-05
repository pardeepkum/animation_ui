import 'package:animated/screen/card_screen.dart';
import 'package:animated/screen/details_screen.dart';
import 'package:animated/screen/third_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'screen/Home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      getPages: [
        GetPage(
          name: '/HomePage',
          page: () => HomePage(),

        ),
        GetPage(
          name: '/PageList',
          page: () =>  PageList(),

        ),
        GetPage(
          name: '/HomePageScreen',
          page: () => const HomePageScreen(),
        ),
        GetPage(
          name: '/FlipCardWidget',
          page: () =>  FlipCardWidget(),
        ),

      ],
    home: HomePage(),
    );
  }
}


