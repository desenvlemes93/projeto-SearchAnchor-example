import 'package:flutter/material.dart';
import 'package:search_projeto_example/src/model/pessoa.dart';

class SeachControllerPage extends StatefulWidget {
  const SeachControllerPage({super.key});

  @override
  State<SeachControllerPage> createState() => _SeachControllerPageState();
}

class _SeachControllerPageState extends State<SeachControllerPage> {
  var listPessoaVM = ValueNotifier<List<Pessoa>>([]);

  var listaPessoas = [
    Pessoa(nome: 'Ricardo VM'),
    Pessoa(nome: 'Bento'),
    Pessoa(nome: 'Julia'),
    Pessoa(nome: 'Theo VM'),
    Pessoa(nome: 'Lucas'),
    Pessoa(nome: 'Danilo'),
    Pessoa(nome: 'Maria VX'),
  ];
  List<Pessoa> listaFiltrada = [];

  String nomeSelecionado = '';
  @override
  void initState() {
    listPessoaVM.value = listaPessoas;
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
                scrollPadding: EdgeInsets.all(60),
                onSubmitted: (value) {
                  nomeSelecionado = value;
                },
                barBackgroundColor: WidgetStatePropertyAll(Colors.white),
                barHintText: 'Search',

                barShape: WidgetStateProperty.all(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                suggestionsBuilder: (context, listPessoaVM) {
                  final String input = listPessoaVM.value.text;
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
                      child: Center(
                        child: Text(
                          filtered.nome,
                          style: TextStyle(
                            fontSize: 22,
                            color: Colors.grey.shade700,
                          ),
                        ),
                      ),

                      onTap: () {
                        if (filtered.nome.isEmpty) {
                          nomeSelecionado = '';
                          listPessoaVM.openView();
                        } else {
                          nomeSelecionado = filtered.nome;
                          listPessoaVM.closeView(filtered.nome);
                        }
                      },
                    ),
                  );
                },
              ),

              Expanded(
                child: ValueListenableBuilder(
                  valueListenable: listPessoaVM,
                  builder: (_, listPessoaVMValue, _) {
                    return ListView.builder(
                      itemCount:
                          listPessoaVMValue.length, // Exibe itens filtrados
                      itemBuilder: (context, index) {
                        var pessoa =
                            listPessoaVMValue[index]; // Acesse a lista filtrada

                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            pessoa.nome,
                            style: TextStyle(fontSize: 30, color: Colors.black),
                          ),
                        );
                      },
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
