import 'package:json_annotation/json_annotation.dart';
import 'package:restaurant_app/core/base/model/base_model.dart';

part 'coordinates.g.dart';

@JsonSerializable()
class Coordinates implements BaseModel<Coordinates> {
  final double? latitude;
  final double? longitude;

  Coordinates({this.latitude, this.longitude});

  @override
  fromJson(Map<String, dynamic> json) {
    return _$CoordinatesFromJson(json);
  }

  @override
  Map<String, dynamic> toJson() {
    return _$CoordinatesToJson(this);
  }

  factory Coordinates.fromJson(Map<String, dynamic> json) {
    return _$CoordinatesFromJson(json);
  }
}
