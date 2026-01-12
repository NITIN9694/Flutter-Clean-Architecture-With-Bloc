
import 'package:clean_architure/core/error/failure.dart';
import 'package:clean_architure/core/usecase/usecase.dart';
import 'package:clean_architure/feature/home/data/model/home_data_model.dart';
import 'package:clean_architure/feature/home/domain/repository/home_repository.dart';
import 'package:fpdart/src/either.dart';

class GetAllHomeData implements UseCase<List<HomeDataModel>,NoParams>{
  final HomeRepo homeRepo;
  GetAllHomeData(this.homeRepo);


  @override
  Future<Either<Failure, List<HomeDataModel>>> call(NoParams params) async{
  return  await homeRepo.getHomeData();
  }}