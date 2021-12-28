// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'merchants.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Merchants _$MerchantsFromJson(Map<String, dynamic> json) => Merchants(
      json['id'] as int?,
      json['name'] as String?,
      (json['images'] as List<dynamic>)
          .map((e) => Images.fromJson(e as Map<String, dynamic>))
          .toList(),
      json['reviewScore'] as String?,
      json['bookable'] as bool?,
      json['location'] == null
          ? null
          : Location.fromJson(json['location'] as Map<String, dynamic>),
      json['phoneNumber'] as String?,
    );

Map<String, dynamic> _$MerchantsToJson(Merchants instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'images': instance.images,
      'reviewScore': instance.reviewScore,
      'bookable': instance.bookable,
      'location': instance.location,
      'phoneNumber': instance.phoneNumber,
    };
