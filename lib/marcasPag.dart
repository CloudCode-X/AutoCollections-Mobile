// ignore_for_file: file_names

import 'package:application_autocollections/appBar.dart';
import 'package:application_autocollections/descricaoPag.dart';
import 'package:application_autocollections/marcas.dart';
import 'package:application_autocollections/produto.dart';
import 'package:flutter/material.dart';

class MarcasScreen extends StatelessWidget {
  const MarcasScreen({super.key});

  List<Produto> _filtrarPorMarca(String marca) {
    return produtosMock.where((p) => p.marca == marca).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppNavigationBar(),
      backgroundColor: const Color(0xFFFFF7E8),
      body: LayoutBuilder(
        builder: (context, constraints) {
          final screenWidth = constraints.maxWidth;

          final crossAxisCount = (screenWidth ~/ 220).clamp(1, 4);

          return SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text(
                    'Marcas',
                    style: TextStyle(
                      fontSize: 34,
                      fontWeight: FontWeight.w900,
                      color: Color(0xFF513020),
                      letterSpacing: 1.2,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Image.asset('assets/img/LogoCliente.png', height: 150),
                  const SizedBox(height: 30),
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: screenWidth < 500 ? 12 : 24,
                    ),
                    child: GridView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: crossAxisCount,
                        crossAxisSpacing: 16,
                        mainAxisSpacing: 16,
                        childAspectRatio: 0.9,
                      ),
                      itemCount: marcas.length,
                      itemBuilder: (context, index) {
                        final m = marcas[index];
                        return Card(
                          color: Colors.white,
                          elevation: 4,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 16,
                              vertical: 20,
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  flex: 5,
                                  child: Center(
                                    child: Image.asset(
                                      m.logoPath,
                                      height: 90,
                                      fit: BoxFit.contain,
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 10),
                                Text(
                                  m.nome,
                                  style: const TextStyle(
                                    color: Color(0xFF513020),
                                    fontWeight: FontWeight.bold,
                                    fontSize: 17,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                                const SizedBox(height: 14),
                                SizedBox(
                                  width: double.infinity,
                                  child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: const Color(0xFFE1BC7B),
                                      foregroundColor: const Color(0xFF7A2E1B),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      padding: const EdgeInsets.symmetric(
                                        vertical: 10,
                                      ),
                                    ),
                                    onPressed: () {
                                      final produtosDaMarca =
                                          _filtrarPorMarca(m.nome);
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (_) => DescricaoScreen(
                                            titulo: m.nome,
                                            descricao: m.descricao,
                                            imagem: m.logoPath,
                                            produtos: produtosDaMarca,
                                          ),
                                        ),
                                      );
                                    },
                                    child: const Text(
                                      'Saber mais',
                                      style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold,
                                      ),
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 1,
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
      ),
    );
  }
}
