import 'package:api/model/db/banco.dart';

class ItemFavorito {
  String fipeCod;
  String nome;

  ItemFavorito({
    required this.fipeCod,
    required this.nome,
  });

  Future<int> removeFavorito() async {
    final db = await Banco.instance.database;
    return db.rawDelete("""
      DELETE FROM favorites WHERE fipeCod = '${this.fipeCod}'
    """);
  }

  Future<int> insereFavorito() async {
    final db = await Banco.instance.database;
    return db.rawInsert(
      """
      UPDATE OR INSERT INTO favorites(fipeCod, nome) VALUES('${this.fipeCod}', '${this.nome}')
      """);
  }

  static Future<List<ItemFavorito>> buscarTodosFavoritos() async {
    final db = await Banco.instance.database;
    final List<Map<String, dynamic>> maps = await db.query('favorites');

    return List.generate(maps.length, (i) {
      return ItemFavorito(
        fipeCod: maps[i]['fipeCod'],
        nome: maps[i]['nome'],
      );
    });
  }
}
