import 'package:api/model/favorito.dart';
import 'package:api/view/drawer.dart';
import 'package:api/view/tela_consulta.dart';
import 'package:flutter/material.dart';

class TelaFavoritos extends StatefulWidget {
  const TelaFavoritos({Key? key}) : super(key: key);

  @override
  _TelaFavoritosState createState() => _TelaFavoritosState();
}

class _TelaFavoritosState extends State<TelaFavoritos> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Favoritos"),
        backgroundColor: const Color.fromARGB(255, 74, 78, 105),
        foregroundColor: const Color.fromARGB(255, 255, 255, 255),
      ),
      drawer: NavDrawer(),
      body: Column(
        children: [
          FutureBuilder<List<ItemFavorito>>(
            future: ItemFavorito.buscarTodosFavoritos(),
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
                List<ItemFavorito>? favorites = snapshot.data;
                return Expanded(
                  flex: 9,
                  child: ListView.builder(
                    itemCount: favorites!.length,
                    itemBuilder: (context, index) {
                      var favorite = favorites[index];
                      return GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => TelaConsulta(fipeCod: favorite.fipeCod),
                            ),
                          );
                        },
                        child: Card(
                          child: ListTile(
                            title: Text(favorite.nome),
                            subtitle: Text(favorite.fipeCod),
                            trailing: IconButton (
                              icon: Icon(Icons.delete_rounded, color: Color.fromARGB(255, 175, 47, 38), size: 30.0,),
                              onPressed: () {
                                favorite.removeFavorito().then((value) {
                                  if (value > 0) {
                                    const snackBar = SnackBar(
                                      content: Text('Item removido', style: TextStyle(color: Colors.white)),
                                      backgroundColor: Color.fromARGB(255, 74, 78, 105),
                                    );
                                    ScaffoldMessenger.of(context).showSnackBar(snackBar);
                                  }
                                }
                                );
                                setState(() {});
                              },
                            ),
                            tileColor: const Color.fromARGB(255, 222, 222, 231),
                          ),
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
