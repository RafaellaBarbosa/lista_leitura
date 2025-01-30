class LivroModel {
  int? id;
  String? titulo;
  String? descricao;
  bool lido;

  LivroModel({
    this.id,
    this.titulo = '',
    this.descricao = '',
    this.lido = false,
  });

  @override
  bool operator ==(other) => other is LivroModel && id == other.id;

  @override
  int get hashCode => id.hashCode;

  @override
  String toString() {
    return 'titulo: $titulo, descricao: $descricao, lido: $lido';
  }
}
