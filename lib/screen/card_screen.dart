import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FlipCardWidget extends StatelessWidget {
  final RxBool isCardFlipped = false.obs;

  FlipCardWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.greenAccent,
        title: const Text("Card is Animated"),
      ),
      body: Column(
        children: [
          GestureDetector(
            onTap: () {
              isCardFlipped.toggle();
            },
            child: Obx(() {
              return AnimatedSwitcher(
                duration: const Duration(milliseconds: 500),
                child: isCardFlipped.value ? const BackCard() : const FrontCard(),
              );
            }),
          ),
          const SizedBox(height: 30,),
           const Text("Creativity the Custom animation",
          style: TextStyle(
            fontSize: 17
          ),
          ),
          const SizedBox(height: 50,),
          GestureDetector(
            onTap: (){
              Get.toNamed('/HomePage');
            },
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
             decoration: BoxDecoration(
               color: Colors.blueAccent,
               borderRadius: BorderRadius.circular(12)
             ),

              child: const Text("Logout the Page",style: TextStyle(
                color: Colors.white,
                fontSize: 20
              ),),
            ),
          )
        ],
      ),
    );
  }
}

class FrontCard extends StatelessWidget {
  const FrontCard({super.key});

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      height: 200,
      child: Card(
        elevation: 4,
        color: Colors.greenAccent,
        child: Center(
          child: Text(
            'Front Card',
            style: TextStyle(fontSize: 18),
          ),
        ),
      ),
    );
  }
}

class BackCard extends StatelessWidget {
  const BackCard({super.key});

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      height: 200,
      child: RotatedBox(
        quarterTurns: 2,
        child: Card(
          elevation: 4,
          color: Colors.redAccent,
          child: Center(
            child: Text(
              'Back Card',
              style: TextStyle(fontSize: 18),
            ),
          ),
        ),
      ),
    );
  }
}




