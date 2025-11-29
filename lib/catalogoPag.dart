// ignore_for_file: file_names

import 'package:application_autocollections/produtoDescPag.dart';
import 'package:flutter/material.dart';

import 'appBar.dart';
import 'produto.dart';
import 'produtoService.dart';

class CatalogoScreen extends StatelessWidget {
  const CatalogoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppNavigationBar(),
      backgroundColor: const Color(0xfffff7e8),
      body: FutureBuilder<List<Produto>>(
        future: ProdutoService().carregarProdutos(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const Center(
              child: CircularProgressIndicator(color: Color(0xFF513020)),
            );
          }

          final produtos = snapshot.data!;

          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            child: LayoutBuilder(
              builder: (context, constraints) {
                final gridWidth = constraints.maxWidth;
                const crossAxisSpacing = 24.0;

                final cardWidth =
                    (gridWidth - crossAxisSpacing * 1.5) / 2 * 0.9;
                final cardHeight = cardWidth * 1.32;

                return ListView(
                  children: [
                    const Text(
                      'Catálogo',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.w900,
                        color: Color(0xFF513020),
                      ),
                    ),
                    const SizedBox(height: 18),
                    GridView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: produtos.length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: crossAxisSpacing,
                        mainAxisSpacing: crossAxisSpacing,
                        childAspectRatio: cardWidth / cardHeight,
                      ),
                      itemBuilder: (context, index) {
                        final item = produtos[index];
                        final whiteCardWidth = cardWidth * 0.85;
                        final whiteCardHeight = cardHeight * 0.48;

                        return Center(
                          child: _HoverableCard(
                            width: cardWidth,
                            height: cardHeight,
                            whiteCardWidth: whiteCardWidth,
                            whiteCardHeight: whiteCardHeight,
                            produto: item,
                          ),
                        );
                      },
                    ),
                  ],
                );
              },
            ),
          );
        },
      ),
    );
  }
}

class _HoverableCard extends StatefulWidget {
  final double width;
  final double height;
  final double whiteCardWidth;
  final double whiteCardHeight;
  final Produto produto;

  const _HoverableCard({
    required this.width,
    required this.height,
    required this.whiteCardWidth,
    required this.whiteCardHeight,
    required this.produto,
  });

  @override
  State<_HoverableCard> createState() => _HoverableCardState();
}

class _HoverableCardState extends State<_HoverableCard> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) => setState(() => isHovered = true),
      onExit: (_) => setState(() => isHovered = false),
      child: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ProdutoDescPag(produto: widget.produto),
            ),
          );
        },
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 150),
          width: widget.width,
          height: widget.height,
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color:
                isHovered ? const Color(0xFFb53a2c) : const Color(0xFF9b2b1f),
            borderRadius: BorderRadius.circular(14),
            boxShadow: [
              BoxShadow(
                color: Colors.black26,
                blurRadius: isHovered ? 8 : 6,
                offset: const Offset(-2, 4),
              ),
            ],
          ),
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.symmetric(
                  horizontal: (widget.width - widget.whiteCardWidth) / 2,
                  vertical: (widget.width - widget.whiteCardWidth) / 2 * 0.5,
                ),
                width: widget.whiteCardWidth,
                height: widget.whiteCardHeight,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                ),
                padding: const EdgeInsets.all(6),
                child: Center(
                  child: Image.asset(
                    widget.produto.imagem,
                    fit: BoxFit.contain,
                    width: double.infinity,
                    height: double.infinity,
                  ),
                ),
              ),
              const SizedBox(height: 4),
              Text(
                widget.produto.nome,
                textAlign: TextAlign.center,
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: widget.height * 0.05,
                  fontWeight: FontWeight.bold,
                  height: 1.1,
                ),
              ),
              const Spacer(),
              Text(
                'R\$ ${widget.produto.preco.toStringAsFixed(2)}',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: widget.height * 0.06,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 6),
            ],
          ),
        ),
      ),
    );
  }
}
