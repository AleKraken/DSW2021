class Interes {
  int id;
  String nomInteres;

  Interes(
    this.id,
    this.nomInteres,
  );

  Interes.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nomInteres = json['nomInteres'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['nomInteres'] = this.nomInteres;
    return data;
  }
}

class InteresUsuario {
  int id;
  String idUsuario;
  String idInteres;

  InteresUsuario({this.id, this.idUsuario, this.idInteres});

  InteresUsuario.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    idUsuario = json['idUsuario'];
    idInteres = json['idInteres'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['idUsuario'] = this.idUsuario;
    data['idInteres'] = this.idInteres;
    return data;
  }
}
