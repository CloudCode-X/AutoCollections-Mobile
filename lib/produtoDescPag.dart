// ignore_for_file: file_names

import 'dart:math';

import 'package:flutter/material.dart';

import 'appBar.dart';
import 'produto.dart';

class ProdutoDescPag extends StatelessWidget {
  final Produto produto;

  const ProdutoDescPag({super.key, required this.produto});

  // Comentários variados automáticos
  List<String> _gerarComentarios() {
    final comentarios = [
      "Produto excelente, qualidade surpreendente!",
      "Muito bom, recomendo demais.",
      "Atendeu exatamente o que eu precisava.",
      "Design bonito e material muito resistente.",
      "Preço justo pelo que oferece.",
      "Entrega rápida e produto impecável.",
      "Acabamento muito bem feito.",
      "Durou mais do que eu esperava, muito satisfeito.",
      "Ótima funcionalidade e fácil de usar.",
      "Voltaria a comprar sem dúvidas!",
      "Superou minhas expectativas!",
      "Excelente custo-benefício."
    ];

    // embaralha e pega 4 comentários diferentes
    comentarios.shuffle(Random());
    return comentarios.take(4).toList();
  }

  @override
  Widget build(BuildContext context) {
    final comentarios = _gerarComentarios();

    return Scaffold(
      appBar: const AppNavigationBar(),
      backgroundColor: const Color(0xFFFFF7E8),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: double.infinity,
                margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      blurRadius: 6,
                      offset: const Offset(0, 3),
                    ),
                  ],
                ),
                child: Image.asset(
                  produto.imagem,
                  height: 200,
                  fit: BoxFit.contain,
                ),
              ),
              const SizedBox(height: 16),

              Text(
                produto.nome,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 6),

              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'R\$ ${produto.preco.toStringAsFixed(2)}',
                  style: const TextStyle(
                    fontSize: 18,
                    color: Color(0xFF9B2B1F),
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              const SizedBox(height: 12),

              // Card de descrição
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: const Color(0xFFE1BC7B).withOpacity(0.52),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Descrição do produto:",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      produto.descricao,
                      style: const TextStyle(fontSize: 14),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16),

              // Avaliações
              const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Avaliações:',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
              ),
              const SizedBox(height: 6),

              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: List.generate(5, (index) {
                  if (index < produto.avaliacao) {
                    return const Icon(
                      Icons.star,
                      color: Color(0xFF9B2B1F),
                      size: 24,
                    );
                  } else {
                    return const Icon(
                      Icons.star_border,
                      color: Color(0xFF9B2B1F),
                      size: 24,
                    );
                  }
                }),
              ),
              const SizedBox(height: 12),

              // Comentários variados e automáticos
              Wrap(
                spacing: 12,
                runSpacing: 12,
                children: comentarios.map((texto) {
                  return Container(
                    width: MediaQuery.of(context).size.width * 0.42,
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: const Color(0xFFEFD8AF),
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.05),
                          blurRadius: 4,
                          offset: const Offset(0, 3),
                        ),
                      ],
                    ),
                    child: Text(
                      texto,
                      style: const TextStyle(fontSize: 13),
                    ),
                  );
                }).toList(),
              ),

              const SizedBox(height: 24),
              // botão removido ✔
            ],
          ),
        ),
      ),
    );
  }
}
