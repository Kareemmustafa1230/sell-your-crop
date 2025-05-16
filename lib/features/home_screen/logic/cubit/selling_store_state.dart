import 'package:freezed_annotation/freezed_annotation.dart';

part 'selling_store_state.freezed.dart';

@freezed
class SellingStoreState with _$SellingStoreState {
  const factory SellingStoreState.initial() = _Initial;
  const factory SellingStoreState.loading() = _Loading;
  const factory SellingStoreState.uploading({@Default(0.0) double progress}) = _Uploading;
  const factory SellingStoreState.success({required String message}) = _Success;
  const factory SellingStoreState.error({required String error}) = _Error;
}