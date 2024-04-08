import 'package:api/view/tela_consulta.dart';
import 'package:api/view/tela_favoritos.dart';
import 'package:api/view/tela_principal.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const Main());
}

class Main extends StatelessWidget {
  const Main({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Consumo de api",
      initialRoute: '/home',
      routes: {
        '/home': (context) => const TelaPrincipal(),
        '/favoritos': (context) => const TelaFavoritos(),
      },
    );
  }
}
