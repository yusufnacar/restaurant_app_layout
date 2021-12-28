import 'package:json_annotation/json_annotation.dart';

import '../../../../core/base/model/base_model.dart';
import 'merchants.dart';

part 'home_response_model.g.dart';

@JsonSerializable()
class HomeResponseModel implements BaseModel<HomeResponseModel> {
  final int? limit;
  final int? offset;
  final List<Merchants>? merchants;

  HomeResponseModel({this.limit, this.offset, this.merchants});

  @override
  fromJson(Map<String, dynamic> json) {
    return _$HomeResponseModelFromJson(json);
  }

  @override
  Map<String, dynamic> toJson() {
    return _$HomeResponseModelToJson(this);
  }

  factory HomeResponseModel.fromJson(Map<String, dynamic> json) {
    return _$HomeResponseModelFromJson(json);
  }
}
