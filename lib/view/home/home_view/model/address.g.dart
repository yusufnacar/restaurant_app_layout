// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'address.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Address _$AddressFromJson(Map<String, dynamic> json) => Address(
      street: json['street'] as String?,
      number: json['number'] as String?,
      zipcode: json['zipcode'] as String?,
      city: json['city'] as String?,
      country: json['country'] as String?,
      district: json['district'] as String?,
    );

Map<String, dynamic> _$AddressToJson(Address instance) => <String, dynamic>{
      'street': instance.street,
      'number': instance.number,
      'zipcode': instance.zipcode,
      'city': instance.city,
      'country': instance.country,
      'district': instance.district,
    };
