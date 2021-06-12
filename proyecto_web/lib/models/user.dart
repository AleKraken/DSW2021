class User {
  String _userId;
  String _username;
  String _name;
  String _lastLogin;
  String _email;

  // constructorUser(
  User(String userId, String username, String name, String lastLogin,
      String email) {
    this._userId = userId;
    this._username = username;
    this._name = name;
    this._lastLogin = lastLogin;
    this._email = email;
  }

  // Properties
  String get userId => _userId;
  set userId(String userId) => _userId = userId;
  String get username => _username;
  set username(String username) => _username = username;
  String get name => _name;
  set name(String name) => _name = name;
  String get lastLogin => _lastLogin;
  set lastLogin(String lastLogin) => _lastLogin = lastLogin;
  String get email => _email;
  set email(String email) => _email = email;

  // create the user object from json input
  User.fromJson(Map<String, dynamic> json) {
    _userId = json['userId'];
    _username = json['username'];
    _name = json['name'];
    _lastLogin = json['lastLogin'];
    _email = json['email'];
  }

  // exports to json
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['userId'] = this._userId;
    data['username'] = this._username;
    data['name'] = this._name;
    data['lastLogin'] = this._lastLogin;
    data['email'] = this._email;
    return data;
  }
}
