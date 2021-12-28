// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'restaurant_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RestaurantRequestModel _$RestaurantRequestModelFromJson(
        Map<String, dynamic> json) =>
    RestaurantRequestModel(
      place: json['place'] as String?,
      limit: json['limit'] as int?,
      offset: json['offset'] as int?,
    );

Map<String, dynamic> _$RestaurantRequestModelToJson(
        RestaurantRequestModel instance) =>
    <String, dynamic>{
      'limit': instance.limit,
      'offset': instance.offset,
      'place': instance.place,
    };
