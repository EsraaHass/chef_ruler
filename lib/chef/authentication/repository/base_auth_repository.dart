import 'package:chef_ruler/chef/authentication/model/user.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

abstract class BaseAuthRepository {
  CollectionReference<MyUser> getUserCollection();

  Future<MyUser> insertUser(MyUser myUser);

  Future<MyUser> retriveUserById(String id);
}
