import 'dart:ui';

import 'package:api/view/drawer.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

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
      body: Container(
        width: double.infinity,
        color: Color.fromARGB(255, 240, 244, 245),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              RichText(
                text: TextSpan(
                  style: const TextStyle(
                      fontSize: 20, color: Colors.black, height: 2.0),
                  children: <TextSpan>[
                    _buildTextSpanWithIcon(
                        ' ', veiculo['valor'],
                        color: Color.fromARGB(255, 74, 78, 105), fontSize: 26, fontWeight: FontWeight.bold),
                    _buildTextSpanWithIcon('Código FIPE: ',
                        veiculo['codigoFipe']),
                    _buildTextSpanWithIcon(
                        'Marca: ', veiculo['marca']),
                    _buildTextSpanWithIcon(
                        'Modelo: ', veiculo['modelo']),
                    _buildTextSpanWithIcon(
                        'Ano do modelo: ', veiculo['anoModelo']),
                    _buildTextSpanWithIcon(
                        'Combustível: ', veiculo['combustivel']),
                    _buildTextSpanWithIcon(
                        'Mês de referência: ', veiculo['mesReferencia']),
                    _buildTextSpanWithIcon(
                        'Tipo de veículo: ', veiculo['tipoVeiculo']),
                    _buildTextSpanWithIcon(
                        'Sigla combustível: ', veiculo['siglaCombustivel']),
                    _buildTextSpanWithIcon(
                        'Data consulta: ', veiculo['dataConsulta']),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  TextSpan _buildTextSpanWithIcon(String label, dynamic value, 
      {Color color = Colors.black, FontWeight fontWeight = FontWeight.normal, double fontSize = 20}) {
    return TextSpan(
      children: [
        const TextSpan(
          text: ' ',
        ),
        TextSpan(
          text: '$label$value\n',
          style: TextStyle(color: color, fontSize: fontSize, fontWeight: fontWeight),
        ),
      ],
    );
  }
}
