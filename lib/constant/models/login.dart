class Login {
  Login({this.username, this.password});

  String username;
  String password;

  // factory Client.fromJson(Map<String, dynamic> json) => _$ClientFromJson(json);

  Map<String, dynamic> toJson() => _$LoginToJson(this);
}

// Client _$ClientFromJson(Map<String, dynamic> json) {
//   return Client(
//       json['id'] as int,
//       json['nom'] as String,
//       json['postnom'] as String,
//       json['prenom'] as String,
//       json['sexe'] as String,
//       json['adresse'] as String,
//       json['contact'] as String,
//       json['mail'] as String,
//       json['username'] as String,
//       json['password'] as String);
// }

Map<String, dynamic> _$LoginToJson(Login instance) => <String, dynamic>{
      'username': instance.username,
      'password': instance.password,
    };
