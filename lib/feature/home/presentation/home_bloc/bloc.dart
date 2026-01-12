

import 'package:clean_architure/core/usecase/usecase.dart';
import 'package:clean_architure/feature/home/domain/usecase/home_usacase.dart';
import 'package:clean_architure/feature/home/presentation/home_bloc/event.dart';
import 'package:clean_architure/feature/home/presentation/home_bloc/state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeBloc extends Bloc<HomeEvent,HomeState>{
  final GetAllHomeData _getAllHomeData;
  HomeBloc({
    required GetAllHomeData getAllData
   }): _getAllHomeData = getAllData, super(HomeInitial()){
   on<HomeFetchEvent>(_getAllHomeDataCall);
  }

  void _getAllHomeDataCall(HomeFetchEvent event,Emitter<HomeState> emit)async{
    emit(HomeLoading());
    final res = await _getAllHomeData(NoParams());
    res.fold((l)=>emit(HomeFailure(l.message)),
        (r)=>emit(HomeDataSuccess(r)));
  }

}