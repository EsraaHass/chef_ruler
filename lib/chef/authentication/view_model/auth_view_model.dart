import 'package:chef_ruler/chef/authentication/model/user.dart';
import 'package:chef_ruler/chef/authentication/repository/base_auth_repository.dart';
import 'package:chef_ruler/chef/authentication/view_model/base/base.dart';
import 'package:chef_ruler/core/utils/contant/shared_data.dart';
import 'package:firebase_auth/firebase_auth.dart';

abstract class AuthNavigator extends BaseNavigator {
  void goToHome();
}

class AuthViewModel extends BaseViewModel<AuthNavigator> {
  FirebaseAuth auth = FirebaseAuth.instance;
  BaseAuthRepository? baseAuthRepository;

  AuthViewModel({this.baseAuthRepository});

  void creatAccount(String email, String city, String name, String password,
      String imageUrl) async {
    navigator?.showLoading();
    try {
      MyUser myUser = MyUser(
          id: idFromLocalData(),
          password: password,
          email: email,
          name: name,
          imageUrl: imageUrl,
          city: city);

      var insertedUser = await baseAuthRepository?.insertUser(myUser);

      navigator?.hideLoading();
      if (insertedUser != null) {
        SharedData.myUser = insertedUser;
        navigator?.goToHome();
        print('MY Id Esraa Hassan = ${SharedData.myUser?.id}');
      } else {
        navigator
            ?.showMessage('something went wrong with username or password');
      }
    } on FirebaseAuthException catch (e) {
      navigator?.hideLoading();
      if (e.code == 'weak-password') {
        navigator?.showMessage('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        navigator?.showMessage('The account already exists for that email.');
      }
    } catch (e) {
      navigator?.hideLoading();
      navigator?.showMessage('something went wrong, please try again.');
    }
  }
}
