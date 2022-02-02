import 'dart:convert';

import 'package:http/http.dart' as http;
//part 'api.g.dart';


//@JsonSerializable()
class Tokens {
  Tokens(this.accessToken);
  String accessToken;
}

String getKey (Map<String, dynamic> json){
  return json["access_token"];
}

/*
class tokenEntries{
  tokenEntries({
    required this.token_type, 
    required this.expires_in, 
    required this.access_token
  });


  factory tokenEntries.fromJson(Map<String, dynamic> json) 
    => _$tokenEntriesFromJson(json);

  Map<String, dynamic> toJson() => _$tokenEntriesToJson(this);

  final String token_type;
  final String expires_in;
  final String access_token;
}*/

Future<Tokens> getToken() async {
  final response = await http.post(
    Uri.parse('https://api.petfinder.com/v2/oauth2/token'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, String>{
      'grant_type': 'client_credentials',
      'client_id': 'nC63pxB2tdK0GkwtRoUYwDOrfMkPF1obRQlFqKM3KLcxqa5Vqu',
      'client_secret': 'eyHUnKkKVFynsS1ZMLjsFiTVgNmiWCzB1fikwm84'
    }),
  );
  if(response.statusCode != 200) {
    throw Exception("error ${response.statusCode}");
  }

  final Map<String, dynamic> map = 
    jsonDecode(response.body) as Map<String, dynamic>;
  final Tokens tokenRes = Tokens(map["access_token"]);
  return tokenRes;
}
