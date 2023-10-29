import 'dart:convert';

class Proveedor {
  Proveedor({
    required this.listado,
  });

  List<Listado> listado;

  factory Proveedor.fromJson(String str) => Proveedor.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Proveedor.fromMap(Map<String, dynamic> json) => Proveedor(
        listado:
            List<Listado>.from(json["Proveedores Listado"].map((x) => Listado.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "Proveedores Listado": List<dynamic>.from(listado.map((x) => x.toMap())),
      };
}

class Listado {
  Listado({
    required this.providerId,
    required this.providerName,
    required this.providerLastName,
    required this.providerMail,
    required this.providerState,
  });

  int providerId;
  String providerName;
  String providerLastName;
  String providerMail;
  String providerState;

  factory Listado.fromJson(String str) => Listado.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Listado.fromMap(Map<String, dynamic> json) => Listado(
        providerId: json["providerid"],
        providerName: json["provider_name"],
        providerLastName: json["provider_last_name"],
        providerMail: json["provider_mail"],
        providerState: json["provider_state"],
      );

  Map<String, dynamic> toMap() => {
        "provider_id": providerId,
        "provider_name": providerName,
        "provider_last_name": providerLastName,
        "provider_mail": providerMail,
        "provider_state": providerState,
      };

  Listado copy() => Listado(
      providerId: providerId,
      providerName: providerName,
      providerLastName: providerLastName,
      providerMail: providerMail,
      providerState: providerState);
}
