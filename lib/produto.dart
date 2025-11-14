// ignore_for_file: avoid_print, file_names
import 'package:flutter/foundation.dart';

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
  double avaliacao;
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

  void exibirDetalhes() {
    if (kDebugMode) {
      print('Produto: $nome - R\$ ${preco.toStringAsFixed(2)}');
    }
  }

  void atualizar({String? novoNome, double? novoPreco, int? novoEstoque}) {
    if (novoNome != null) nome = novoNome;
    if (novoPreco != null) preco = novoPreco;
    if (novoEstoque != null) qtdEstoque = novoEstoque;
  }

  bool disponivel() => qtdEstoque > 0;
}

List<Produto> produtosMock = [
  Produto(
    nome: 'Miniatura Lamborghini Revuelto Hybrid',
    descricao:
        'Miniatura de Lamborghini Revuelto Hybrid, ano 2023, da série Special Edition, na escala 1:18. Feito em metal',
    imagem: 'assets/img/miniLamboHybrid.png',
    preco: 439.90,
    avaliacao: 5,
    escala: '1:18',
    qtdEstoque: 39,
    marca: 'Lamborghini',
    categoria: 'Edição limitada',
    material: 'Metal',
  ),
  Produto(
    nome: 'Miniatura Lamborghini Countach',
    descricao:
        'O Lamborghini Countach foi um automóvel superesportivo produzido pela Lamborghini, na Itália. O primeiro protótipo surgiu em 1971, e a produção durou até 1990. Feito em Plástico',
    imagem: 'assets/img/miniLamboCountack.png',
    preco: 349.90,
    avaliacao: 5,
    escala: '1:64',
    qtdEstoque: 42,
    marca: 'Lamborghini',
    categoria: 'Pré-montado',
    material: 'Plástico',
  ),
  Produto(
    nome: 'Miniatura Lamborghini Aventador Roadster',
    descricao:
        'Miniatura de carro Lamborghini Aventador Roadster, Assembly Line Kit, na escala 1:24. Produzida em metal com detalhes em plástico.',
    imagem: 'assets/img/miniLamboAvent.png',
    preco: 229.90,
    avaliacao: 4.5,
    escala: '1:24',
    qtdEstoque: 18,
    marca: 'Lamborghini',
    categoria: 'Montável',
    material: 'Metal',
  ),
  Produto(
    nome: 'Miniatura Porsche 356 Coupe',
    descricao:
        'miniatura Lucky Porsche 356 1952 Escala 1/43. De metal, Um clássico alemão em miniatura.Reviva a era de ouro dos carros esportivos alemães com esta réplica impecável do Porsche 356 1952, um clássico que marcou época.',
    imagem: 'assets/img/miniPorscheCoupe.png',
    preco: 289.90,
    avaliacao: 5,
    escala: '1:43',
    qtdEstoque: 16,
    marca: 'Porsche',
    categoria: 'Edição limitada',
    material: 'Metal',
  ),
  Produto(
    nome: 'Miniatura BMW M6 GT3 ',
    descricao:
        'A Miniatura BMW M6 GT3 é uma réplica detalhada do lendário carro de corrida da BMW, conhecido por sua potência, aerodinâmica e desempenho nas pistas de endurance. Feito em Plástico',
    imagem: 'assets/img/miniBmwM6.png',
    preco: 289.90,
    avaliacao: 5,
    escala: '1:24',
    qtdEstoque: 13,
    marca: 'BMW',
    categoria: 'Edição limitada',
    material: 'Plástico',
  ),
  Produto(
    nome: 'Miniatura Porsche 911 992.2 GT3',
    descricao:
        'A miniatura Porsche 911 (992.2) GT3 é uma reprodução precisa e moderna de um dos carros esportivos mais icônicos do mundo, desenvolvida por meio de impressão 3D de alta definição. Com design fiel ao modelo real, este kit oferece uma experiência única de montagem, personalização e exposição.',
    imagem: 'assets/img/miniPorscheImpress.png',
    preco: 649.90,
    avaliacao: 5,
    escala: '1:10',
    qtdEstoque: 22,
    marca: 'Porsche',
    categoria: 'Montável',
    material: 'Impressão 3D',
  ),
  Produto(
    nome: 'Miniatura Maserati Mc12',
    descricao:
        'O Maserati MC12 é um veículo esportivo de alta performance produzido pela fabricante italiana Maserati. Lançado em 2004, o MC12 foi desenvolvido com base no modelo de corrida MC12 GT1, projetado para competir na série de corridas FIA GT Championship.',
    imagem: 'assets/img/miniMaserati1.png',
    preco: 749.90,
    avaliacao: 5,
    escala: '1:24',
    qtdEstoque: 17,
    marca: 'Maserati',
    categoria: 'Edição limitada',
    material: 'Plástico',
  ),
  Produto(
    nome: 'Miniatura Audi Q7',
    descricao:
        'A miniatura Audi Q7 em madeira é uma peça elegante e detalhada que representa com fidelidade o design robusto e sofisticado do SUV de luxo da Audi. Produzido em madeira de alta qualidade, o modelo combina artesanato e precisão, destacando linhas suaves, proporções realistas e acabamento refinado.',
    imagem: 'assets/img/miniAudiMadeira.png',
    preco: 1149.90,
    avaliacao: 5,
    escala: '1:18',
    qtdEstoque: 6,
    marca: 'Audi',
    categoria: 'Pré-montado',
    material: 'Madeira',
  ),
  Produto(
    nome: 'Miniatura Maserati Quattroporte 2003',
    descricao:
        'A miniatura Maserati Quattroporte é uma reprodução fiel do sedã de luxo italiano que combina potência, sofisticação e design atemporal. Conhecido por seu equilíbrio entre desempenho esportivo e conforto refinado, o Quattroporte é um ícone da engenharia automotiva da Maserati — e essa miniatura traduz perfeitamente toda essa essência em detalhes.',
    imagem: 'assets/img/miniMaseratiQuattro.png',
    preco: 349.90,
    avaliacao: 5,
    escala: '1:43',
    qtdEstoque: 12,
    marca: 'Maserati',
    categoria: 'Pré-montado',
    material: 'PLástico',
  ),
  Produto(
    nome: 'miniatura Porsche 911 Speedster',
    descricao:
        'A miniatura Porsche 911 Speedster 1989 em madeira é uma homenagem artesanal a um dos modelos mais icônicos da história da Porsche. Famoso por seu design clássico, linhas curvas e espírito esportivo, o Speedster de 1989 é reproduzido aqui com precisão e acabamento refinado, transformando engenharia automotiva em arte decorativa.',
    imagem: 'assets/img/miniPorscheSpeed.png',
    preco: 749.90,
    avaliacao: 5,
    escala: '1:24',
    qtdEstoque: 6,
    marca: 'Porsche',
    categoria: 'Pré-montado',
    material: 'Madeira',
  ),
  Produto(
    nome: 'Miniatura Mercedes-Benz 300 SL',
    descricao:
        'A miniatura em madeira do Mercedes-Benz 300 SL “Gullwing” é uma verdadeira obra de arte artesanal que homenageia um dos carros mais lendários da história do automobilismo. Famoso por suas portas tipo asa de gaivota e design aerodinâmico atemporal, o 300 SL foi um marco de inovação e elegância.',
    imagem: 'assets/img/miniMercedes1.png',
    preco: 549.90,
    avaliacao: 5,
    escala: '1:43',
    qtdEstoque: 11,
    marca: 'Mercedes-Benz',
    categoria: 'Edição limitada',
    material: 'Madeira',
  ),
  Produto(
    nome: 'Miniatura Carro Suv Maserati Levante',
    descricao:
        'A exemplo de outras marcas premium, a Maserati entrou na seara dos utilitários esportivos. O SUV Maserati Levante foi lançado em 2016 e em 2020 chega ao Brasil em três versões: 3.0 V6 Turbo, 3.0 V6 Turbo S e 3.8 Turbo Trofeo. A transmissão das três é automática de oito marchas. SEndo personalizável em cores.',
    imagem: 'assets/img/miniSUVmaserati.png',
    preco: 229.90,
    avaliacao: 5,
    escala: '1:43',
    qtdEstoque: 20,
    marca: 'Maserati',
    categoria: 'Pré-montado',
    material: 'Resina',
  ),
  Produto(
    nome: 'Miniatura Audi R8 conversível',
    descricao:
        'A miniatura Audi R8 Conversível em resina é uma réplica fiel de um dos superesportivos mais admirados do mundo. Com design arrojado, linhas agressivas e acabamento de alto padrão, esta peça captura toda a sofisticação e potência do modelo original em escala reduzida.',
    imagem: 'assets/img/miniAudiR8.png',
    preco: 199.90,
    avaliacao: 5,
    escala: '1:24',
    qtdEstoque: 21,
    marca: 'Audi',
    categoria: 'Edição limitada',
    material: 'Resina',
  ),
  Produto(
    nome: 'Miniatura Mercedes-Benz 500 SL',
    descricao:
        'A miniatura Mercedes-Benz 500 SL é uma reprodução detalhada de um dos modelos mais elegantes e sofisticados da marca alemã. Conhecida por seu design atemporal, desempenho refinado e conforto incomparável, a 500 SL marcou época como símbolo de luxo e esportividade.',
    imagem: 'assets/img/miniMercedesSL.png',
    preco: 389.90,
    avaliacao: 5,
    escala: '1:43',
    qtdEstoque: 21,
    marca: 'Mercedes-Benz',
    categoria: 'Montável',
    material: 'Resina',
  ),
  Produto(
    nome: 'Miniatura Mercedes-Benz G-Class',
    descricao:
        'A miniatura Mercedes-Benz G-Class em impressão 3D é uma reprodução fiel do lendário utilitário de luxo da marca alemã, conhecido por seu design robusto e desempenho incomparável. O modelo combina linhas clássicas, traços modernos e acabamento detalhado, resultando em uma peça que traduz força, elegância e exclusividade.',
    imagem: 'assets/img/miniMercedesG.png',
    preco: 419.90,
    avaliacao: 5,
    escala: '1:24',
    qtdEstoque: 14,
    marca: 'Mercedes-Benz',
    categoria: 'Montável',
    material: 'Impressão 3D',
  ),
  Produto(
    nome: 'Miniatura BMW i4 M50 ',
    descricao:
        'Miniatura montável de carro BMW i4 M50, da série California Action, na escala 1:32. Produzida em metal com partes plásticas, apresenta pneus emborrachados, abertura das portas e pintura na cor azul.',
    imagem: 'assets/img/miniBmwi4.png',
    preco: 149.90,
    avaliacao: 5,
    escala: '1:32',
    qtdEstoque: 7,
    marca: 'BMW',
    categoria: 'Montável',
    material: 'Metal',
  ),
  Produto(
    nome: 'Miniatura BMW 320i',
    descricao:
        'Para os apaixonados por carros de luxo e miniaturas diecast de coleção, o BMW 320i em escala 1:32 é a escolha perfeita. Esta réplica é fiel ao design original do modelo BMW 320i, combinando elegância, sofisticação e esportividade em cada detalhe. ',
    imagem: 'assets/img/miniBmw320.png',
    preco: 279.90,
    avaliacao: 5,
    escala: '1:32',
    qtdEstoque: 4,
    marca: 'BMW',
    categoria: 'Pré-montado',
    material: 'Metal',
  ),
  Produto(
    nome: 'Miniatura Audi RS 6 Avant',
    descricao:
        'Miniatura Carro Audi RS 6 Avant, ano 2019, na escala 1:18. Produzida em metal com detalhes em plástico, apresenta alto grau de detalhamento, pneus emborrachados e pintura na cor laranja metálico. Dimensões aproximadas:  27,5 x 8,0 x 10,0 cm (Comp x Alt x Larg).',
    imagem: 'assets/img/miniAudiRS6.png',
    preco: 1299.90,
    avaliacao: 5,
    escala: '1:18',
    qtdEstoque: 24,
    marca: 'Ferrari',
    categoria: 'Montável',
    material: 'Metal',
  ),
  Produto(
    nome: 'Miniatura Personalizável',
    descricao:
        'Dê vida às suas ideias com esta miniatura totalmente personalizável, criada através da mais moderna tecnologia de impressão 3D. Produzida com materiais de alta qualidade, ela permite ajustes de tamanho, cor, detalhes e acabamento, tornando cada peça única e exclusiva.',
    imagem: 'assets/img/miniIMpress1.png',
    preco: 1599.90,
    avaliacao: 5,
    escala: 'personalizável',
    qtdEstoque: 24,
    marca: '',
    categoria: 'Personalizáveis',
    material: 'Impressão 3D',
  ),
];
