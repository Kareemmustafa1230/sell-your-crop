import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:sell_your_crop/features/setting/data/model/response_model/get_profile_response.dart';
part 'get_profile_state.freezed.dart';

@freezed
class ProfileState<T> with _$ProfileState<T> {
  const factory ProfileState.initial() = _Initial;
  const factory ProfileState.loading() = Loading;
  const factory ProfileState.loadSuccess({required GetProfileResponse  getProfileResponse}) = LoadSuccess<T>;
  const factory ProfileState.updateSuccess({required String message}) = UpdateSuccess<T>;
  const factory ProfileState.error({required String error}) = Error;
}