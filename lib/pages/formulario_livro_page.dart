import 'package:flutter/material.dart';

import '../models/livro_model.dart';

class FormularioLivroPage extends StatefulWidget {
  const FormularioLivroPage({super.key});

  @override
  State<FormularioLivroPage> createState() => _FormularioLivroPageState();
}

class _FormularioLivroPageState extends State<FormularioLivroPage> {
  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    final tituloController = TextEditingController();
    final descricaoController = TextEditingController();
    bool lido = false;

    return Scaffold(
        backgroundColor: Color(
          0xfff1ef88,
        ),
        body: SafeArea(
            child: Form(
          child: Column(
            children: [
              TextFormField(
                controller: tituloController,
                decoration: InputDecoration(
                  labelText: 'Título',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Por favor, insira um título';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16),
              TextFormField(
                controller: descricaoController,
                decoration: InputDecoration(
                  labelText: 'Descrição',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Por favor, insira uma descrição';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16),
              Row(
                children: [
                  Text('Lido:'),
                  Switch(
                    value: lido,
                    onChanged: (value) {
                      setState(() {
                        lido = value;
                      });
                    },
                  ),
                ],
              ),
              SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    LivroModel livro = LivroModel(
                      titulo: tituloController.text,
                      descricao: descricaoController.text,
                      lido: lido,
                    );
                    print(livro);
                  }
                },
                child: Text('Salvar'),
              ),
            ],
          ),
        )));
  }
}
