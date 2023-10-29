import 'package:flutter/material.dart';
import 'package:examen_final/models/categories.dart';
import 'package:examen_final/services/category_service.dart';
import 'package:examen_final/widgets/categoria_item.dart';
import 'package:provider/provider.dart';
import 'package:examen_final/screen/screen.dart';

class ListCategoryScreen extends StatelessWidget {
  const ListCategoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final categoryService = Provider.of<CategoryService>(context);
    if (categoryService.isLoading) return const LoadingScreen();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Categorias'),
      ),
      body: ListView.builder(
        itemCount: categoryService.categories.length,
        itemBuilder: (BuildContext context, index) => GestureDetector(
          onTap: () {
            categoryService.SelectCategory =
                categoryService.categories[index].copy();
            Navigator.pushNamed(context, 'categories/upsert');
          },
          child: CategoriaListItem(categoria: categoryService.categories[index]),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        tooltip: "Crear Categoria",
        onPressed: () {
          categoryService.SelectCategory =
              Listado(categoryId: 0, categoryName: '', categoryState: '');
          Navigator.pushNamed(context, 'categories/upsert');
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
