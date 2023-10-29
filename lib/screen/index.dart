import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(centerTitle: true, title: const Text('Modulos')),
      body: Center(
          child: ListView(
        shrinkWrap: true,
        children: const [
          CardWidget(
            backgroundColor: Colors.blue,
            icon: Icons.sell,
            text: 'Categorias',
            route: "categories",
          ),
          CardWidget(
            backgroundColor: Colors.lightGreen,
            icon: Icons.qr_code_scanner,
            text: 'Productos',
            route: "products",
          ),
          CardWidget(
              backgroundColor: Colors.orange,
              icon: Icons.local_convenience_store,
              text: 'Proveedores',
              route: 'providers')
        ],
      )),
    );
  }
}

class CardWidget extends StatelessWidget {
  final Color backgroundColor;
  final IconData icon;
  final String text;
  final String route;

  const CardWidget({
    super.key,
    required this.backgroundColor,
    required this.icon,
    required this.text,
    required this.route,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () => Navigator.pushNamed(context, route),
        child: Card(
          color: backgroundColor,
          elevation: 5.0,
          margin: const EdgeInsets.all(16.0),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  icon,
                  size: 60,
                  color: Colors.white,
                ),
                const SizedBox(height: 10),
                Text(
                  text,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
