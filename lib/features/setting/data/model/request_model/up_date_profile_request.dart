import 'package:freezed_annotation/freezed_annotation.dart';
part 'up_date_profile_request.g.dart';


@JsonSerializable()
class UpdateProfileRequest {
  final String name ;
  final String mobile;

  UpdateProfileRequest({
    required this.mobile,
    required this.name,
  });

  Map<String, dynamic> toJson() => _$UpdateProfileRequestToJson(this);
}
