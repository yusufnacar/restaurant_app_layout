// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HomeResponseModel _$HomeResponseModelFromJson(Map<String, dynamic> json) =>
    HomeResponseModel(
      limit: json['limit'] as int?,
      offset: json['offset'] as int?,
      merchants: (json['merchants'] as List<dynamic>?)
          ?.map((e) => Merchants.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$HomeResponseModelToJson(HomeResponseModel instance) =>
    <String, dynamic>{
      'limit': instance.limit,
      'offset': instance.offset,
      'merchants': instance.merchants,
    };
