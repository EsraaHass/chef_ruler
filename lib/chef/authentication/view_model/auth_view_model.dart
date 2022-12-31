import 'package:chef_ruler/chef/authentication/model/user.dart';
import 'package:chef_ruler/chef/authentication/repository/base_auth_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';

class AuthViewModel extends ChangeNotifier {
  FirebaseAuth auth = FirebaseAuth.instance;
  BaseAuthRepository? baseAuthRepository;

  AuthViewModel({this.baseAuthRepository});

  void insertUser(MyUser myUser) async {
    await baseAuthRepository?.insertUser(myUser);
  }
}
