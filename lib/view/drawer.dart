import 'package:flutter/material.dart';

class NavDrawer extends StatelessWidget {
  const NavDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          const UserAccountsDrawerHeader(
            decoration: BoxDecoration(color: Color.fromARGB(255, 74, 78, 105),),
            accountName: Text(
              "Gabrielle Zuba",
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            accountEmail: Text(
              "email@gmail.com",
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            currentAccountPicture: FlutterLogo(),
          ),
          ListTile(
            leading: const Icon(Icons.search),
            title: const Text('Buscar'),
            onTap: () {
              Navigator.popUntil(context, ModalRoute.withName('/home'));
            },
          ),
          ListTile(
            leading: const Icon(Icons.favorite),
            title: const Text('Favoritos'),
            onTap: () {
              Navigator.pushNamed(context, '/favoritos');
            },
          ),
        const AboutListTile( // <-- SEE HERE
          icon: Icon(
            Icons.info,
          ),
          child: Text('Sobre'),
          applicationIcon: Icon(
            Icons.local_play,
          ),
          applicationName: 'Busca FIPE',
          applicationVersion: '1.0',
          applicationLegalese: '© 2024 Zuba&Fernandes',
        ),
        ],
      ),
    );
  }
}
