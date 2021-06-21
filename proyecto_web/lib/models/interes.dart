class Interes {
  int id;
  String nomInteres;

  Interes({this.id, this.nomInteres});

  Interes.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nomInteres = json['nomPais'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['nomPais'] = this.nomInteres;
    return data;
  }
}
