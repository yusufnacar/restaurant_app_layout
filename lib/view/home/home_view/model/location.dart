import 'package:json_annotation/json_annotation.dart';
import 'package:restaurant_app/core/base/model/base_model.dart';

import 'address.dart';
import 'coordinates.dart';

part 'location.g.dart';

@JsonSerializable()
class Location implements BaseModel<Location> {
  final Coordinates? coordinates;
  final Address? address;

  Location({this.coordinates, this.address});

  @override
  fromJson(Map<String, dynamic> json) {
    return _$LocationFromJson(json);
  }

  @override
  Map<String, dynamic> toJson() {
    return _$LocationToJson(this);
  }

  factory Location.fromJson(Map<String, dynamic> json) {
    return _$LocationFromJson(json);
  }
}
