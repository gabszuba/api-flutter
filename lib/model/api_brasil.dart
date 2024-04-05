import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiBrasil {
  static Future<List<String>> getCidades(String cep) async {
    final response = await http.get(
      Uri.parse('https://brasilapi.com.br/api/cep/v1/$cep'),
      headers: {'Content-Type': 'application/json'},
    );

    if (response.statusCode == 200) {
      Map<String, dynamic> data = json.decode(response.body);
      print(data);
      String city = data['city'];
      return [city];
    } else {
      throw Exception('Erro ao obter a localização do CEP.');
    }
  }
}
