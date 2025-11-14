// ignore_for_file: file_names
import 'package:application_autocollections/produtoDescPag.dart';
import 'package:flutter/material.dart';

import 'appBar.dart';
import 'produto.dart';

class ProdutoCardDescricao extends StatefulWidget {
  final double width;
  final double height;
  final double whiteCardWidth;
  final double whiteCardHeight;
  final Produto produto;

  const ProdutoCardDescricao({
    super.key,
    required this.width,
    required this.height,
    required this.whiteCardWidth,
    required this.whiteCardHeight,
    required this.produto,
  });

  @override
  State<ProdutoCardDescricao> createState() => _ProdutoCardDescricaoState();
}

class _ProdutoCardDescricaoState extends State<ProdutoCardDescricao> {
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
              builder: (_) => ProdutoDescPag(produto: widget.produto),
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
            boxShadow: const [
              BoxShadow(
                color: Colors.black26,
                blurRadius: 6,
                offset: Offset(-2, 4),
              ),
            ],
          ),
          child: Column(
            children: [
              Container(
                width: widget.whiteCardWidth,
                height: widget.whiteCardHeight,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                ),
                padding: const EdgeInsets.all(6),
                child: Image.asset(
                  widget.produto.imagem,
                  fit: BoxFit.contain,
                ),
              ),
              const SizedBox(height: 6),
              Text(
                widget.produto.nome,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: widget.height * 0.065,
                  fontWeight: FontWeight.bold,
                ),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              const Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}

class DescricaoScreen extends StatelessWidget {
  final String titulo;
  final String descricao;
  final List<Produto> produtos;
  final String? imagem;

  const DescricaoScreen({
    super.key,
    required this.titulo,
    required this.descricao,
    required this.produtos,
    this.imagem,
  });

  @override
  Widget build(BuildContext context) {
    const cardWidth = 120.0;
    const cardHeight = 150.0;
    const whiteCardWidth = cardWidth * 0.85;
    const whiteCardHeight = cardHeight * 0.48;

    return Scaffold(
      appBar: const AppNavigationBar(noSelection: true),
      backgroundColor: const Color(0xFFFFF7E8),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            if (imagem != null) ...[
              Center(
                child: Image.asset(
                  imagem!,
                  height: 130,
                  fit: BoxFit.contain,
                ),
              ),
              const SizedBox(height: 18),
            ],
            Center(
              child: Text(
                titulo,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.w900,
                  color: Color(0xFF513020),
                ),
              ),
            ),
            const SizedBox(height: 18),
            Center(
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 500),
                child: Card(
                  color: Colors.white,
                  elevation: 4,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(14),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 18, vertical: 22),
                    child: Text(
                      descricao,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 17,
                        height: 1.5,
                        color: Color(0xFF513020),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 28),
            const Text(
              'Produtos',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w700,
                color: Color(0xFF513020),
              ),
            ),
            const SizedBox(height: 20),
            produtos.isNotEmpty
                ? Center(
                    child: Wrap(
                      alignment: WrapAlignment.center,
                      spacing: 14,
                      runSpacing: 14,
                      children: produtos
                          .map(
                            (p) => ProdutoCardDescricao(
                              width: cardWidth,
                              height: cardHeight,
                              whiteCardWidth: whiteCardWidth,
                              whiteCardHeight: whiteCardHeight,
                              produto: p,
                            ),
                          )
                          .toList(),
                    ),
                  )
                : const Center(
                    child: Text(
                      'Nenhum produto associado.',
                      style: TextStyle(color: Colors.black54),
                    ),
                  ),
            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }
}
