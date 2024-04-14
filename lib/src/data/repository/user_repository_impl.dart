import 'package:injectable/injectable.dart';
import 'package:users/src/domain/models/user.dart';
import 'package:users/src/domain/repository/user_repository.dart';
import 'package:users/src/domain/utils/resource.dart';
import 'package:http/http.dart' as http;

@Injectable(as: UserRepository)
class UserRepositoryImpl implements UserRepository {
  static const String _baseUrl = 'https://jsonplaceholder.typicode.com/users';

  @override
  Stream<Resource<User>> getUserById(int id) async* {
    try {
      final response = await http.get(Uri.parse('$_baseUrl/$id'));

      if (response.statusCode == 200) {
        final User user = userFromJson(response.body);
        yield Success(user);
      } else {
        throw Exception('Failed to load user');
      }
    } catch(e) {
      yield Failure(e.toString());
    }
  }

  @override
  Stream<Resource<List<User>>> getUsers() async*{
    try {
      final response = await http.get(Uri.parse(_baseUrl));

      if (response.statusCode == 200) {
        final List<User> users = usersFromJson(response.body);
        yield Success(users);
      } else {
        throw Exception('Failed to load users');
      }
    } catch(e) {
      yield Failure(e.toString());
    }
  }

}