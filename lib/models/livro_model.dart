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
    return 'id: $id, titulo: $titulo, descricao: $descricao, lido: $lido';
  }

  LivroModel copyWith({
    int? id,
    String? titulo,
    String? descricao,
    bool? lido,
  }) {
    return LivroModel(
      id: id ?? this.id,
      titulo: titulo ?? this.titulo,
      descricao: descricao ?? this.descricao,
      lido: lido ?? this.lido,
    );
  }
}
