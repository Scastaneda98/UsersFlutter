import 'package:injectable/injectable.dart';
import 'package:users/src/domain/usecases/get_user_by_id_usecase.dart';
import 'package:users/src/domain/usecases/get_users_usecase.dart';

@Injectable()
class UserUseCases {
  GetUsersUseCase getUsersUseCase;
  GetUserByIdUseCase getUserByIdUseCase;

  UserUseCases({required this.getUsersUseCase, required this.getUserByIdUseCase});
}