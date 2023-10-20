import 'package:day_night_switcher/day_night_switcher.dart';
import 'package:flutter/material.dart';
import 'package:pmsn20232/assets/global_values.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DashboardScreen extends StatelessWidget {
  DashboardScreen({super.key});

  Future<void> recuerdame(flag) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('recordar', flag);
  }

  Future<void> dianoche(flag) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('modo', flag);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bienvenidos :)'),
      ),
      drawer: createDrawer(context),
    );
  }

  Widget createDrawer(context) {
    return Drawer(
      child: ListView(
        children: [
          const UserAccountsDrawerHeader(
              currentAccountPicture: CircleAvatar(
                backgroundImage: NetworkImage('https://i.pravatar.cc/300'),
              ),
              accountName: Text('Rubensin Torres Frias'),
              accountEmail: Text('isctorres@gmail.com')),
          ListTile(
            leading: Image.network(
                'https://cdn3.iconfinder.com/data/icons/street-food-and-food-trucker-1/64/fruit-organic-plant-orange-vitamin-64.png'),
            //leading: Image.asset('assets/naranja.png'),
            trailing: Icon(Icons.chevron_right),
            title: Text('FruitApp'),
            subtitle: Text('Carrusel'),
            onTap: () {},
          ),
          ListTile(
            leading: Icon(Icons.task_alt_outlined),
            trailing: Icon(Icons.chevron_right),
            title: Text('Practica 2'),
            onTap: () => Navigator.pushNamed(context, '/fruit'),
          ),
          ListTile(
            leading: Icon(Icons.task_alt_outlined),
            trailing: Icon(Icons.chevron_right),
            title: Text('Task Manager'),
            onTap: () => Navigator.pushNamed(context, '/task'),
          ),
          ListTile(
            leading: Icon(Icons.task_alt_outlined),
            trailing: Icon(Icons.chevron_right),
            title: Text('Popular'),
            onTap: () => Navigator.pushNamed(context, '/popular'),
          ),
          ListTile(
            leading: Icon(Icons.task_alt_outlined),
            trailing: Icon(Icons.chevron_right),
            title: Text('Test Provider'),
            onTap: () => Navigator.pushNamed(context, '/prov'),
          ),
          DayNightSwitcher(
            isDarkModeEnabled: GlobalValues.flagTheme.value,
            onStateChanged: (isDarkModeEnabled) {
              GlobalValues.flagTheme.value = isDarkModeEnabled;
              dianoche(isDarkModeEnabled);
            },
          ),
          ListTile(
            leading: Icon(Icons.task_alt_outlined),
            trailing: Icon(Icons.chevron_right),
            title: Text('Cerrar Sesion'),
            onTap: () {
              recuerdame(false);
              Navigator.pushNamed(
                context,
                '/login',
              );
            },
          ),
        ],
      ),
    );
  }
}
