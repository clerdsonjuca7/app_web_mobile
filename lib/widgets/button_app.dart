import 'package:flutter/material.dart';

class ButtonApp extends StatefulWidget {
  final String title;
  final Function onPressed;
  const ButtonApp({
    super.key,
    required this.onPressed,
    required this.title
    });

  @override
  State<ButtonApp> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<ButtonApp> {
  @override
  Widget build(BuildContext context) {
    return     GestureDetector(
      onTap:()=> widget.onPressed,
      child: Container(
                          width: double.infinity,
                          height: 40,
                          decoration: BoxDecoration(
                            color: Colors.orange,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Center(
                            child: Text(
                              widget.title,
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
    )
                  ;
  }
}