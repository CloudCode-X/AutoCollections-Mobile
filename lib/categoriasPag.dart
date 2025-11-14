// ignore_for_file: file_names

import 'package:application_autocollections/appBar.dart';
import 'package:application_autocollections/categorias.dart';
import 'package:application_autocollections/descricaoPag.dart';
import 'package:application_autocollections/produto.dart';
import 'package:flutter/material.dart';

class CategoriasScreen extends StatelessWidget {
  const CategoriasScreen({super.key});

  List<Produto> _filtrarPorCategoria(String categoria) {
    return produtosMock.where((p) => p.categoria == categoria).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppNavigationBar(),
      backgroundColor: const Color(0xFFFFF7E8),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
        child: LayoutBuilder(builder: (context, constraints) {
          final maxCardWidth = constraints.maxWidth * 0.95;
          final cardWidth = maxCardWidth > 400 ? 400.0 : maxCardWidth;

          return ListView.builder(
            itemCount: categoriasMock.length + 1,
            padding: const EdgeInsets.symmetric(vertical: 10),
            itemBuilder: (context, index) {
              if (index == 0) {
                return const Padding(
                  padding: EdgeInsets.symmetric(vertical: 6),
                  child: Text(
                    'Categorias',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.w900,
                      color: Color(0xFF513020),
                    ),
                  ),
                );
              }

              final c = categoriasMock[index - 1];

              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Center(
                  child: ConstrainedBox(
                    constraints:
                        BoxConstraints(maxWidth: cardWidth, minWidth: 240),
                    child: InkWell(
                      borderRadius: BorderRadius.circular(14),
                      onTap: () {
                        final produtosFiltrados = _filtrarPorCategoria(c.nome);
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => DescricaoScreen(
                              titulo: c.nome,
                              descricao: c.descricao,
                              produtos: produtosFiltrados,
                            ),
                          ),
                        );
                      },
                      child: Card(
                        color: Colors.white,
                        elevation: 4,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(14),
                        ),
                        child: SizedBox(
                          height: 110,
                          child: Center(
                            child: Text(
                              c.nome,
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.bold,
                                color: Color(0xFF513020),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              );
            },
          );
        }),
      ),
    );
  }
}
