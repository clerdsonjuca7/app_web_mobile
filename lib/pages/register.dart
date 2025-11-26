import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:time_app/pages/menu.dart';
import 'package:flutter_flip_card/flutter_flip_card.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<Register> {
  bool visibilityHours = false;
  double opacity = 1.0;
   ScrollController controller = ScrollController();
 
   final cong = GestureFlipCardController();
  @override
  void initState() {
    super.initState();

    controller.addListener(() {
      double value = controller.offset / 200; // altura para aparecer totalmente
      if (value < 0) value = 0;
      if (value > 1) value = 1;

      setState(() {
        opacity = value;
      });
    });
  }

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
      ),
      child: Scaffold(
      // Source - https://stackoverflow.com/a
// Posted by Fernando Lozada
// Retrieved 2025-11-19, License - CC BY-SA 4.0

  appBar: AppBar(
    title:      const Text(
                                'Time App',
                                style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.deepOrange,
                                  fontFamily: 'Schyler',
                                ),
                              ),
                
    actions: <Widget>[
      PopupMenuButton<int>(
          onSelected: (item) => handleClick(item),
          itemBuilder: (context) => [
            PopupMenuItem<int>(value: 0, child: Text('Logout')),
            PopupMenuItem<int>(value: 1, child: Text('Settings')),
          ],
        ),
    ],
  ),

       
        backgroundColor: Colors.transparent,
        body: ListView(
          controller: controller,
          primary: false,
          scrollDirection: Axis.vertical,
          children:[ Container(
            padding: EdgeInsets.all(30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    CircleAvatar(
                      backgroundImage: AssetImage('images/avatar.webp'),
                    ),
                    SizedBox(width: 10),
                    Text('Olá ,Clerdson'),
                  ],
                ),
                SizedBox(height: 10),
                Row(
                  children: [
                    SvgPicture.asset(
                      width: 25,
                      height: 25,
                      'images/trackbook-svgrepo-com.svg',
                      semanticsLabel: 'Dart Logo',
                    ),
                    SizedBox(width: 10),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Sua Localização :',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                    
                        Text(
                          'Avenida José... Cambeba ,Fortaleza CE',
                          style: TextStyle(color: Colors.grey),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    if(kIsWeb) Container()
                    else
                    Padding(
                      padding: const EdgeInsets.only(
                        top: 10,
                        bottom: 30.0,
                        left: 10,
                        right: 10,
                      ),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => Menu()),
                          );
                        },
                        child: Container(
                          width: 30,
                          height: 70,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Center(child: Icon(Icons.menu)),
                        ),
                      ),
                    ),
                    Expanded(
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                    
                          children: [
                            _buildCirclerIcons('fatura', Icon(Icons.car_crash)),
                            _buildCirclerIcons('Hora', Icon(Icons.abc)),
                            _buildCirclerIcons(
                              'Data',
                              Icon(Icons.ac_unit_sharp),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 30),
                Container(
                  width: MediaQuery.of(context).size.width*0.9,
                  padding: EdgeInsets.all(20),
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)
                  ,
                  color: const Color.fromARGB(255, 241, 226, 202),
                  ),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Text(
                            'Meu ponto :',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                          ),
                    
                          Spacer(),
                    
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                visibilityHours = !visibilityHours;
                              });
                            },
                            child: Icon(visibilityHours?
                              Icons.visibility_off:Icons.visibility,
                              color: Colors.grey,
                            ),
                          ),
                          Icon(Icons.lock_clock, color: Colors.deepOrange),
                        ],
                      ),
                    
                      SizedBox(height: 10),
                      Row(
                        children: [
                          Icon(Icons.lock_clock),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Último ponto :',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                ),
                              ),
                              Row(
                                children: [
                                  Text(
                                    'Registrado ás ',
                                    style: TextStyle(
                                      color: Colors.grey,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16,
                                    ),
                                  ),
                                  Text(
                                    '8:00:am',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          Spacer(),
                          Row(
                            children: [
                              Text('Detalhes'),
                              Icon(Icons.arrow_drop_down),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(height: 30),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                            width: 130,
                            height: 100,
                            decoration: BoxDecoration(
                              color: const Color.fromARGB(255, 245, 206, 148),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    if( visibilityHours) Text('18:00:am',style: TextStyle(fontWeight: FontWeight.bold)) else
                                    for (int i = 0; i < 4; i++)
                                      _buildDotVisibility(),
                                  ],
                                ),
                                Text(
                                  'Horas \n Trabalhadas',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Colors.grey,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                    
                          Container(
                            width: 130,
                            height: 100,
                            decoration: BoxDecoration(
                              color: const Color.fromARGB(255, 245, 206, 148),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                    if( visibilityHours) Text('8:00:am',style: TextStyle(fontWeight: FontWeight.bold)) else
                                    for (int i = 0; i < 4; i++)
                                      _buildDotVisibility(),
                                  ],
                                ),
                                Text(
                                  'Horas \n Trabalhadas',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Colors.grey,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 20),
                      Container(
                        width: 300,
                        height: 40,
                        decoration: BoxDecoration(
                          color: Colors.orange,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Center(
                          child: Text(
                            'Registrar Ponto',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(height: 50),
                Stack(children: [

                
                  AnimatedOpacity(opacity: opacity,
                  duration: Duration(seconds: 3),
                  child: Image.asset('images/avatar.webp'))
                ,
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'Time App :\n Conheça nosso \nAPP',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 17,
                    ),
                  ),
                ),],),
                SizedBox(height: 50),
                if(kIsWeb)
                
                Container(
                  width: 300,
                  height: 40,
                  decoration: BoxDecoration(
                    color: Colors.orange,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Center(
                    child: Text(
                      'Saber das Promoções',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                )
                else
                Container(
                  width: double.infinity,
                  height: 40,
                  decoration: BoxDecoration(
                    color: Colors.orange,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Center(
                    child: Text(
                      'Saber das Promoções',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                    
                SizedBox(height: 50),
              ],
            ),
          ),
        ]),
      ),
    );
  }

  Widget _buildDotVisibility() {
    return Padding(
      padding: const EdgeInsets.all(2.0),
      child: Container(
        width: 7,
        height: 7,
        decoration: BoxDecoration(
          color: Colors.deepOrange,
          borderRadius: BorderRadius.circular(50),
        ),
      ),
    );
  }

  

void handleClick(int item) {
  switch (item) {
    case 0:
      break;
    case 1:
      break;
  }
}


  Widget _buildCirclerIcons(String title, dynamic icon) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Container(
            width: 70,
            height: 70,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              color: Colors.white,
            ),

            child: icon,
          ),
          Text(title, style: TextStyle(color: Colors.grey)),
        ],
      ),
    );
  }
}
