class LivroModel {
  String? titulo;
  String? descricao;
  bool lido;

  LivroModel({
    this.titulo = '',
    this.descricao = '',
    this.lido = false,
  });

  @override
  String toString() {
    return 'titulo: $titulo, descricao: $descricao, lido: $lido';
  }
}
