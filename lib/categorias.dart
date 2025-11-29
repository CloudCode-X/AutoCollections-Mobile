class Categoria {
  String nome;
  String descricao;
  List<int> produtoIds;

  Categoria({
    required this.nome,
    required this.descricao,
    required this.produtoIds,
  });

  factory Categoria.fromJson(Map<String, dynamic> json) {
    return Categoria(
      nome: json["nome"] ?? "",
      descricao: json["descricao"] ?? "",
      produtoIds:
          (json["produtoIds"] as List?)?.map((e) => e as int).toList() ?? [],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "nome": nome,
      "descricao": descricao,
      "produtoIds": produtoIds,
    };
  }
}
