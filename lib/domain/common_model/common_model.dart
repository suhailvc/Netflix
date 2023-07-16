import 'package:json_annotation/json_annotation.dart';

import 'result.dart';

part 'common_model.g.dart';

@JsonSerializable()
class CommonModel {
  List<Result>? results;

  CommonModel({this.results});

  factory CommonModel.fromJson(Map<String, dynamic> json) {
    return _$CommonModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$CommonModelToJson(this);
}
