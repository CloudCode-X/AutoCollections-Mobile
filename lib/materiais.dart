class Materiais {
  final String nome;
  final String descricao;

  Materiais({
    required this.nome,
    required this.descricao,
  });

  factory Materiais.fromJson(Map<String, dynamic> json) {
    return Materiais(
      nome: json['nome'],
      descricao: json['descricao'],
    );
  }
}
