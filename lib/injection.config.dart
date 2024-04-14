// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:users/src/data/repository/user_repository_impl.dart' as _i4;
import 'package:users/src/di/app_module.dart' as _i8;
import 'package:users/src/domain/repository/user_repository.dart' as _i3;
import 'package:users/src/domain/usecases/get_user_by_id_usecase.dart' as _i6;
import 'package:users/src/domain/usecases/get_users_usecase.dart' as _i7;
import 'package:users/src/domain/usecases/user_usecases.dart' as _i5;

const String _Repositories = 'Repositories';
const String _UseCases = 'UseCases';

extension GetItInjectableX on _i1.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i1.GetIt init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final appModule = _$AppModule();
    gh.factory<_i3.UserRepository>(
      () => appModule.usersRepository,
      registerFor: {_Repositories},
    );
    gh.factory<_i3.UserRepository>(() => _i4.UserRepositoryImpl());
    gh.factory<_i5.UserUseCases>(
      () => appModule.userUseCases,
      registerFor: {_UseCases},
    );
    gh.factory<_i6.GetUserByIdUseCase>(
        () => _i6.GetUserByIdUseCase(gh<_i3.UserRepository>()));
    gh.factory<_i7.GetUsersUseCase>(
        () => _i7.GetUsersUseCase(gh<_i3.UserRepository>()));
    gh.factory<_i5.UserUseCases>(() => _i5.UserUseCases(
          getUsersUseCase: gh<_i7.GetUsersUseCase>(),
          getUserByIdUseCase: gh<_i6.GetUserByIdUseCase>(),
        ));
    return this;
  }
}

class _$AppModule extends _i8.AppModule {}
