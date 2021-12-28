import '../../../../core/constants/enums/http_enum.dart';
import '../../../../core/init/network/i_core_dio.dart';
import '../model/home_response_model.dart';
import '../model/restaurant_request_model.dart';

abstract class IHomeService {
  final ICoreDio? manager;

  IHomeService(this.manager);

  Future<HomeResponseModel?> getMerchants(RestaurantRequestModel model);
}

class HomeService extends IHomeService {
  HomeService(ICoreDio? manager) : super(manager);

  @override
  Future<HomeResponseModel?> getMerchants(RestaurantRequestModel model) async {
    final response = await manager!.send<HomeResponseModel, HomeResponseModel>(
        "/merchants",
        type: HttpTypes.GET,
        parseModel: HomeResponseModel(),
        queryParameters: model.toJson());

    if (response.data is HomeResponseModel) {
      return response.data;
    } else {
      return null;
    }
  }
}
