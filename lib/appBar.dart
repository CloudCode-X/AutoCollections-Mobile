// ignore_for_file: file_names

import 'package:flutter/material.dart';

class AppNavigationBar extends StatelessWidget implements PreferredSizeWidget {
  final bool noSelection;

  const AppNavigationBar({
    super.key,
    this.noSelection = false,
  });

  @override
  Size get preferredSize => const Size.fromHeight(90);

  void _pushNamedReplace(BuildContext context, String route) {
    if (ModalRoute.of(context)?.settings.name == route) return;
    Navigator.pushReplacementNamed(context, route);
  }

  @override
  Widget build(BuildContext context) {
    final current = ModalRoute.of(context)?.settings.name ?? '';

    TextStyle navStyle(bool selected) => TextStyle(
          color: selected ? const Color(0xFFE1BC7B) : Colors.white,
          fontWeight: selected ? FontWeight.w700 : FontWeight.w600,
          fontSize: 16,
        );

    return AppBar(
      backgroundColor: const Color(0xFF9B2B1F),
      elevation: 0,
      toolbarHeight: 90,
      automaticallyImplyLeading: false,
      centerTitle: true,

      // ↓ evita overflow horizontal
      title: LayoutBuilder(
        builder: (context, constraints) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Logo
              Padding(
                padding: const EdgeInsets.only(right: 16.0),
                child: Image.asset(
                  'assets/img/LogoCliente.png',
                  height: 70,
                  width: 70,
                  fit: BoxFit.contain,
                ),
              ),

              // Opções do menu — agora dentro de Expanded para caber SEM ESTOURAR
              Expanded(
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      _navButton(
                          "Catálogo", '/catalog', current, navStyle, context),
                      const SizedBox(width: 10),
                      _navButton(
                          "Marcas", '/marcas', current, navStyle, context),
                      const SizedBox(width: 10),
                      _navButton("Categorias", '/categorias', current, navStyle,
                          context),
                      const SizedBox(width: 10),
                      _navButton("Materiais", '/materiais', current, navStyle,
                          context),
                    ],
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  Widget _navButton(String label, String route, String current,
      TextStyle Function(bool) style, BuildContext context) {
    return TextButton(
      onPressed: () => _pushNamedReplace(context, route),
      child: Text(
        label,
        style: style(!noSelection && current == route),
      ),
    );
  }
}
