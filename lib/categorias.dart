class Categoria {
  String nome;
  String descricao;
  List<int> produtoIds;

  Categoria({required this.nome, this.descricao = '', List<int>? produtoIds})
      : produtoIds = produtoIds ?? [];

  // ignore: avoid_print
  void listar() => print('Categoria: $nome -> produtos: $produtoIds');
}

List<Categoria> categoriasMock = [
  Categoria(
      nome: 'Montável',
      descricao:
          'Essa categoria é voltada para quem gosta de participar ativamente da montagem do modelo. Esses kits vêm com todas as peças separadas e instruções detalhadas, permitindo que o usuário monte, pinte e personalize o carro conforme desejar. Além de divertida, a montagem estimula a criatividade, coordenação e aprendizado técnico sobre a estrutura dos veículos.'),
  Categoria(
      nome: 'Pré-montado',
      descricao:
          'Os modelos Pré-Montados são entregues prontos para exposição, sem necessidade de montagem pelo comprador. Cada miniatura é cuidadosamente montada por profissionais, com acabamento detalhado, pintura precisa e encaixes perfeitos. É a opção ideal para quem deseja qualidade e praticidade, recebendo o produto pronto para exibir.'),
  Categoria(
      nome: 'Edição limitada',
      descricao:
          'As miniaturas de Edição Limitada são produzidas em quantidades restritas, tornando cada unidade uma peça de colecionismo exclusiva. Geralmente numeradas e acompanhadas de certificado, essas versões se destacam pelo nível superior de acabamento, pintura manual e fidelidade histórica. Por sua raridade, costumam ter alto valor de coleção.'),
  Categoria(
      nome: 'Personalizáveis',
      descricao:
          'As miniaturas Personalizáveis permitem que cada colecionador crie um modelo único e sob medida. É possível escolher cores, adesivos, rodas, acabamentos e até detalhes internos, garantindo exclusividade total. Essa categoria une arte e engenharia, transformando cada réplica em uma expressão individual de estilo e criatividade.'),
];
