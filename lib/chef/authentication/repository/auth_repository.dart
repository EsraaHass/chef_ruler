import 'package:chef_ruler/chef/authentication/model/user.dart';
import 'package:chef_ruler/chef/authentication/repository/base_auth_repository.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AuthRepository extends BaseAuthRepository {
  @override
  CollectionReference<MyUser> getUserCollection() {
    return FirebaseFirestore.instance
        .collection(MyUser.routeName)
        .withConverter<MyUser>(
            fromFirestore: (snapshot, options) {
              return MyUser.fromFireStore(snapshot.data()!);
            },
            toFirestore: (MyUser, SetOptions) => MyUser.toFirestore());
  }

  @override
  Future<MyUser> insertUser(MyUser myUser) async {
    var collection = getUserCollection();
    var documentRef = collection.doc(myUser.id);
    await documentRef.set(myUser);
    return myUser;
  }

  @override
  Future<MyUser> retriveUserById(String id) async {
    var collection = getUserCollection();
    var documentRef = collection.doc(id);
    var result = await documentRef.get();
    return result.data()!;
  }
}
