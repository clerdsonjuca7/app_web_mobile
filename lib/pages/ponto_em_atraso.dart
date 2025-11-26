import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

const List<String> list = <String>['Esquecimento', 'Sistema Indisponível'];

class PontoEmAtraso extends StatefulWidget {
  const PontoEmAtraso({super.key});

  @override
  State<PontoEmAtraso> createState() => _PontoEmAtrasoState();
}

class _PontoEmAtrasoState extends State<PontoEmAtraso> {
  String dropdownValue = list.first;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Registro em Atraso")),
      backgroundColor: Colors.grey[100],
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.orange,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                children: [
                  SvgPicture.asset(
              'images/info-svgrepo-com.svg',
              width: 24,
              height: 24,
              colorFilter: const ColorFilter.mode(
                Colors.grey,
                BlendMode.srcIn,
              ),
              semanticsLabel: 'Red dash paths',
            ),
              
                  const Text(
                    'Este registro ficará pendente de aprovação',
                    style: TextStyle(color: Colors.white),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),

            Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Data *'),
                      SizedBox(height: 6),
                      Container(
                        color: Colors.white,
                        child: TextField(
                          decoration: InputDecoration(
                            prefixIcon: Icon(
                              Icons.calendar_month,
                              color: Colors.grey,
                            ),
                            border: InputBorder.none,
                            hintText: "Selecione a data",
                            hintStyle: TextStyle(color: Colors.grey),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Hora *'),
                      SizedBox(height: 6),
                      Container(
                        color: Colors.white,
                        child: TextField(
                          decoration: InputDecoration(
                            prefixIcon: Icon(
                              Icons.hourglass_bottom,
                              color: Colors.grey,
                            ),
                            border: InputBorder.none,
                            hintText: "Selecione a hora",
                            hintStyle: TextStyle(color: Colors.grey),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),

            const SizedBox(height: 20),

            const Text("Justificativa *"),
            const SizedBox(height: 6),
            _drowdownWidget(list),

            const SizedBox(height: 20),

            const Text("Observação (opcional)"),
            const SizedBox(height: 6),
            Container(
              color: Colors.white,
              child: TextField(
                maxLines: 7,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: "Adicione observações...",
                  hintStyle: TextStyle(color: Colors.grey),
                ),
              ),
            ),

            const SizedBox(height: 30),

            Container(
              width: double.infinity,
              height: 40,
              decoration: BoxDecoration(
                color: Colors.white
              ),
              child: Center(child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Enviar",style: TextStyle(color: Colors.orange),),
                  SizedBox(width: 50,),
                  Icon(Icons.arrow_forward_ios,color: Colors.orange,)
                ],
              )),
            ),
          ],
        ),
      ),
    );
  }

  Widget _drowdownWidget(List<String> list) {
    String dropdownValue = list.first;

    return Container(
      padding: EdgeInsets.all(3),
      color: Colors.white,
      child: DropdownButton<String>(
        isExpanded: true,
        value: dropdownValue,
        icon: const Icon(Icons.arrow_downward),
        elevation: 16,
        style: const TextStyle(color: Colors.grey),
        underline: Container(height: 2, color: Colors.white),
        onChanged: (String? value) {
          // This is called when the user selects an item.
          setState(() {
            dropdownValue = value!;
          });
        },
        items: list.map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(value: value, child: Text(value));
        }).toList(),
      ),
    );
  }
}
