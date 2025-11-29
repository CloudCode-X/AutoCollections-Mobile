// ignore_for_file: file_names

import 'package:application_autocollections/appBar.dart';
import 'package:application_autocollections/descricaoPag.dart';
import 'package:application_autocollections/materiais.dart';
import 'package:application_autocollections/materialService.dart';
import 'package:application_autocollections/produto.dart';
import 'package:application_autocollections/produtoService.dart';
import 'package:flutter/material.dart';

class MateriaisScreen extends StatefulWidget {
  const MateriaisScreen({super.key});

  @override
  State<MateriaisScreen> createState() => _MateriaisScreenState();
}

class _MateriaisScreenState extends State<MateriaisScreen> {
  late Future<List<Materiais>> futuroMateriais;
  late Future<List<Produto>> futuroProdutos;

  @override
  void initState() {
    super.initState();

    // Agora vindo do JSON como marcas/categorias
    futuroMateriais = MaterialService().carregarMateriais();
    futuroProdutos = ProdutoService().carregarProdutos();
  }

  List<Produto> _filtrarPorMaterial(
    List<Produto> produtos,
    String material,
  ) {
    return produtos.where((p) => p.material == material).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppNavigationBar(),
      backgroundColor: const Color(0xFFFFF7E8),
      body: FutureBuilder(
        future: Future.wait([futuroMateriais, futuroProdutos]),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(color: Color(0xFF513020)),
            );
          }

          if (!snapshot.hasData || snapshot.data![0].isEmpty) {
            return const Center(
              child: Text(
                "Nenhum material encontrado",
                style: TextStyle(
                  fontSize: 18,
                  color: Color(0xFF513020),
                ),
              ),
            );
          }

          final materiais = snapshot.data![0] as List<Materiais>;
          final produtos = snapshot.data![1] as List<Produto>;

          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
            child: LayoutBuilder(builder: (context, constraints) {
              final maxCardWidth = constraints.maxWidth * 0.95;
              final cardWidth = maxCardWidth > 400 ? 400.0 : maxCardWidth;

              return ListView.builder(
                itemCount: materiais.length + 1,
                padding: const EdgeInsets.symmetric(vertical: 10),
                itemBuilder: (context, index) {
                  if (index == 0) {
                    return const Padding(
                      padding: EdgeInsets.symmetric(vertical: 6),
                      child: Text(
                        'Materiais',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.w900,
                          color: Color(0xFF513020),
                        ),
                      ),
                    );
                  }

                  final m = materiais[index - 1];

                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: Center(
                      child: ConstrainedBox(
                        constraints:
                            BoxConstraints(maxWidth: cardWidth, minWidth: 240),
                        child: InkWell(
                          borderRadius: BorderRadius.circular(14),
                          onTap: () {
                            final produtosFiltrados =
                                _filtrarPorMaterial(produtos, m.nome);

                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) => DescricaoScreen(
                                  titulo: m.nome,
                                  descricao: m.descricao,
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
                                  m.nome,
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
