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
    final largura = MediaQuery.of(context).size.width;

    // 🔥 Fonte responsiva: maior em telas médias/grandes
    double fontSize;
    if (largura < 390) {
      fontSize = 13.8; // celulares muito estreitos
    } else if (largura < 500) {
      fontSize = 14.5; // celulares comuns
    } else {
      fontSize = 15.5; // desktop / tablet
    }

    TextStyle navStyle(bool selected) => TextStyle(
          color: selected ? const Color(0xFFE1BC7B) : Colors.white,
          fontWeight: selected ? FontWeight.w700 : FontWeight.w600,
          fontSize: fontSize,
        );

    // 🔥 Logo responsiva
    double logoSize;
    if (largura < 390) {
      logoSize = 50;
    } else if (largura < 500) {
      logoSize = 58;
    } else {
      logoSize = 65;
    }

    // 🔥 Largura máxima da área dos botões
    double maxRowWidth = largura < 500 ? largura * 0.80 : 450;

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
              height: logoSize,
              width: logoSize,
              fit: BoxFit.contain,
            ),
          ),
          Expanded(
            child: Align(
              alignment: Alignment.center,
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  maxWidth: maxRowWidth,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _navButton(
                        "Catálogo", '/catalog', current, navStyle, context),
                    SizedBox(width: largura < 390 ? 3 : 5),
                    _navButton("Marcas", '/marcas', current, navStyle, context),
                    SizedBox(width: largura < 390 ? 3 : 5),
                    _navButton("Categorias", '/categorias', current, navStyle,
                        context),
                    SizedBox(width: largura < 390 ? 3 : 5),
                    _navButton(
                        "Materiais", '/materiais', current, navStyle, context),
                  ],
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
          const EdgeInsets.symmetric(horizontal: 8, vertical: 5),
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
