import 'package:api/view/drawer.dart';
import 'package:flutter/material.dart';

class TelaDetalhesVeiculo extends StatelessWidget {
  final Map<String, dynamic> veiculo;

  TelaDetalhesVeiculo({Key? key, required this.veiculo}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(veiculo['modelo']),
        backgroundColor: Color.fromARGB(255, 74, 78, 105),
        foregroundColor: Colors.white,
      ),
      drawer: NavDrawer(),
      body: Container (
        width: double.infinity,
        color: const Color.fromARGB(255, 224, 225, 221),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
              RichText(
                text: TextSpan(
                 style: const TextStyle(fontSize: 20, color: Colors.black, height: 2.0),
                 children: <TextSpan>[
                    const TextSpan(
                      text: 'Código FIPE: ',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    TextSpan(
                      text: '${veiculo['codigoFipe']}\n',
                    ),
                    const TextSpan(
                      text: 'Valor: ',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    TextSpan(
                      text: '${veiculo['valor']}\n',
                    ),
                    const TextSpan(
                      text: 'Marca: ',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    TextSpan(
                      text: '${veiculo['marca']}\n',
                    ),
                    const TextSpan(
                      text: 'Modelo: ',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    TextSpan(
                      text: '${veiculo['modelo']}\n',
                    ),
                    const TextSpan(
                      text: 'Ano do modelo: ',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    TextSpan(
                      text: '${veiculo['anoModelo']}\n',
                    ),
                    const TextSpan(
                      text: 'Combustível: ',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    TextSpan(
                      text: '${veiculo['combustivel']}\n',
                    ),
                    const TextSpan(
                      text: 'Mês de referência: ',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    TextSpan(
                      text: '${veiculo['mesReferencia']}\n',
                    ),
                    const TextSpan(
                      text: 'Tipo de veículo: ',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    TextSpan(
                      text: '${veiculo['tipoVeiculo']}\n',
                    ),
                    const TextSpan(
                      text: 'Sigla combustível: ',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    TextSpan(
                      text: '${veiculo['siglaCombustivel']}\n',
                    ),
                    const TextSpan(
                      text: 'Data consulta: ',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    TextSpan(
                      text: '${veiculo['dataConsulta']}\n',
                    ),
                 ],
                ),
              ),
            ],
        ),
      ),
      ),
    );
  }
}
