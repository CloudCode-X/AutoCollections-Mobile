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
          fontSize: 15,
        );

    return AppBar(
      backgroundColor: const Color(0xFF9B2B1F),
      elevation: 0,
      toolbarHeight: 90,
      automaticallyImplyLeading: false,
      centerTitle: true,
      title: Row(
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: Image.asset(
              'assets/img/logoCliente.png',
              height: 60,
              width: 60,
              fit: BoxFit.contain,
            ),
          ),
          Expanded(
            child: Align(
              alignment: Alignment.center,
              child: ConstrainedBox(
                constraints: const BoxConstraints(
                  maxWidth: 450,
                ),
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      _navButton(
                          "Catálogo", '/catalog', current, navStyle, context),
                      const SizedBox(width: 6),
                      _navButton(
                          "Marcas", '/marcas', current, navStyle, context),
                      const SizedBox(width: 6),
                      _navButton("Categorias", '/categorias', current, navStyle,
                          context),
                      const SizedBox(width: 6),
                      _navButton("Materiais", '/materiais', current, navStyle,
                          context),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _navButton(String label, String route, String current,
      TextStyle Function(bool) style, BuildContext context) {
    return TextButton(
      style: ButtonStyle(
        padding: WidgetStateProperty.all(
          const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
        ),
        minimumSize: WidgetStateProperty.all(const Size(0, 0)),
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
      ),
      onPressed: () => _pushNamedReplace(context, route),
      child: Text(
        label,
        style: style(!noSelection && current == route),
      ),
    );
  }
}
