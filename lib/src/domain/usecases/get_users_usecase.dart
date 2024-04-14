import 'package:injectable/injectable.dart';
import 'package:users/src/domain/models/user.dart';
import 'package:users/src/domain/repository/user_repository.dart';
import 'package:users/src/domain/utils/resource.dart';

@Injectable()
class GetUsersUseCase {
  final UserRepository _repository;

  GetUsersUseCase(this._repository);

  Stream<Resource<List<User>>> launch() => _repository.getUsers();
}