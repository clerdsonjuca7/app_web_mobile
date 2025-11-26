import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:time_app/main.dart';
import 'package:time_app/pages/register.dart';
import 'package:time_app/widgets/button_app.dart';

class MyWidget extends StatefulWidget {
  const MyWidget({super.key});

  @override
  State<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  final ScrollController _controller = ScrollController();
  final FocusNode _focusNode = FocusNode();

  void _handleKeyEvent(RawKeyEvent event) {
    var offset = _controller.offset;
    if (event.logicalKey == LogicalKeyboardKey.arrowUp) {
      setState(() {
        if (kReleaseMode) {
          _controller.animateTo(
            offset - 200,
            duration: Duration(milliseconds: 30),
            curve: Curves.ease,
          );
        } else {
          _controller.animateTo(
            offset - 200,
            duration: Duration(milliseconds: 30),
            curve: Curves.ease,
          );
        }
      });
    } else if (event.logicalKey == LogicalKeyboardKey.arrowDown) {
      setState(() {
        if (kReleaseMode) {
          _controller.animateTo(
            offset + 200,
            duration: Duration(milliseconds: 30),
            curve: Curves.ease,
          );
        } else {
          _controller.animateTo(
            offset + 200,
            duration: Duration(milliseconds: 30),
            curve: Curves.ease,
          );
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return  Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [Color.fromARGB(255, 248, 201, 130), Colors.white],
              ),
            ),

            child: Scaffold(
      /*  appBar: AppBar(
          backgroundColor: Colors.white,
          title:  Row(
            children: [
              Text(
                'Time App',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.deepOrange,
                  fontFamily: 'Schyler',
                ),
              ),
              Spacer(),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Text('produtos', style: TextStyle(fontSize: 15)),
                    Icon(Icons.arrow_drop_down),
                  ],
                ),
              ),
              
              Container(
                height: 30,
                width: 60,
                decoration: BoxDecoration(
                  color: Colors.orange,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Center(
                  child: Text(
                    'Login',
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ],
          ),
        ),
       */ backgroundColor: Colors.transparent,
        body: SingleChildScrollView(
          child: Column(
           // primary: true,
          
            children: [
              Padding(
                  padding: const EdgeInsets.only(top: 70.0),
                
                  child: Column(
                    children: [
                         Column(
                            children: [
                              const Text(
                                'Time App',
                                style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.deepOrange,
                                  fontFamily: 'Schyler',
                                ),
                              ),
                
                              const SizedBox(height: 20),
                
                              const Text(
                                'A Table With 5 Other People \n Was Found',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                
                              const SizedBox(height: 30),
                
                              SvgPicture.asset(
                                'images/undraw_unlock_m0yr.svg',
                                width: 300,
                                height: 300,
                              ),
                            ],
                          ),
                        
                
                      const SizedBox(height: 40),
                
                      // --- Buttons ---
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          GestureDetector(
                            onTap: () {
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const Example(),
                                ),
                              );
                            },
                            child: Container(
                              width: 150,
                              height: 50,
                              decoration: BoxDecoration(
                                color: Colors.deepOrange,
                                borderRadius: BorderRadius.circular(40),
                              ),
                              child: const Center(
                                child: Text(
                                  'Login',
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                            ),
                          ),
                
                          const SizedBox(width: 20),
                
                          Container(
                            width: 150,
                            height: 50,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(40),
                            ),
                            child: const Center(child: Text('Cadastro')),
                          ),
                        ],
                      ),
                
                      const SizedBox(height: 20),
                
                      // --- Divider com "Or" ---
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          SizedBox(width: 50, child: Divider(color: Colors.grey)),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 8.0),
                            child: Text('Or'),
                          ),
                          SizedBox(width: 50, child: Divider(color: Colors.grey)),
                        ],
                      ),
                    ],
                  ),
                ),
              /*
              Container(
                padding: EdgeInsets.all(20),
                width: double.infinity,
                height: 500,
                color: Colors.black,
                child: Column(
                  children: [
                    Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Time App',
                              style: TextStyle(
                                fontSize: 20,
                                color: Colors.deepOrange,
                                fontFamily: 'Schyler',
                              ),
                            ),
                            SizedBox(height: 50,),
                          Row(children: [
                
                            Container(
                              width: 60,
                              height: 60,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(50),
                                color: Colors.white,
                              ),
                              child: Icon(Icons.facebook),
                            ),
                            SizedBox(width: 15,), 
                            Container(
                              width: 60,
                              height: 60,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(50),
                                color: Colors.white,
                              ),
                              child: Icon(Icons.phone),
                            ),],),
                            Text('Nexacore', style: TextStyle(color: Colors.white)),
                            Text('XSEG', style: TextStyle(color: Colors.white)),
                            Text('(86) 9230-6607', style: TextStyle(color: Colors.white)),
                            Text('joaodasneves@gmail.com', style: TextStyle(color: Colors.white)),
                            Row(
                              children: [
                                Container(
                                  width: 100,
                                  height: 40,
                                  color: Colors.white, child: TextField()),
                              Icon(Icons.email,color: Colors.deepOrange,size: 60,)
                              ],
                            )
                            
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            */],
          ),
        ),
      ),
    );
  }
}
