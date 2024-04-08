import 'package:api/view/drawer.dart';
import 'package:api/view/tela_consulta.dart';
import 'package:flutter/material.dart';

class TelaPrincipal extends StatefulWidget {
  const TelaPrincipal({super.key});

  @override
  State<TelaPrincipal> createState() => _TelaPrincipalState();
}

class _TelaPrincipalState extends State<TelaPrincipal> {
  final TextEditingController _textField = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home"),
        backgroundColor: Color.fromARGB(255, 74, 78, 105),
        foregroundColor: Colors.white,
      ),
      drawer: NavDrawer(),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 35.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Image(
              image: AssetImage('assets/images/subaru.png'),
              fit: BoxFit.contain,
            ),
            const SizedBox(height: 20),
            TextField(
              controller: _textField,
              decoration: InputDecoration(
                hintText: 'Pesquise pelo código do veículo...',
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 74, 78, 105),
                    foregroundColor: Colors.white,
                    textStyle: const TextStyle(
                        fontSize: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    minimumSize: const Size(120, 40),
                  ),
              onPressed: () {
                String textValue = _textField.text;
                Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => TelaConsulta(fipeCod: textValue),
                ),
                );
              },
              child: const Text('Consultar'),
            ),
          ],
        ),
      ),
    );
  }
}
