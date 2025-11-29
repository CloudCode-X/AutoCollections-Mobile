// ignore_for_file: avoid_print, file_names

class Produto {
  static int _nextId = 1;

  final int id;
  String nome;
  String descricao;
  String imagem;
  double preco;
  String escala;
  String categoria;
  String marca;
  String material;
  int qtdPecas;
  int avaliacao;
  int qtdEstoque;

  Produto({
    required this.nome,
    this.descricao = '',
    required this.imagem,
    this.preco = 0,
    this.avaliacao = 0,
    this.escala = '',
    this.material = '',
    this.marca = '',
    this.categoria = '',
    this.qtdPecas = 1,
    this.qtdEstoque = 0,
  }) : id = _nextId++;

  factory Produto.fromJson(Map<String, dynamic> json) {
    return Produto(
      nome: json['nome'],
      descricao: json['descricao'] ?? '',
      imagem: json['imagem'],
      preco: (json['preco'] ?? 0).toDouble(),
      avaliacao: json['avaliacao'] ?? 0,
      escala: json['escala'] ?? '',
      material: json['material'] ?? '',
      marca: json['marca'] ?? '',
      categoria: json['categoria'] ?? '',
      qtdPecas: json['qtdPecas'] ?? 1,
      qtdEstoque: json['qtdEstoque'] ?? 0,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'nome': nome,
      'descricao': descricao,
      'imagem': imagem,
      'preco': preco,
      'avaliacao': avaliacao,
      'escala': escala,
      'material': material,
      'marca': marca,
      'categoria': categoria,
      'qtdPecas': qtdPecas,
      'qtdEstoque': qtdEstoque,
    };
  }
}
