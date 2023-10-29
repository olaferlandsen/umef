import 'package:flutter/material.dart';
import 'package:examen_final/models/proveedores.dart';
import 'package:examen_final/services/proveedor_service.dart';
import 'package:examen_final/widgets/proveedor_item.dart';
import 'package:examen_final/screen/screen.dart';
import 'package:provider/provider.dart';

class ListProviderScreen extends StatelessWidget {
  const ListProviderScreen({super.key});
  @override
  Widget build(BuildContext context) {
    final providerService = Provider.of<ProviderService>(context);
    if (providerService.isLoading) return const LoadingScreen();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Proveedores'),
      ),
      body: ListView.builder(
        itemCount: providerService.providers.length,
        itemBuilder: (BuildContext context, index) => GestureDetector(
          onTap: () {
            providerService.SelectProvider =
                providerService.providers[index].copy();
            Navigator.pushNamed(context, 'providers/upsert');
          },
          child: ProviderListItem(proveedor: providerService.providers[index]),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        tooltip: "Crear Proveedor",
        onPressed: () {
          providerService.SelectProvider = Listado(
              providerId: 0,
              providerName: '',
              providerLastName: '',
              providerMail: '',
              providerState: '');
          Navigator.pushNamed(context, 'providers/upsert');
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
