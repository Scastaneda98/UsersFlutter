import 'package:injectable/injectable.dart';
import 'package:users/src/core/constants.dart';
import 'package:users/src/data/repository/user_repository_impl.dart';
import 'package:users/src/domain/repository/user_repository.dart';
import 'package:users/src/domain/usecases/get_user_by_id_usecase.dart';
import 'package:users/src/domain/usecases/get_users_usecase.dart';
import 'package:users/src/domain/usecases/user_usecases.dart';

@module
abstract class AppModule {

  @Environment(repositories)
  @injectable
  UserRepository get usersRepository => UserRepositoryImpl();

  @Environment(useCases)
  @injectable
  UserUseCases get userUseCases => UserUseCases(getUsersUseCase: GetUsersUseCase(usersRepository), getUserByIdUseCase: GetUserByIdUseCase(usersRepository));
}
