import 'package:json_annotation/json_annotation.dart';
import 'package:restaurant_app/core/base/model/base_model.dart';

part 'restaurant_request_model.g.dart';

@JsonSerializable()
class RestaurantRequestModel implements BaseModel<RestaurantRequestModel> {
  final int? limit;
  final int? offset;
  final String? place;

  RestaurantRequestModel({
    this.place,
    this.limit,
    this.offset,
  });

  @override
  fromJson(Map<String, dynamic> json) {
    return _$RestaurantRequestModelFromJson(json);
  }

  @override
  Map<String, dynamic> toJson() {
    return _$RestaurantRequestModelToJson(this);
  }
}
