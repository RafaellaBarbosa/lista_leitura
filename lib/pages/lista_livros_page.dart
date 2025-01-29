import 'package:flutter/material.dart';
import 'package:lista_leitura/models/livro_model.dart';
import 'package:lista_leitura/routes.dart';
import 'package:lista_leitura/widgets/lista_livros.dart';

import '../widgets/linha_horizontal.dart';

class ListaLivrosPage extends StatelessWidget {
  const ListaLivrosPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(
          0xfff1ef88,
        ),
        body: Stack(
          children: [
            SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 58),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Lista de leitura...',
                          style: TextStyle(
                            color: Color(
                              0xff498c9a,
                            ),
                            fontSize: 26,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        IconButton(
                          color: Color(
                            0xff498c9a,
                          ),
                          icon: Icon(Icons.add),
                          onPressed: () {
                            Navigator.of(context).pushNamed(
                              AppRoutes.formularioLivro,
                            );
                          },
                        )
                      ],
                    ),
                  ),
                  LinhaHorizontal(),
                  ListaLivros(
                    listaLivros: livros,
                  ),
                  LinhaHorizontal(),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 38),
              child: VerticalDivider(
                color: Colors.red[200],
                thickness: 3,
              ),
            )
          ],
        ),
      ),
    );
  }
}
