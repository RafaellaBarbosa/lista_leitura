import 'package:flutter/material.dart';
import 'package:lista_leitura/pages/formulario_livro_page.dart';
import 'package:lista_leitura/pages/lista_livros_page.dart';

class AppRoutes {
  static const String home = '/';
  static const String formularioLivro = '/formulario_livro';

  static Map<String, WidgetBuilder> get rotas {
    return {
      home: (context) => ListaLivrosPage(),
      formularioLivro: (context) => FormularioLivroPage()
    };
  }
}
