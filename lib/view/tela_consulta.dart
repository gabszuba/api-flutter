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
  bool standardSelected = false;
  Map<String, dynamic>? selectedVehicle;

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
        title: const Text("Resultados da pesquisa"),
        backgroundColor: Color.fromARGB(255, 74, 78, 105),
        foregroundColor: Colors.white,
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
                  child: Center(child: Text('${snapshot.error}')),
                );
              } else {
                List<dynamic>? veiculos = snapshot.data;
                return Expanded(
                    flex: 9,
                    child: ListView.builder(
                      itemCount: veiculos!.length,
                      itemBuilder: (context, index) {
                        var veiculo = veiculos[index];
                        selectedVehicle = veiculo;
                        
                        return GestureDetector(
                          onTap: () {
                            
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
      floatingActionButton: IconButton(
        isSelected: standardSelected,
        icon: Icon(Icons.favorite_border),
        selectedIcon: Icon(Icons.favorite),
        onPressed: () {
          if(selectedVehicle != null) {
            setState(() {
              standardSelected = !standardSelected;
            });
            ItemFavorito novoFavorito = ItemFavorito(fipeCod: selectedVehicle!['codigoFipe'], nome: selectedVehicle!['modelo']);
              novoFavorito.insereFavorito().then((value) {
                if (value > 0) {
                  const snackBar = SnackBar(
                    content: Text('Adicionado aos favoritos', style: TextStyle(color: Colors.white)),
                    backgroundColor: Color.fromARGB(255, 74, 78, 105),
                  );
                  ScaffoldMessenger.of(context).showSnackBar(snackBar);
                }
              });
          }
        },
      ),
    );
  }
}
