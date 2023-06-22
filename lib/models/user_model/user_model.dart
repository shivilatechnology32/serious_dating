import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_model.freezed.dart';
part 'user_model.g.dart';

@freezed
class UserModel with _$UserModel{

  const factory UserModel({
    required String uid,
    required String username,
    required String email,
    required String photoId,
    required String gender,
    required String phoneNumber,
  }) = _UserModel;

  factory UserModel.fromJson(Map<String, Object?> json) => _$UserModelFromJson(json);
}
