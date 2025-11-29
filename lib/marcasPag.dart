// ignore_for_file: file_names

import 'package:flutter/material.dart';

import '../appBar.dart';
import '../descricaoPag.dart';
import '../marcaService.dart';
import '../marcas.dart';
import '../produto.dart';
import '../produtoService.dart';

class MarcasScreen extends StatefulWidget {
  const MarcasScreen({super.key});

  @override
  State<MarcasScreen> createState() => _MarcasScreenState();
}

class _MarcasScreenState extends State<MarcasScreen> {
  late Future<List<Marca>> futuroMarcas;
  late Future<List<Produto>> futuroProdutos;

  @override
  void initState() {
    super.initState();
    futuroMarcas = MarcasService.carregarMarcas();
    futuroProdutos = ProdutoService().carregarProdutos();
  }

  List<Produto> _filtrarPorMarca(List<Produto> produtos, String marca) {
    return produtos.where((p) => p.marca == marca).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppNavigationBar(),
      backgroundColor: const Color(0xFFFFF7E8),
      body: FutureBuilder(
        future: Future.wait([futuroMarcas, futuroProdutos]),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(color: Color(0xFF513020)),
            );
          }

          if (!snapshot.hasData || snapshot.data![0].isEmpty) {
            return const Center(
              child: Text(
                "Nenhuma marca encontrada",
                style: TextStyle(
                  fontSize: 18,
                  color: Color(0xFF513020),
                ),
              ),
            );
          }

          final marcas = snapshot.data![0] as List<Marca>;
          final produtos = snapshot.data![1] as List<Produto>;

          return LayoutBuilder(
            builder: (context, constraints) {
              final screenWidth = constraints.maxWidth;

              const crossAxisCount = 2;

              return SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  child: Column(
                    children: [
                      const Text(
                        'Marcas',
                        style: TextStyle(
                          fontSize: 34,
                          fontWeight: FontWeight.w900,
                          color: Color(0xFF513020),
                        ),
                      ),
                      const SizedBox(height: 10),
                      Image.asset('assets/img/logoCliente.png', height: 150),
                      const SizedBox(height: 30),
                      Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: screenWidth < 500 ? 12 : 24,
                        ),
                        child: GridView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: crossAxisCount,
                            crossAxisSpacing: 16,
                            mainAxisSpacing: 16,
                            childAspectRatio: 0.9,
                          ),
                          itemCount: marcas.length,
                          itemBuilder: (context, index) {
                            final m = marcas[index];

                            return Card(
                              elevation: 4,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(16),
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Expanded(
                                      child: Image.asset(
                                        m.logoPath,
                                        fit: BoxFit.contain,
                                      ),
                                    ),
                                    const SizedBox(height: 10),
                                    Text(
                                      m.nome,
                                      textAlign: TextAlign.center,
                                      style: const TextStyle(
                                        color: Color(0xFF513020),
                                        fontWeight: FontWeight.bold,
                                        fontSize: 17,
                                      ),
                                    ),
                                    SizedBox(
                                      width: double.infinity,
                                      child: ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                          backgroundColor:
                                              const Color(0xFFE1BC7B),
                                          foregroundColor:
                                              const Color(0xFF7A2E1B),
                                        ),
                                        onPressed: () {
                                          final prods = _filtrarPorMarca(
                                              produtos, m.nome);

                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (_) => DescricaoScreen(
                                                titulo: m.nome,
                                                descricao: m.descricao,
                                                imagem: m.logoPath,
                                                produtos: prods,
                                              ),
                                            ),
                                          );
                                        },
                                        child: const Text(
                                          "Saber mais",
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
