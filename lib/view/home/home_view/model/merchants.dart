import 'package:json_annotation/json_annotation.dart';
import 'package:restaurant_app/core/base/model/base_model.dart';

import 'images.dart';
import 'location.dart';

part 'merchants.g.dart';

@JsonSerializable()
class Merchants implements BaseModel<Merchants> {
  final int? id;
  final String? name;
  final List<Images> images;
  final String? reviewScore;
  final bool? bookable;
  final Location? location;
  final String? phoneNumber;

  Merchants(this.id, this.name, this.images, this.reviewScore, this.bookable,
      this.location, this.phoneNumber);

  @override
  fromJson(Map<String, dynamic> json) {
    return _$MerchantsFromJson(json);
  }

  @override
  Map<String, dynamic> toJson() {
    return _$MerchantsToJson(this);
  }

  factory Merchants.fromJson(Map<String, dynamic> json) {
    return _$MerchantsFromJson(json);
  }
}
