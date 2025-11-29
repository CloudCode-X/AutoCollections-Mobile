// ignore_for_file: file_names

import 'dart:convert';

import 'package:flutter/services.dart';

import '../categorias.dart';

class CategoriasService {
  static Future<List<Categoria>> carregarCategorias() async {
    final jsonString =
        await rootBundle.loadString('assets/data/categorias.json');

    final List list = jsonDecode(jsonString);

    return list.map((e) => Categoria.fromJson(e)).toList();
  }
}
