// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:flutter_clean_code/core/network/api_client.dart' as _i3;
import 'package:flutter_clean_code/core/services/socket_service.dart' as _i4;
import 'package:flutter_clean_code/features/dashboard/data/datasources/dashboard_datasource.dart'
    as _i5;
import 'package:flutter_clean_code/features/dashboard/data/repositories/dashboard_repository_impl.dart'
    as _i7;
import 'package:flutter_clean_code/features/dashboard/domain/repositories/dashboard_repository.dart'
    as _i6;
import 'package:flutter_clean_code/features/dashboard/domain/usecases/dashboard_usecase.dart'
    as _i8;
import 'package:flutter_clean_code/features/dashboard/presentation/bloc/dashboard_bloc.dart'
    as _i9;

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
    gh.lazySingleton<_i3.CustomDio>(() => _i3.CustomDio());
    gh.lazySingleton<_i4.SocketService>(() => _i4.SocketService());
    gh.lazySingleton<_i5.DashboardDataSource>(
        () => _i5.DashboardDataSource(dio: gh<_i3.CustomDio>()));
    gh.lazySingleton<_i6.DashboardRepository>(
        () => _i7.DashboardRepositoryImpl(gh<_i5.DashboardDataSource>()));
    gh.lazySingleton<_i8.DashboardUseCase>(
        () => _i8.DashboardUseCase(gh<_i6.DashboardRepository>()));
    gh.factory<_i9.DashboardBloc>(
        () => _i9.DashboardBloc(dashboardUseCase: gh<_i8.DashboardUseCase>()));
    return this;
  }
}
