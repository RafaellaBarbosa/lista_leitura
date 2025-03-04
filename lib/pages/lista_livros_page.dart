import 'package:flutter/material.dart';
import 'package:lista_leitura/models/livro_model.dart';
import 'package:lista_leitura/pages/formulario_livro_page.dart';
import 'package:lista_leitura/widgets/lista_livros.dart';

import '../widgets/linha_horizontal.dart';

class ListaLivrosPage extends StatefulWidget {
  const ListaLivrosPage({super.key});

  @override
  State<ListaLivrosPage> createState() => _ListaLivrosPageState();
}

class _ListaLivrosPageState extends State<ListaLivrosPage> {
  late List<LivroModel> meusLivros;

  @override
  void initState() {
    super.initState();
    meusLivros = []; 
  }

  void onCadastrar(LivroModel livroModel) {
    setState(() {
      int index = meusLivros.indexWhere((livro) => livro.id == livroModel.id);
      if (index == -1) {
        meusLivros.add(livroModel);
      } else {
        meusLivros[index] =
            livroModel; 
      }
    });
  }

  void onDeletar(LivroModel livroModel) {
    setState(() {
      meusLivros.removeWhere((livro) => livro.id == livroModel.id);
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xfff1ef88),
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
                            color: Color(0xff498c9a),
                            fontSize: 26,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        IconButton(
                          color: Color(0xff498c9a),
                          icon: Icon(Icons.add),
                          onPressed: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (_) => FormularioLivroPage(
                                  onCadastrar: onCadastrar,
                                ),
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                  LinhaHorizontal(),
                  ListaLivros(
                    listaLivros: meusLivros,
                    onCadastrar: onCadastrar,
                    onDeletar: onDeletar,
                  ),
                  if (meusLivros.isNotEmpty) LinhaHorizontal(),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 38),
              child: VerticalDivider(
                color: Colors.red[200],
                thickness: 3,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
