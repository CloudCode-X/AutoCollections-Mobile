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

    double fontSize;
    if (largura < 360) {
      fontSize = 13.4;
    } else if (largura < 390) {
      fontSize = 13.8;
    } else if (largura < 500) {
      fontSize = 14.4;
    } else {
      fontSize = 15.5;
    }

    TextStyle navStyle(bool selected) => TextStyle(
          color: selected ? const Color(0xFFE1BC7B) : Colors.white,
          fontWeight: selected ? FontWeight.w700 : FontWeight.w600,
          fontSize: fontSize,
        );

    double logoSize;
    if (largura < 360) {
      logoSize = 48;
    } else if (largura < 390) {
      logoSize = 50;
    } else if (largura < 500) {
      logoSize = 56;
    } else {
      logoSize = 65;
    }

    double maxRowWidth = largura < 500 ? largura * 0.86 : 480;

    double spacing = largura < 360
        ? 1
        : largura < 390
            ? 2
            : largura < 500
                ? 3
                : 6;

    final double btnPaddingH = largura < 360
        ? 5
        : largura < 390
            ? 6
            : 8;

    final EdgeInsets lastButtonRightMargin = EdgeInsets.only(
      right: largura < 360
          ? 6
          : largura < 390
              ? 8
              : largura < 500
                  ? 10
                  : 12,
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
            padding: const EdgeInsets.only(right: 8),
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
                constraints: BoxConstraints(maxWidth: maxRowWidth),
                child: FittedBox(
                  fit: BoxFit.scaleDown,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      _navButton(
                        "Catálogo",
                        '/catalog',
                        current,
                        navStyle,
                        context,
                        btnPaddingH,
                      ),
                      SizedBox(width: spacing),
                      _navButton(
                        "Marcas",
                        '/marcas',
                        current,
                        navStyle,
                        context,
                        btnPaddingH,
                      ),
                      SizedBox(width: spacing),
                      _navButton(
                        "Categorias",
                        '/categorias',
                        current,
                        navStyle,
                        context,
                        btnPaddingH,
                      ),
                      SizedBox(width: spacing),
                      Padding(
                        padding: lastButtonRightMargin,
                        child: _navButton(
                          "Materiais",
                          '/materiais',
                          current,
                          navStyle,
                          context,
                          btnPaddingH,
                        ),
                      ),
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

  Widget _navButton(
    String label,
    String route,
    String current,
    TextStyle Function(bool) style,
    BuildContext context,
    double paddingH,
  ) {
    return TextButton(
      style: ButtonStyle(
        padding: WidgetStateProperty.all(
          EdgeInsets.symmetric(horizontal: paddingH, vertical: 5),
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