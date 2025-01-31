import 'package:flutter/material.dart';
import 'package:lista_leitura/pages/formulario_livro_page.dart';
import 'package:lista_leitura/widgets/linha_horizontal.dart';

import '../models/livro_model.dart';

class ListaLivros extends StatelessWidget {
  const ListaLivros({
    super.key,
    required this.listaLivros,
    required this.onCadastrar,
    required this.onDeletar,
  });

  final List<LivroModel> listaLivros;
  final Function(LivroModel) onCadastrar;
  final Function(LivroModel) onDeletar;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: listaLivros.length,
      itemBuilder: (context, index) {
        final livro = listaLivros.elementAt(index);
        return ListTile(
          trailing: Padding(
            padding: const EdgeInsets.only(right: 12.0),
            child: IconButton(
              icon: Icon(Icons.delete_outline),
              onPressed: () {
                onDeletar(livro);
              },
            ),
          ),
          onTap: () => Navigator.of(context).push(MaterialPageRoute(
            builder: (_) {
              return FormularioLivroPage(
                onCadastrar: onCadastrar,
                livro: livro,
              );
            },
          )),
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
