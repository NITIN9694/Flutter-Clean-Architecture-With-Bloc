import 'package:clean_architure/feature/home/data/model/home_data_model.dart';

sealed class HomeState{}

class HomeInitial extends HomeState{

}

class HomeLoading extends HomeState{}

class HomeFailure extends HomeState{
  String message;
  HomeFailure(this.message);
}

class HomeDataSuccess extends HomeState{

  final List<HomeDataModel> homeDataModel;

  HomeDataSuccess(this.homeDataModel);
}