import 'package:flutter/material.dart';
import 'package:examen_final/models/proveedores.dart';

class ProviderListItem extends StatelessWidget {
  final Listado proveedor;
  const ProviderListItem({Key? key, required this.proveedor}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text("${proveedor.providerName} ${proveedor.providerLastName}"),
      subtitle: Text("Estado: ${proveedor.providerState}"),
    );
  }
}
