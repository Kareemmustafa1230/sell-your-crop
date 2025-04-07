import 'package:sell_your_crop/features/setting/data/data_source/get_profile_data_source.dart';
import 'package:sell_your_crop/features/setting/data/model/request_model/up_date_profile_request.dart';
import 'package:sell_your_crop/features/setting/data/model/response_model/get_profile_response.dart';
import '../../../../core/error/api_error_handler.dart';
import '../../../../core/networking/api/api_result.dart';

class GetProfileRepo {
  final GetProfileDataSource _getProfileDataSource;

  GetProfileRepo(this._getProfileDataSource);

  Future<ApiResult<GetProfileResponse>> getProfile() async {
    try {
      final response = await _getProfileDataSource.getProfile();
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }

  Future<ApiResult<GetProfileResponse>> upDataProfile(UpdateProfileRequest updateProfileRequest) async {
    try {
      final response = await _getProfileDataSource.upDataProfile(updateProfileRequest);
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }

}