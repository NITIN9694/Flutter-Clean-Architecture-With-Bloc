


import 'package:clean_architure/feature/auth/data/data_sources/auth_remote_data_source.dart';
import 'package:clean_architure/feature/auth/data/repository/auth_repository_impl.dart';
import 'package:clean_architure/feature/auth/domain/repositiory/auth_repository.dart';
import 'package:clean_architure/feature/auth/domain/usecase/user_sing_up.dart';
import 'package:clean_architure/feature/auth/presentation/auth/bloc.dart';
import 'package:clean_architure/feature/home/data/datasource/home_datasources.dart';
import 'package:clean_architure/feature/home/data/repository/home_data_repo.dart';
import 'package:clean_architure/feature/home/domain/repository/home_repository.dart';
import 'package:clean_architure/feature/home/domain/usecase/home_usacase.dart';
import 'package:clean_architure/feature/home/presentation/home_bloc/bloc.dart';
import 'package:clean_architure/networks/remote_api.dart';
import 'package:get_it/get_it.dart';

final  serviceLocator = GetIt.instance;

Future<void> initDependencies()async {

  serviceLocator.registerLazySingleton<RemoteApi>(()=>RemoteApi());



//auth
  serviceLocator.registerFactory<AuthRemoteDataSource>(()=> AuthRemoteDataSourceImp(serviceLocator<RemoteApi>()));

  serviceLocator.registerFactory<AuthRepository>(()=>AuthRepositoryImpl(serviceLocator<AuthRemoteDataSource>()));
  
  serviceLocator.registerFactory<UserSingUp>(()=>UserSingUp(serviceLocator<AuthRepository>()));

  serviceLocator.registerLazySingleton<AuthBloc>(()=>AuthBloc(userSingUp: serviceLocator<UserSingUp>()));



//home
serviceLocator.registerFactory<HomeDataSource>(()=> HomeDataSourceImp(serviceLocator<RemoteApi>()));
    
serviceLocator.registerFactory<HomeRepo>(()=>HomeDataRepo(serviceLocator<HomeDataSource>()));
serviceLocator.registerFactory<GetAllHomeData>(()=>GetAllHomeData(serviceLocator<HomeRepo>()));


  serviceLocator.registerLazySingleton<HomeBloc>(()=>HomeBloc(getAllData: serviceLocator<GetAllHomeData>()));




}