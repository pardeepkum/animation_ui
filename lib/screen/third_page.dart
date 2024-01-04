import 'package:flutter/material.dart';

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
        title: const Text('Animated Container'),
      ),
      body: Stack(
        children: [
          AnimatedCard(isContainerUp: isContainerUp),
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
    );
  }
}

class AnimatedContainerWidget extends StatelessWidget {
  final bool isContainerUp;
  final VoidCallback onTap;

  AnimatedContainerWidget({required this.isContainerUp, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: Duration(seconds: 1),
        curve: Curves.easeInOut,
        height: isContainerUp ? 100 : 300,
        width: double.infinity,
        color: Colors.blue,
        child: Center(
          child: Text(
            isContainerUp ? 'Tap to Move Down' : 'Tap to Move Up',
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }
}

class AnimatedCard extends StatelessWidget {
  final bool isContainerUp;

  AnimatedCard({required this.isContainerUp});

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: CurvedAnimation(
        parent: AlwaysStoppedAnimation<double>(isContainerUp ? 1.0 : 0.0),
        curve: Curves.easeInOut,
      ),
      builder: (context, child) {
        final double value = isContainerUp ? 1.0 : 0.0;
        final double offset = 300 * (1 - value);
        return Positioned(
          top: offset,
          left: 16,
          right: 16,
          child: GestureDetector(
            onTap: () {},
            child: Card(
              elevation: 4.0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16.0),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text('Card Content'),
              ),
            ),
          ),
        );
      },
    );
  }
}