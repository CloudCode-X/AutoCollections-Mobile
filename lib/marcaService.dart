// ignore_for_file: file_names

import 'dart:convert';

import 'package:flutter/services.dart';

import '../marcas.dart';

class MarcasService {
  static Future<List<Marca>> carregarMarcas() async {
    final jsonString = await rootBundle.loadString('assets/data/marcas.json');
    final List lista = jsonDecode(jsonString);

    return lista.map((e) => Marca.fromJson(e)).toList();
  }
}
