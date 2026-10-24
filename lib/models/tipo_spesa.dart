class TipoSpesa {
  //Proprietà della classe
  final int idTipoSpesa;
  final String descrizione;

  //Costruttore principale generativo con parametri nominati obbligatori
  TipoSpesa({required this.idTipoSpesa, required this.descrizione,});

  // Costruttore factory per creare un'istanza partendo da una Map JSON
  factory TipoSpesa.fromJson(Map<String, dynamic> json) {
    return TipoSpesa(
      idTipoSpesa: json['idTipoSpesa'] as int,
      descrizione: json['descrizione'] as String,
    );
  }

  //Metodo per convertire l'oggetto in Map
  Map<String, dynamic> toJson() {
    return {
      'idTipoSpesa': idTipoSpesa,
      'descrizione': descrizione,
    };
  }
}