import 'package:flutter/cupertino.dart';
import 'package:users/src/domain/models/user.dart';
import 'package:users/src/domain/usecases/user_usecases.dart';
import 'package:users/src/domain/utils/resource.dart';

class UsersViewModel extends ChangeNotifier {

  final UserUseCases _userUseCases;

  UsersViewModel(this._userUseCases);

  Stream<Resource<List<User>>> getUsers() {
    return _userUseCases.getUsersUseCase.launch();
  }

  Stream<Resource<User>> getUserById(int id) {
    return _userUseCases.getUserByIdUseCase.launch(id);
  }

}