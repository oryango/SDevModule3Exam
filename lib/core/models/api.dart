import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:json_annotation/json_annotation.dart';
part 'api.g.dart';


//@JsonSerializable()
class Tokens {
  Tokens(this.accessToken);
  String accessToken;
}

String getKey (Map<String, dynamic> json){
  return json["access_token"];
}

@JsonSerializable()
class GetEntries{
  GetEntries({
    required this.animals,
    required this.pagination,
  });

  factory GetEntries.fromJson(Map<String, dynamic> json)
    => _$GetEntriesFromJson(json);

  Map<String, dynamic> toJson() => _$GetEntriesToJson(this);

  final animals;
  final pagination;

}

@JsonSerializable()
class PetEntries {
  PetEntries({
    required this.id,
    required this.type
  });

  factory PetEntries.fromJson(Map<String, dynamic> json)
    => _$PetEntriesFromJson(json);

  Map<String, dynamic> toJson() => _$PetEntriesToJson(this);

  final id;
  final type;
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

Future<GetEntries> getPets(String accessToken,String type) async {
  final response = await http.get(
    Uri.parse('https://api.petfinder.com/v2/animals?'
    'limit=100&-description&type=$type',),
    headers: <String, String>{
      'Authorization': 'Bearer $accessToken'
    },
  );
  if(response.statusCode != 200) {
    throw Exception("error ${response.statusCode}");
  }
  Map<String, dynamic> entries = jsonDecode(response.body);

  final GetEntries result = GetEntries.fromJson(jsonDecode(response.body));
  return result;
}