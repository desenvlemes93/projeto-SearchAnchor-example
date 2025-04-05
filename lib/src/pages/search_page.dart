// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/material.dart';
import 'package:search_projeto_example/src/model/pessoa.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  var listaPessoas = [
    Pessoa(nome: 'Ricardo'),
    Pessoa(nome: 'Bento'),
    Pessoa(nome: 'Julia'),
    Pessoa(nome: 'Theo'),
    Pessoa(nome: 'Lucas'),
    Pessoa(nome: 'Danilo'),
    Pessoa(nome: 'Maria'),
  ];
  List<Pessoa> listaFiltrada = [];
  String nomeSelecionado = '';

  @override
  void initState() {
    listaFiltrada = listaPessoas;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('SearchAnchor Example')),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            spacing: 60,
            children: [
              SearchAnchor.bar(
                barBackgroundColor: WidgetStatePropertyAll(Colors.white),
                barHintText: 'Search',

                barShape: WidgetStateProperty.all(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                suggestionsBuilder: (context, controller) {
                  final String input = controller.value.text;
                  // Filtra a lista conforme o texto digitado
                  setState(() {
                    listaFiltrada =
                        listaPessoas
                            .where(
                              (item) => item.nome.toLowerCase().contains(
                                input.toLowerCase(),
                              ),
                            )
                            .toList();
                  });
                  return listaFiltrada.map(
                    (filtered) => InkWell(
                      child: Text(
                        filtered.nome,
                        style: TextStyle(fontSize: 36),
                      ),

                      onTap: () {
                        if (filtered.nome.isEmpty) {
                          nomeSelecionado = '';
                          controller.openView();
                        } else {
                          nomeSelecionado = filtered.nome;
                          controller.closeView(filtered.nome);
                        }
                      },
                    ),
                  );
                },
              ),

              // Lista filtrada com base no texto da pesquisa
              Expanded(
                child: ListView.builder(
                  itemCount: listaFiltrada.length, // Exibe itens filtrados
                  itemBuilder: (context, index) {
                    var pessoa =
                        listaFiltrada[index]; // Acesse a lista filtrada

                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        pessoa.nome,
                        style: TextStyle(fontSize: 30, color: Colors.red),
                      ),
                    );
                  },
                ),
              ),
              nomeSelecionado.isNotEmpty
                  ? Text('O nome selecionado foi  $nomeSelecionado')
                  : Text('Nenhum nome foi selecionado'),
            ],
          ),
        ),
      ),
    );
  }
}
