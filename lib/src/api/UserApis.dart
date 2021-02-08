import 'dart:convert';

import 'package:frontend/src/model/UserInfo.dart';
import 'package:http/http.dart';

Future<UserInfo> createUserAccount(UserInfo userInfo) async {
  final response = await post('http://localhost:8080/createAccount',
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, dynamic>{
        'user_account' : userInfo.toJson(userInfo)
      }));

  if (response.statusCode == 200) {
    return UserInfo.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('Failed to load album');
  }
}

Future<UserInfo> validateToken(String accessToken) async {
  final response = await get('http://localhost:8080/validateToken/'+accessToken);

  if (response.statusCode == 200) {
    return UserInfo.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('Failed to load album');
  }
}

Future<UserInfo> validateUser(String username, String password) async {
  final response = await get('http://localhost:8080/login?username='+username+'&password='+password);

  if (response.statusCode == 200) {
    return UserInfo.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('Invalid Username/Password');
  }
}