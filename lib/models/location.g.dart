// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'location.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Province _$ProvinceFromJson(Map<String, dynamic> json) {
  return Province(
    name: json['name'] as String,
    name_with_type: json['name_with_type'] as String,
    code: json['code'] as String,
  );
}

Map<String, dynamic> _$ProvinceToJson(Province instance) => <String, dynamic>{
      'name': instance.name,
      'name_with_type': instance.name_with_type,
      'code': instance.code,
    };

District _$DistrictFromJson(Map<String, dynamic> json) {
  return District(
    name: json['name'] as String,
    path_with_type: json['path_with_type'] as String,
    name_with_type: json['name_with_type'] as String,
    code: json['code'] as String,
  );
}

Map<String, dynamic> _$DistrictToJson(District instance) => <String, dynamic>{
      'name': instance.name,
      'path_with_type': instance.path_with_type,
      'name_with_type': instance.name_with_type,
      'code': instance.code,
    };

Wards _$WardsFromJson(Map<String, dynamic> json) {
  return Wards(
    name: json['name'] as String,
    path_with_type: json['path_with_type'] as String,
    name_with_type: json['name_with_type'] as String,
    code: json['code'] as String,
  );
}

Map<String, dynamic> _$WardsToJson(Wards instance) => <String, dynamic>{
      'name': instance.name,
      'path_with_type': instance.path_with_type,
      'name_with_type': instance.name_with_type,
      'code': instance.code,
    };
