import 'package:users/src/domain/models/user.dart';
import '../utils/resource.dart';

abstract class UserRepository {
  Stream<Resource<List<User>>> getUsers();
  Stream<Resource<User>> getUserById(int id);

}