class Pais {
  int id;
  String nomPais;

  Pais({this.id, this.nomPais});

  Pais.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nomPais = json['nomPais'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['nomPais'] = this.nomPais;
    return data;
  }
}
