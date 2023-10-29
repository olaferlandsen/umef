import 'package:flutter/material.dart';
import 'package:examen_final/models/proveedores.dart';

class ProviderFormProvider extends ChangeNotifier {
  GlobalKey<FormState> formKey = new GlobalKey<FormState>();
  Listado provider;
  ProviderFormProvider(this.provider);

  bool isValidForm() {
    return formKey.currentState?.validate() ?? false;
  }
}
