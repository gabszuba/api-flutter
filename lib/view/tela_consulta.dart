import 'package:api/model/favorito.dart';
import 'package:api/view/drawer.dart';
import 'package:api/view/tela_detalhes.dart';
import 'package:flutter/material.dart';
import 'package:api/model/api_brasil.dart';

class TelaConsulta extends StatefulWidget {
  const TelaConsulta({super.key, required this.fipeCod});
  final String fipeCod;

  @override
  _TelaConsultaState createState() => _TelaConsultaState();
}

class _TelaConsultaState extends State<TelaConsulta> {
  @override
  Widget build(BuildContext context) {
    bool standardSelected = false;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Resultados da pesquisa"),
        backgroundColor: Color.fromARGB(255, 74, 78, 105),
        foregroundColor: Colors.white,
        actions: <Widget>[
          IconButton(
            isSelected: standardSelected,
            icon: Icon(Icons.favorite_border),
            selectedIcon: Icon(Icons.favorite),
            onPressed: () {
              setState(() {
                standardSelected = !standardSelected;
              });
            },
          ),
        ],
      ),
      drawer: NavDrawer(),
      body: Column(
        children: [
          FutureBuilder<List<dynamic>>(
            future: ApiBrasil.getVeiculo(widget.fipeCod),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Expanded(
                  flex: 9,
                  child: Center(child: CircularProgressIndicator()),
                );
              } else if (snapshot.hasError) {
                return Expanded(
                  flex: 9,
                  child: Center(child: Text('Error: ${snapshot.error}')),
                );
              } else {
                List<dynamic>? veiculos = snapshot.data;
                return Expanded(
                    flex: 9,
                    child: ListView.builder(
                      itemCount: veiculos!.length,
                      itemBuilder: (context, index) {
                        var veiculo = veiculos[index];
                        
                        return GestureDetector(
                          onTap: () {
                            ItemFavorito novoFavorito = ItemFavorito(fipeCod: veiculo['codigoFipe'], nome: veiculo['modelo']);
                            novoFavorito.insereFavorito().then((value) {
                              if (value > 0) print('Adicionado com sucesso');
                            });
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    TelaDetalhesVeiculo(veiculo: veiculo),
                              ),
                            );
                          },
                          child: Card(
                            child: ListTile(
                              title: Text(veiculo['modelo']),
                              subtitle: Text(
                                  'Valor: ${veiculo['valor']}; Ano: ${veiculo['anoModelo']}'),
                              tileColor: Color.fromARGB(255, 222, 222, 231),
                            ),
                          ),
                        );
                      },
                    ));
              }
            },
          )
        ],
      ),
    );
  }
}
