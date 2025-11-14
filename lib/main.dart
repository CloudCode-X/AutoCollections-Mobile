// ignore_for_file: depend_on_referenced_packages

import 'package:application_autocollections/catalogoPag.dart';
import 'package:application_autocollections/categoriasPag.dart';
import 'package:application_autocollections/inicioPag.dart';
import 'package:application_autocollections/marcasPag.dart';
import 'package:application_autocollections/materiaisPag.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const AutoCollectionsApp());
}

class AutoCollectionsApp extends StatelessWidget {
  const AutoCollectionsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'AutoCollections',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,

        // GARANTE QUE OS ÍCONES FUNCIONEM
        iconTheme: const IconThemeData(color: Color(0xFF9B2B1F)),

        // Mantém Material Icons funcionando
        textTheme: GoogleFonts.montserratTextTheme(
          ThemeData.light().textTheme, // ← Ponto crucial!
        ),
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const HomeScreen(),
        '/catalog': (context) => const CatalogoScreen(),
        '/marcas': (context) => const MarcasScreen(),
        '/categorias': (context) => const CategoriasScreen(),
        '/materiais': (context) => const MateriaisScreen(),
      },
    );
  }
}
