import 'package:examen_final/screen/upsert_category.dart';
import 'package:examen_final/screen/lista_categorias.dart';
import 'package:examen_final/screen/index.dart';
import 'package:examen_final/screen/upsert_proveedor.dart';
import 'package:examen_final/screen/lista_proveedores.dart';
import 'package:flutter/material.dart';
import 'package:examen_final/screen/screen.dart';

class AppRoutes {
  static const initialRoute = 'login';
  static Map<String, Widget Function(BuildContext)> routes = {
    'index': (BuildContext context) => const HomePage(),
    'login': (BuildContext context) => const LoginScreen(),

    'products': (BuildContext context) => const ListProductScreen(),
    'products/upsert': (BuildContext context) => const EditProductScreen(),

    'categories': (BuildContext context) => const ListCategoryScreen(),
    'categories/upsert': (BuildContext context) => const EditCategoryScreen(),

    'providers': (BuildContext context) => const ListProviderScreen(),
    'providers/upsert': (BuildContext context) => const UpsertProveedor(),

    'add_user': (BuildContext context) => const RegisterUserScreen(),
  };

  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    return MaterialPageRoute(
      builder: (context) => const ErrorScreen(),
    );
  }
}
