import 'package:json_annotation/json_annotation.dart';

part "user.g.dart"; // Ensure this matches the file name

@JsonSerializable()
class User {
  @JsonKey(name: "id")
  String? id;

  @JsonKey(name: "name")
  String? name;

  @JsonKey(name: "number")
  int? number;

  User({
    this.id,
    this.name,
    this.number,
  });

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
  Map<String, dynamic> toJson() =>
      _$UserToJson(this); // This method must exist in user.g.dart
}
