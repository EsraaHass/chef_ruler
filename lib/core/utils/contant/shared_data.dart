import 'package:chef_ruler/chef/authentication/model/user.dart';

class SharedData {
  static MyUser? myUser;
}

String idFromLocalData() => DateTime.now().toIso8601String();
