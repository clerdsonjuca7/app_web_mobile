import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:time_app/Theme.dart';
import 'package:time_app/widgets/app_bar.dart';
import 'package:time_app/widgets/background.dart';
import 'package:time_app/widgets/principais_atividades.dart';

class Ponto extends StatefulWidget {
  const Ponto({super.key});

  @override
  State<Ponto> createState() => _PontoState();
}

class _PontoState extends State<Ponto> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(),
      backgroundColor: Colors.grey[100],
      body: Padding(
        padding: const EdgeInsets.only(top: 38.0,),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.only(right: 20,left: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                Text(
                'Menu ponto',
                  style: TextStyle(
                  color: Colors.orange,
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Container(width: 100, height: 2, color: Colors.orange),
              SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Último ponto',
                        style: TextStyle(color: grey, fontSize: 16),
                      ),
                      Text(
                        '08:01',
                        style: TextStyle(
                      color: Colors.orange,
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Horas trabalhadas hoje',
                        style: TextStyle(color: grey, fontSize: 16),
                      ),
                      Text(
                        '00:51',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 10),
              PrincipaisAtividades(),
              Row(
                children: [
                  SvgPicture.asset(
                    'images/time-svgrepo-com.svg',
                    colorFilter: const ColorFilter.mode(
                      Colors.grey,
                      BlendMode.srcIn,
                    ),
                    semanticsLabel: 'Red dash paths',
                  ),
                  SizedBox(width: 10),
                  Text(
                    'Historico de Pontos',
                    style: TextStyle(fontSize: 18,
                     fontWeight: FontWeight.bold,
                     color: Colors.grey
                     ),
                  ),
                ],
              ),
              ],),
            ),SizedBox(height: 20,),
            Expanded(
              child: ListView.builder(
                itemCount: 5,
                itemBuilder: (context, index) {
                  return Container(
                    margin: EdgeInsets.all(1),
                    padding: EdgeInsets.all(30),
                    color: Colors.white,
                    child: Column(
                      children: [
                      
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                 children: [
                                  Row(children: [

                                  
                           Icon(Icons.calendar_month,color:Colors.grey),
                                    Text(
                                      '24/11/2025',
                                      style: TextStyle(
                                        
                                        color: Colors.blueGrey,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),],),
                                    Row(children: [
Icon(Icons.hourglass_bottom,color: Colors.grey,),
  Text('00:00hs',style: TextStyle(fontWeight: FontWeight.bold,color: Colors.grey),),
                                    ],)
                          
                                  ],
                                ),
                                Container(
                                  width: double.infinity,
                                  height: 2,
                                color: Colors.grey,),
                                SizedBox(height: 20),
                               Container(
  padding: const EdgeInsets.all(1),
  decoration: BoxDecoration(
    color: Colors.orange,
    borderRadius: BorderRadius.circular(10),
  ),
  child: Container(
    padding: const EdgeInsets.all(15),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(10),
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Primeiro turno',
          style: TextStyle(
            color: Colors.grey,
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
        const SizedBox(height: 6),
        Row(
          children: const [
            Text(
              '08:01 >',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.grey,
              ),
            ),
            SizedBox(width: 4),
            Text(
              'Em Aberto',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.orange,
              ),
            ),
          ],
        ),
      ],
    ),
  ),
)],
                            ),
                          ],
                        ),
                      
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
