class Usuario {
  int id;
  String email;
  String password;
  String nombre;
  String idPais;
  String edad;
  String idGenero;
  String info;
  String rutaFoto;
  String createdAt;
  String updatedAt;

  Usuario(this.email, this.password, this.nombre, this.idPais, this.edad,
      this.idGenero, this.info);

  Usuario.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    email = json['email'];
    nombre = json['nombre'];
    idPais = json['idPais'];
    edad = json['edad'];
    idGenero = json['idGenero'];
    info = json['info'];
    rutaFoto = json['rutaFoto'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['email'] = this.email;
    data['nombre'] = this.nombre;
    data['idPais'] = this.idPais;
    data['edad'] = this.edad;
    data['idGenero'] = this.idGenero;
    data['info'] = this.info;
    data['rutaFoto'] = this.rutaFoto;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
