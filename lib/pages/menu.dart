import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Menu extends StatelessWidget {
  const Menu({super.key});

  @override
  Widget build(BuildContext context) {
    return  Drawer(
        child: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Color(0xFFF8C982),
                Colors.white,
              ],
            ),
          ),

          // 🔥 Scroll funcionando no Web e Mobile
          child: SafeArea(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),

                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // ==== TÍTULO E FECHAR ====
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Personalizar início',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),
                        IconButton(
                          icon: const Icon(Icons.close, size: 26),
                          onPressed: () => Navigator.pop(context),
                        ),
                      ],
                    ),

                    const SizedBox(height: 20),

                    const Text(
                      'Exibindo',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),

                    const SizedBox(height: 15),

                    // ==== BLOCO 1 ====
                    _buildWhiteBox(
                      children: [
                        _sectionTitle("Histórico de pontos"),

                        _menuItem("Ajustar meu ponto", "images/duplicate-alt-svgrepo-com.svg"),
                        _menuItem("Solicitação de Ajuste", "images/duplicate-alt-svgrepo-com.svg"),
                        _menuItem("Ajustar meu ponto", "images/duplicate-alt-svgrepo-com.svg"),
                        _menuItem("Clube de vantagens", "images/duplicate-alt-svgrepo-com.svg"),
                        _menuItem("Férias", "images/duplicate-alt-svgrepo-com.svg"),
                      ],
                    ),

                    const SizedBox(height: 25),

                    const Text(
                      'Disponíveis',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 17,
                      ),
                    ),

                    const SizedBox(height: 15),

                    // ==== BLOCO 2 ====
                    _buildWhiteBox(
                      children: const [
                        Text(
                          'Grupo de Trabalho',
                          style: TextStyle(fontSize: 16),
                        ),
                        SizedBox(height: 10),
                        Text(
                          'Mensagens',
                          style: TextStyle(fontSize: 16),
                        ),
                      ],
                    ),

                    const SizedBox(height: 30),
                  ],
                ),
              ),
            ),
          ),
        ),
      
    );
  }

  // ==== COMPONENTES REUTILIZÁVEIS ====

  static Widget _buildWhiteBox({required List<Widget> children}) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: children,
      ),
    );
  }

  static Widget _sectionTitle(String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Text(
        text,
        style: const TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 18,
        ),
      ),
    );
  }

  static Widget _menuItem(String text, String iconPath) {
    return Column(
      children: [
        Row(
          children: [
            SvgPicture.asset(
              iconPath,
              width: 22,
              height: 22,
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Text(
                text,
                style: const TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 16,
                  color: Colors.black87,
                ),
              ),
            ),
          ],
        ),
        const Divider(height: 20),
      ],
    );
  }
}
