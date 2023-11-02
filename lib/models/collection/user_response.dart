import 'package:json_annotation/json_annotation.dart';

part 'user_response.g.dart';

@JsonSerializable()
class UserResponse {
  @JsonKey(required: true)
  final String id;

  @JsonKey(required: true)
  final String username;

  @JsonKey(required: true)
  final String firstName;

  @JsonKey(required: true)
  final String lastName;

  const UserResponse({
    required this.id,
    required this.username,
    required this.firstName,
    required this.lastName,
  });

  factory UserResponse.fromJson(Map<String, dynamic> json) => _$UserResponseFromJson(json);

  Map<String, dynamic> toJson() => _$UserResponseToJson(this);
}

UserResponse deserializeUserResponse(Map<String, dynamic> json) => UserResponse.fromJson(json);
