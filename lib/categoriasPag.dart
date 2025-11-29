// ignore_for_file: file_names

import 'package:flutter/material.dart';

import '../appBar.dart';
import '../categoriaService.dart';
import '../categorias.dart';
import '../descricaoPag.dart';
import '../produto.dart';
import '../produtoService.dart';

class CategoriasScreen extends StatefulWidget {
  const CategoriasScreen({super.key});

  @override
  State<CategoriasScreen> createState() => _CategoriasScreenState();
}

class _CategoriasScreenState extends State<CategoriasScreen> {
  List<Produto> _produtos = [];

  @override
  void initState() {
    super.initState();
    _carregarProdutos();
  }

  Future<void> _carregarProdutos() async {
    _produtos = await ProdutoService().carregarProdutos();
    setState(() {});
  }

  List<Produto> _filtrarPorCategoria(String categoria) {
    return _produtos.where((p) => p.categoria == categoria).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppNavigationBar(),
      backgroundColor: const Color(0xFFFFF7E8),
      body: FutureBuilder<List<Categoria>>(
        future: CategoriasService.carregarCategorias(),
        builder: (context, snapshot) {
          if (!snapshot.hasData || _produtos.isEmpty) {
            return const Center(
              child: CircularProgressIndicator(color: Color(0xFF513020)),
            );
          }

          final categorias = snapshot.data!;

          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
            child: LayoutBuilder(builder: (context, constraints) {
              final maxCardWidth = constraints.maxWidth * 0.95;
              final cardWidth = maxCardWidth > 400 ? 400.0 : maxCardWidth;

              return ListView.builder(
                itemCount: categorias.length + 1,
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

                  final c = categorias[index - 1];

                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: Center(
                      child: ConstrainedBox(
                        constraints: BoxConstraints(
                          maxWidth: cardWidth,
                          minWidth: 240,
                        ),
                        child: InkWell(
                          borderRadius: BorderRadius.circular(14),
                          onTap: () {
                            final produtosFiltrados =
                                _filtrarPorCategoria(c.nome);

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
          );
        },
      ),
    );
  }
}
