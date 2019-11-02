import 'package:flutter/material.dart';
import 'package:flutter_rfv2/routes/routes.dart';

class AppDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          _createHeader(),
          _createDrawerItem(
              icon: Icons.contacts,
              text: 'Products',
              onTap: () => Navigator.pushReplacementNamed(context, Routes.products) 
              ),
          _createDrawerItem(
              icon: Icons.event,
              text: 'Ofertas',
              //onTap: () => Navigator.pushReplacementNamed(context, Routes.events)
                  ),
          _createDrawerItem(
              icon: Icons.note,
              text: 'Pedidos',
              //onTap: () => Navigator.pushReplacementNamed(context, Routes.notes)
              ),
          Divider(),       
          _createDrawerItem(icon: Icons.help, text: 'Ayuda'),
          Divider(),
          _createDrawerItem(icon: Icons.bug_report, text: 'Report an issue'),
          ListTile(
            title: Text('0.0.1'),
            onTap: () {},
          ),
        ],
      ),
    );
  }

  Widget _createHeader() {
    return UserAccountsDrawerHeader(
              accountEmail: Text('richar.fernandeza@unmsm.edu.pe'),
              accountName: Text('Richar Fernández'),
              currentAccountPicture: CircleAvatar(
                backgroundColor: Colors.black38,
              ),
            );
  }

  Widget _createDrawerItem(
      {IconData icon, String text, GestureTapCallback onTap}) {
    return ListTile(
      title: Row(
        children: <Widget>[
          Icon(icon),
          Padding(
            padding: EdgeInsets.only(left: 8.0),
            child: Text(text),
          )
        ],
      ),
      onTap: onTap,
    );
  }
}
