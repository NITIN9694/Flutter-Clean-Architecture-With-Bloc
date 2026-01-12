
import 'package:clean_architure/feature/home/data/model/home_data_model.dart';

import '../../../../core/error/failure.dart';
import 'package:fpdart/fpdart.dart';

abstract interface class HomeRepo{

  Future <Either<Failure,List<HomeDataModel>>> getHomeData();
}