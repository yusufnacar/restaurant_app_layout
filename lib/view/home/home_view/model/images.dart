import 'package:json_annotation/json_annotation.dart';
import 'package:restaurant_app/core/base/model/base_model.dart';

part 'images.g.dart';

@JsonSerializable()
class Images implements BaseModel<Images> {
  final String? url;

  Images(this.url);

  @override
  fromJson(Map<String, dynamic> json) {
    return _$ImagesFromJson(json);
  }

  @override
  Map<String, dynamic> toJson() {
    return _$ImagesToJson(this);
  }

  factory Images.fromJson(Map<String, dynamic> json) {
    return _$ImagesFromJson(json);
  }
}
