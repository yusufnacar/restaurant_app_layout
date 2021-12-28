import 'package:json_annotation/json_annotation.dart';
import 'package:restaurant_app/core/base/model/base_model.dart';

part 'address.g.dart';

@JsonSerializable()
class Address implements BaseModel<Address> {
  final String? street;
  final String? number;
  final String? zipcode;
  final String? city;
  final String? country;
  final String? district;

  Address(
      {this.street,
      this.number,
      this.zipcode,
      this.city,
      this.country,
      this.district});

  @override
  fromJson(Map<String, dynamic> json) {
    return _$AddressFromJson(json);
  }

  @override
  Map<String, dynamic> toJson() {
    return _$AddressToJson(this);
  }

  factory Address.fromJson(Map<String, dynamic> json) {
    return _$AddressFromJson(json);
  }
}
