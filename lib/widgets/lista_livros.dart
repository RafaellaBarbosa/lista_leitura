import 'package:flutter/material.dart';
import 'package:lista_leitura/widgets/linha_horizontal.dart';

import '../models/livro_model.dart';

class ListaLivros extends StatelessWidget {
  const ListaLivros({
    super.key,
    required this.listaLivros,
  });

  final List<LivroModel> listaLivros;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: listaLivros.length,
      itemBuilder: (context, index) {
        var livro = listaLivros[index];
        return ListTile(
          visualDensity: VisualDensity.compact,
          contentPadding: EdgeInsets.all(0),
          title: Padding(
            padding: const EdgeInsets.only(left: 58.0),
            child: Text(
              livro.titulo!,
              style: TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.bold,
                color: livro.lido ? Colors.grey : Colors.black,
                decoration: livro.lido ? TextDecoration.lineThrough : null,
                decorationColor: Colors.grey,
                decorationThickness: 2,
              ),
            ),
          ),
          subtitle: Padding(
            padding: const EdgeInsets.only(left: 58.0),
            child: Text(
              livro.descricao!,
              maxLines: 1,
              style: TextStyle(
                color: livro.lido ? Colors.grey : Colors.black,
                fontWeight: FontWeight.bold,
                overflow: TextOverflow.ellipsis,
                decoration: livro.lido ? TextDecoration.lineThrough : null,
                decorationColor: Colors.grey,
                decorationThickness: 2,
              ),
            ),
          ),
        );
      },
      separatorBuilder: (context, index) => LinhaHorizontal(),
    );
  }
}
