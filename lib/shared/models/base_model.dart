import 'dart:convert';

abstract interface class BaseModel {
  factory BaseModel.fromJson(Map<String, dynamic> json) => throw UnimplementedError();
  factory BaseModel.fromString(String source) => BaseModel.fromJson(json.decode(source));
  Map<String, dynamic> toJson() => throw UnimplementedError();

  @override
  String toString() => json.encode(toJson());
}
