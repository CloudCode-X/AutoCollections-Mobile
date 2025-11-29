import 'dart:convert';

import 'package:flutter/services.dart';

import '../materiais.dart';

class MaterialService {
  Future<List<Materiais>> carregarMateriais() async {
    final String response =
        await rootBundle.loadString('assets/data/materiais.json');

    final List<dynamic> data = jsonDecode(response);

    return data.map((json) => Materiais.fromJson(json)).toList();
  }
}
