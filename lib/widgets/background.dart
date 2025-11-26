import 'package:flutter/material.dart';

class Background extends StatefulWidget {
  final Widget child;
  const Background({super.key, required  this.child});

  @override
  State<Background> createState() => _BackgroundState();
}

class _BackgroundState extends State<Background> {
  @override
  Widget build(BuildContext context) {
    return Container(
      
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [const Color.fromARGB(255, 248, 201, 130), Colors.white],
          // Optional: defines color distribution
        ),
        
      ),child: widget.child, );
      
  }
}