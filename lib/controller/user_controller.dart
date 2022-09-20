import 'package:flutter_firebase_login/models/user_model.dart';
import 'package:get/get.dart';

class UserController extends GetxController {
  Rx<UserModel> _userModel =
      UserModel(uid: '', password: '', email: '', name: '').obs;

  UserModel get user => _userModel.value;

  set user(UserModel value) => this._userModel.value = value;

  void clear() {
    _userModel.value = UserModel(uid: '', password: '', email: '', name: '');
  }
}
