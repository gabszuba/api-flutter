import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiBrasil {
  static Future<List<dynamic>> getVeiculo (String codigoFipe) async {
    final response = await http.get(
      Uri.parse('https://brasilapi.com.br/api/fipe/preco/v1/$codigoFipe'),
      headers: {'Content-Type': 'application/json'},
    );

    if (response.statusCode == 200) {
      List<dynamic> data = json.decode(response.body);
      print(data);
      return data;
      } else {
      throw Exception('Erro ao obter o veículo.');
    }
  }
}
