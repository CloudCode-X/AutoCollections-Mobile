// ignore_for_file: file_names

import 'dart:convert';

import 'package:application_autocollections/produto.dart';
import 'package:flutter/services.dart';

class ProdutoService {
  Future<List<Produto>> carregarProdutos() async {
    final jsonString = await rootBundle.loadString('assets/data/produtos.json');

    final List lista = jsonDecode(jsonString);
    return lista.map((e) => Produto.fromJson(e)).toList();
  }
}
