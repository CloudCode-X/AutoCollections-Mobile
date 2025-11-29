class Marca {
  final String nome;
  final String descricao;
  final String logoPath;

  Marca({
    required this.nome,
    required this.descricao,
    required this.logoPath,
  });

  factory Marca.fromJson(Map<String, dynamic> json) {
    return Marca(
      nome: json['nome'] ?? '',
      descricao: json['descricao'] ?? '',
      logoPath: json['logoPath'] ?? '',
    );
  }
}
