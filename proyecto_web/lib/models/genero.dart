class Genero {
  int id;
  String nomGenero;

  Genero({this.id, this.nomGenero});

  Genero.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nomGenero = json['nomGenero'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['nomGenero'] = this.nomGenero;
    return data;
  }
}
