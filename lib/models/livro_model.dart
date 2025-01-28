class LivroModel {
  String? titulo;
  String? descricao;
  bool lido;

  LivroModel({
    this.titulo = '',
    this.descricao = '',
    this.lido = false,
  });
}

 List<LivroModel>  livros = [
  LivroModel(
    titulo: 'O Alquimista',
    descricao:
        'Um jovem pastor encontra um tesouro escondido e segue uma jornada de auto-descoberta.',
    lido: false,
  ),
  LivroModel(
    titulo: 'O Senhor dos Anéis',
    descricao:
        'Uma jornada épica de um hobbit para destruir o Um Anel e salvar a Terra Média.',
    lido: true,
  ),
  LivroModel(
    titulo: 'O Código Da Vinci',
    descricao:
        'Um mistério envolvendo a obra de Leonardo da Vinci e uma conspiração secreta.',
    lido: false,
  ),
  LivroModel(
    titulo: 'Harry Potter e a Pedra Filosofal',
    descricao:
        'A história de um jovem bruxo que descobre seu destino e entra em uma escola de magia.',
    lido: true,
  ),
  LivroModel(
    titulo: 'O Poder do Hábito',
    descricao: 'Um guia para entender e mudar os hábitos para melhorar a vida.',
    lido: false,
  ),
];
