import 'package:flutter/material.dart';
import 'package:api/model/api_brasil.dart';

class TelaPrincipal extends StatefulWidget {
  const TelaPrincipal({super.key});

  @override
  _TelaPrincipalState createState() => _TelaPrincipalState();
}

class _TelaPrincipalState extends State<TelaPrincipal> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Tela Principal"),
      ),
      body: Column(
        children: [
          FutureBuilder<List<String>>(
            future: ApiBrasil.getCidades('89010025'), // Use the desired CEP here
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
                List<String>? cities = snapshot.data;
                return Expanded(
                  flex: 9,
                  child: ListView.builder(
                    itemCount: cities!.length,
                    itemBuilder: (context, index) {
                      return Card(
                        child: ListTile(
                          title: Text(cities[index]),
                        ),
                      );
                    },
                  ),
                );
              }
            },
          ),
        ],
      ),
    );
  }
}
