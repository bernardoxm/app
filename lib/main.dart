import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MenuItem {
  final String title;
  final IconData icon;

  MenuItem({required this.title, required this.icon});
}

class MyApp extends StatelessWidget {
  final List<MenuItem> menuItems = [
    MenuItem(title: 'Item 1', icon: Icons.star),
    MenuItem(title: 'Item 2', icon: Icons.camera),
    MenuItem(title: 'Item 3', icon: Icons.music_note),
 
  ];

  @override
  Widget build(BuildContext context) {
    
    return  MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Menu de Cards'),
        ),
        body: ListView.builder(
          itemCount: menuItems.length,
          itemBuilder: (context, index) {
            final menuItem = menuItems[index];
            return Card(
              elevation: 5,
              margin: EdgeInsets.all(8),
              child: ListTile(
                leading: Icon(menuItem.icon),
                title: Text(menuItem.title),
               trailing: LayoutBuilder(
  builder: (context, constraints) {
    double maxWidth = MediaQuery.of(context).size.width;
    return Container(      
      child: Wrap(
        crossAxisAlignment: WrapCrossAlignment.center,
        children: <Widget>[
          Text(
            'Alerta',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          if (constraints.maxWidth < maxWidth) // Verifica a largura da tela
            Icon(
              Icons.star,
              size: 24,
              color: Colors.blue,
            ),
        ],
      ),
    );
  },
),

                onTap: () {
                  print('Tocou em ${menuItem.title}');
                },
              ),
            );
          },
        ),
      ),
    );
  }
}
