import 'package:flutter/material.dart';

class DrawerWidget extends StatelessWidget {
  Widget _createListItem({IconData icon, String label, Function onTap}) {
    return ListTile(
      leading: Icon(
        icon,
        size: 26,
      ),
      title: Text(
        label,
        style: TextStyle(
          fontFamily: 'RobotoCondensed',
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
      ),
      onTap: onTap,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            height: 120,
            width: double.infinity,
            padding: EdgeInsets.all(20),
            color: Theme.of(context).accentColor,
            alignment: Alignment.bottomCenter,
            child: Text(
              'Vamos Cozinhar?',
              style: TextStyle(
                fontWeight: FontWeight.w900,
                fontSize: 30,
                color: Theme.of(context).primaryColor,
              ),
            ),
          ),
          SizedBox(height: 20),
          _createListItem(
            icon: Icons.restaurant,
            label: 'Refeições',
            onTap: () => Navigator.of(context).pushReplacementNamed('/home'),
          ),
          _createListItem(
            icon: Icons.settings,
            label: 'Configurações',
            onTap: () => Navigator.of(context).pushNamed('/settings'),
          ), 
        ],
      ),
    );
  }
}
