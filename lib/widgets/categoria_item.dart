import 'package:flutter/material.dart';
import 'package:examen_final/models/categories.dart';

class CategoriaListItem extends StatelessWidget {
  final Listado categoria;
  const CategoriaListItem({Key? key, required this.categoria}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(categoria.categoryName),
      subtitle: Text("Estado: ${categoria.categoryState}"),
    );
  }
}

