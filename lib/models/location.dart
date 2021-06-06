import 'package:json_annotation/json_annotation.dart';
part 'location.g.dart';
// cmd update model: flutter packages pub run build_runner build --delete-conflicting-outputs
// flutter pub run build_runner build
@JsonSerializable()
class Province {
  final String name;
  final String name_with_type;
  final String code;

  @JsonKey(ignore: true)
  List<District> districts;


  Province({this.name, this.name_with_type, this.code, this.districts});

  factory Province.fromJson(Map<String, dynamic> json) {
    final item = _$ProvinceFromJson(json);
    return item;
  }
  Map<String, dynamic> toJson() => _$ProvinceToJson(this);

}

@JsonSerializable()
class District { //Wards

  final String name;
  final String path_with_type;
  final String name_with_type;
  final String code;

  @JsonKey(ignore: true)
  List<Wards> wards;

  District({this.name, this.path_with_type, this.name_with_type, this.code, this.wards});

  factory District.fromJson(Map<String, dynamic> json) {
    final item = _$DistrictFromJson(json);
    return item;
  }
  Map<String, dynamic> toJson() => _$DistrictToJson(this);
}

@JsonSerializable()
class Wards { //Wards

  final String name;
  final String path_with_type;
  final String name_with_type;
  final String code;

  Wards({this.name, this.path_with_type, this.name_with_type, this.code});

  factory Wards.fromJson(Map<String, dynamic> json) {
    final item = _$WardsFromJson(json);
    return item;
  }
  Map<String, dynamic> toJson() => _$WardsToJson(this);
}