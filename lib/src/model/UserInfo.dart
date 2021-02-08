import 'package:flutter/cupertino.dart';

class UserInfo extends GlobalObjectKey{
  String token;
  String userId;
  String password;
  String username;
  String firstName;
  String lastName;

  UserInfo({this.token, this.userId, this.password, this.username, this.firstName, this.lastName}) : super(null);

  factory UserInfo.fromJson(dynamic json) {
    return UserInfo(
      token: json['token'],
      userId: json['user_id'],
      password: json['password'],
      username: json['username'],
      firstName: json['first_name'],
      lastName: json['last_name'],
    );
  }

  Map<String, dynamic> toJson(UserInfo userInfo) {
    return {
      'token': userInfo.token,
      'username' : userInfo.username,
      'password' : userInfo.password,
      'first_name' : userInfo.firstName,
      'last_name' : userInfo.lastName
    };
  }
}