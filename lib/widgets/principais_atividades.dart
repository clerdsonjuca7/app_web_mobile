import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:time_app/pages/ponto_em_atraso.dart';

class PrincipaisAtividades extends StatefulWidget {
  const PrincipaisAtividades({super.key});

  @override
  State<PrincipaisAtividades> createState() => _PrincipaisAtividadesState();
}

class _PrincipaisAtividadesState extends State<PrincipaisAtividades> {
  List<dynamic> icons = [
 SvgPicture.asset(
              'images/time-svgrepo-com.svg',
              width: 24,
              height: 24,
              colorFilter: const ColorFilter.mode(
                Colors.grey,
                BlendMode.srcIn,
              ),
              semanticsLabel: 'Red dash paths',
            ),

  ];
  List<String> text = [
     'Ponto\nAtraso', // quebra de linha automática
           
  ];
  
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 200,
      height: 120, // altura total do widget
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 1,
        padding: const EdgeInsets.symmetric(horizontal: 8),
        itemBuilder: (context, index) {
          return _buildCircularIcon(
            text[index], // quebra de linha automática
            icons[index]
          );
        },
      ),
    );
  }

  Widget _buildCircularIcon(String title, Widget icon) {
    return GestureDetector(
      onTap: (){
        
 if (title == 'Ponto\nAtraso') {
  Navigator.of(context).push(
    CupertinoPageRoute(
      builder: (context) => const PontoEmAtraso(),
    ),
  );
}

      },
      child: Container(
        width: 80, // largura do item
        margin: const EdgeInsets.symmetric(horizontal: 8),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 60,
              height: 60,
              decoration: BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.3),
                    blurRadius: 4,
                    offset: Offset(0, 2),
                  ),
                ],
              ),
              child: Center(child: icon),
            ),
            const SizedBox(height: 8),
            Text(
              title,
              textAlign: TextAlign.center,
              style: const TextStyle(color: Colors.grey, fontSize: 12),
            ),
          ],
        ),
      ),
    );
  }
}
