import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class HomeController extends GetxController {
  var currentPageIndex = 0.obs;
  // for the card flip back and start to the widget 
  var isCardFlipped = false.obs;

  void flipCard() {
    isCardFlipped.value = !isCardFlipped.value;
  }

  final List<Widget> animationItems = [
    LoadingAnimationWidget.twistingDots(
      leftDotColor: const Color(0xFF1A1A3F),
      rightDotColor: const Color.fromARGB(255, 12, 110, 42),
      size: 50,
    ),
    LoadingAnimationWidget.staggeredDotsWave(
      color: const Color.fromARGB(255, 26, 153, 68),
      size: 30,
    ),
    LoadingAnimationWidget.inkDrop(
      color: const Color.fromARGB(255, 26, 153, 68),
      size: 30,
    ),
    LoadingAnimationWidget.bouncingBall(
      color: const Color.fromARGB(255, 26, 153, 68),
      size: 30,
    ),
    LoadingAnimationWidget.flickr(
      leftDotColor: const Color(0xFF1A1A3F),
      rightDotColor: const Color.fromARGB(255, 12, 110, 42),
      size: 50,
    ),
    LoadingAnimationWidget.fourRotatingDots(
      color: const Color.fromARGB(255, 12, 110, 42),
      size: 30,
    ),
    LoadingAnimationWidget.newtonCradle(
      color: const Color.fromARGB(255, 12, 110, 42),
      size: 30,
    ),
  ];


  void changePage(int index) {
    currentPageIndex.value = index;
  }
}
