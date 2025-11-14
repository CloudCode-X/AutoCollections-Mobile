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
      titleSpacing: 8,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 14.0),
            child: Image.asset(
              'assets/img/LogoCliente.png',
              height: 70,
              width: 70,
              fit: BoxFit.contain,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextButton(
                onPressed: () => _pushNamedReplace(context, '/catalog'),
                child: Text(
                  'Catálogo',
                  style: navStyle(!noSelection && current == '/catalog'),
                ),
              ),
              const SizedBox(width: 4),
              TextButton(
                onPressed: () => _pushNamedReplace(context, '/marcas'),
                child: Text(
                  'Marcas',
                  style: navStyle(!noSelection && current == '/marcas'),
                ),
              ),
              const SizedBox(width: 4),
              TextButton(
                onPressed: () => _pushNamedReplace(context, '/categorias'),
                child: Text(
                  'Categorias',
                  style: navStyle(!noSelection && current == '/categorias'),
                ),
              ),
              const SizedBox(width: 4),
              TextButton(
                onPressed: () => _pushNamedReplace(context, '/materiais'),
                child: Text(
                  'Materiais',
                  style: navStyle(!noSelection && current == '/materiais'),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
