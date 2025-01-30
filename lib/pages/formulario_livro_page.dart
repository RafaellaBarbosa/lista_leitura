import 'dart:math';

import 'package:flutter/material.dart';

import '../models/livro_model.dart';

class FormularioLivroPage extends StatefulWidget {
  const FormularioLivroPage({
    super.key,
    required this.onCadastrar,
    this.livro,
  });

  final Function(LivroModel) onCadastrar;
  final LivroModel? livro;

  @override
  State<FormularioLivroPage> createState() => _FormularioLivroPageState();
}

class _FormularioLivroPageState extends State<FormularioLivroPage> {
  final formKey = GlobalKey<FormState>();
  late TextEditingController tituloController;
  late TextEditingController descricaoController;
  bool lido = false;
  late LivroModel livro;

  @override
  void initState() {
    livro = widget.livro ?? LivroModel(id: Random().nextInt(255));
    tituloController = TextEditingController(text: livro.titulo);
    descricaoController = TextEditingController(text: livro.descricao);
    lido = livro.lido;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(
        0xfff1ef88,
      ),
      body: SafeArea(
        child: Form(
          key: formKey,
          child: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                    top: 80,
                    left: 10,
                  ),
                  child: Text(
                    'Inclua seu novo livro',
                    style: TextStyle(
                      color: Color(
                        0xff498c9a,
                      ),
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(22.0),
                  child: TextFormField(
                    controller: tituloController,
                    keyboardType: TextInputType.text,
                    textInputAction: TextInputAction.next,
                    decoration: InputDecoration(
                      hintText: 'Título',
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Por favor, insira um título';
                      }
                      return null;
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(22.0),
                  child: TextFormField(
                    controller: descricaoController,
                    keyboardType: TextInputType.multiline,
                    textInputAction: TextInputAction.done,
                    decoration: InputDecoration(
                      labelText: 'Descrição',
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Por favor, insira uma descrição';
                      }
                      return null;
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: CheckboxListTile(
                    title: Text('Já li este livro:'),
                    value: lido,
                    onChanged: (value) {
                      setState(() {
                        lido = value ?? true;
                      });
                    },
                  ),
                ),
                ElevatedButton(
                  style: ButtonStyle(
                    padding: WidgetStatePropertyAll(EdgeInsets.all(10)),
                    backgroundColor:
                        WidgetStatePropertyAll(Color.fromRGBO(230, 127, 34, 1)),
                    shape: WidgetStateProperty.all(RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    )),
                  ),
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      livro = LivroModel(
                        titulo: tituloController.text,
                        descricao: descricaoController.text,
                        lido: lido,
                      );
                      widget.onCadastrar(livro);
                      Navigator.of(context).pop();
                    }
                  },
                  child: Text(
                    'Salvar',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 28,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
