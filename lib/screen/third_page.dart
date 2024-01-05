import 'package:flutter/material.dart';
import 'package:get/get.dart';


class HomePageScreen extends StatefulWidget {
  const HomePageScreen({super.key});


  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePageScreen> {
  bool isContainerUp = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.greenAccent,
        title: const Text('Animated Container'),
      ),
      body: Padding(
        padding:  EdgeInsets.symmetric(horizontal: MediaQuery.of(context).devicePixelRatio*10,vertical: MediaQuery.of(context).devicePixelRatio*7),
        child: Column(
          children: [
            Stack(
              children: [
              //  AnimatedCard(isContainerUp: isContainerUp),
                AnimatedContainerWidget(
                  isContainerUp: isContainerUp,
                  onTap: () {
                    setState(() {
                      isContainerUp = !isContainerUp;
                    });
                  },
                ),

              ],
            ),
            const SizedBox(height: 20,),
            GestureDetector(
              onTap: (){
                Get.toNamed('/FlipCardWidget');
              },
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 25,vertical: 15),
                decoration: BoxDecoration(
                  color: Colors.greenAccent,
                  borderRadius: BorderRadius.circular(12)
                ),
                child: const Text(" Card Route"),
              )
            )
          ],
        ),
      ),
    );
  }
}





class AnimatedContainerWidget extends StatelessWidget {
  final bool isContainerUp;
  final VoidCallback onTap;

  const AnimatedContainerWidget({super.key, required this.isContainerUp, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(seconds: 1),
        curve: Curves.easeInOut,
        height: isContainerUp ? 100 : 300,
        width: double.infinity,
        color: Colors.blue,
        child: Center(
          child: Text(
            isContainerUp ? 'Tap to Move Down' : 'Tap to Move Up',
            style: const TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }
}

