import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class AuthModel {
  final String accessToken;
  final String refreshToken;
  AuthModel({
    required this.accessToken,
    required this.refreshToken,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'access_token': accessToken,
      'refresh_token': refreshToken,
    };
  }

  factory AuthModel.fromMap(Map<String, dynamic> map) {
    return AuthModel(
      accessToken: map['access_token'] as String,
      refreshToken: map['refresh_token'] as String,
    );
    //do authModel ne? saquei tava dando mta bobeira msm :/ kk

    //por padrao o flutter trabalha com camelCase diferente do que vem dos dados do token qu
    // e chamado de snake case access_<snake>token
    //entao a gente sempre faz essa conversao de json porque o json normalmente e snake case
    // ai como seu authmodel e accessToken e o seu json e access_token, vou abrir o login_controller pra vc ve
  }

  String toJson() => json.encode(toMap());

  factory AuthModel.fromJson(String source) =>
      AuthModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
