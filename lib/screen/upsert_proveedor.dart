import 'package:examen_final/providers/provider_form_provider.dart';
import 'package:examen_final/services/proveedor_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../ui/input_decorations.dart';

class UpsertProveedor extends StatelessWidget {
  const UpsertProveedor({super.key});

  @override
  Widget build(BuildContext context) {
    final providerService = Provider.of<ProviderService>(context);
    return ChangeNotifierProvider(
        create: (_) => ProviderFormProvider(providerService.SelectProvider!),
        child: _ProviderScreenBody(
          providerService: providerService,
        ));
  }
}

class _ProviderScreenBody extends StatelessWidget {
  const _ProviderScreenBody({
    Key? key,
    required this.providerService,
  }) : super(key: key);

  final ProviderService providerService;
  @override
  Widget build(BuildContext context) {
    final providerForm = Provider.of<ProviderFormProvider>(context);
    final isUpdating = providerForm.provider.providerId == 0;

    List<Widget> actionsButtons = [
      FloatingActionButton(
        onPressed: () async {
          if (!providerForm.isValidForm()) return;
          await providerService.deleteProvider(providerForm.provider, context);
        },
        heroTag: null,
        tooltip: "Eliminar",
        child: const Icon(Icons.delete_forever),
      ),
      const SizedBox(width: 20)
    ];
    if (isUpdating) {
      actionsButtons.clear();
    }

    actionsButtons.add(FloatingActionButton(
        onPressed: () async {
          if (!providerForm.isValidForm()) return;
          await providerService.editOrCreateProvider(providerForm.provider);
        },
        heroTag: null,
        tooltip: "Guardar cambios",
        child: const Icon(Icons.save)));

    return Scaffold(
      appBar: AppBar(
        title: Text(!isUpdating ? "Editar Proveedor" : 'Crear proveedor'),
      ),
      body: SingleChildScrollView(
        child: Column(children: [
          _ProviderForm(),
        ]),
      ),
      floatingActionButton: Row(
          mainAxisAlignment: MainAxisAlignment.end, children: actionsButtons),
    );
  }
}

class _ProviderForm extends StatefulWidget {
  @override
  _ProviderFormState createState() => _ProviderFormState();
}

class _ProviderFormState extends State<_ProviderForm> {
  bool sv = false;

  @override
  Widget build(BuildContext context) {
    final providerForm = Provider.of<ProviderFormProvider>(context);
    final proveedor = providerForm.provider;
    setState(() {
      sv = proveedor.providerState == "Activa";
    });
    return Form(
      key: providerForm.formKey,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      child: Column(
        children: [
          TextFormField(
            initialValue: proveedor.providerName,
            onChanged: (v) => proveedor.providerName = v,
            validator: (value) =>
                (value == null || value.isEmpty) ? 'Nombre Requerido' : null,
            decoration: InputDecortions.authInputDecoration(
              hinText: 'Nombre',
              labelText: 'Nombre',
            ),
          ),
          const SizedBox(height: 20),
          TextFormField(
            initialValue: proveedor.providerLastName,
            onChanged: (value) => proveedor.providerLastName = value,
            validator: (value) =>
                (value == null || value.isEmpty) ? 'Apellido Requerido' : null,
            decoration: InputDecortions.authInputDecoration(
              hinText: 'Apellido',
              labelText: 'Apellido',
            ),
          ),
          const SizedBox(height: 20),
          TextFormField(
            keyboardType: TextInputType.emailAddress,
            initialValue: proveedor.providerMail,
            onChanged: (value) => proveedor.providerMail = value,
            validator: (value) =>
                (value == null || value.isEmpty) ? 'Email Requerido' : null,
            decoration: InputDecortions.authInputDecoration(
              hinText: 'Email',
              labelText: 'Email',
            ),
          ),
          const SizedBox(height: 20),
          SwitchListTile.adaptive(
            value: sv,
            onChanged: (v) {
              proveedor.providerState = v ? "Activa" : "bloqueada";
              setState(() {
                sv = v;
              });
            },
            activeColor: Colors.orange,
            title: const Text('Disponible'),
          )
        ],
      ),
    );
  }
}
