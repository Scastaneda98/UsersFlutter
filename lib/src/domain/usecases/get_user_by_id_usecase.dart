import 'package:injectable/injectable.dart';
import 'package:users/src/domain/models/user.dart';
import 'package:users/src/domain/repository/user_repository.dart';
import 'package:users/src/domain/utils/resource.dart';

@Injectable()
class GetUserByIdUseCase {
  final UserRepository _repository;

  GetUserByIdUseCase(this._repository);

  Stream<Resource<User>> launch(int id) => _repository.getUserById(id);
}