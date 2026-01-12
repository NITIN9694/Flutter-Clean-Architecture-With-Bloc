
import 'package:clean_architure/feature/home/data/model/home_data_model.dart';
import 'package:clean_architure/networks/remote_api.dart';

import '../../../../core/error/server_exception.dart';
import '../../../../networks/api_constants.dart';

abstract class HomeDataSource{

  Future<List<HomeDataModel>> getHomeData();
}

class HomeDataSourceImp implements HomeDataSource{
final  RemoteApi remoteApi;

HomeDataSourceImp(this.remoteApi);
  @override
  Future<List<HomeDataModel>> getHomeData() async{
    try {
      final List<dynamic> response =
      await remoteApi.getRequest(ApiConstant().albums);

      print("response: $response");

      return response
          .map((json) => HomeDataModel.fromJson(json))
          .toList(); //  IMPORTANT

    } on ServerException catch (e) {
      throw ServerException(e.message.toString());
    }
  }

}