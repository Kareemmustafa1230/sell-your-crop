import 'package:dio/dio.dart';
import 'package:sell_your_crop/core/helpers/shared_pref_helper.dart';
import 'package:sell_your_crop/core/networking/api/api_service.dart';
import 'package:sell_your_crop/core/networking/constants/api_constants.dart';
import 'package:sell_your_crop/core/networking/di/dependency_injection.dart';
import 'package:sell_your_crop/features/setting/data/model/request_model/up_date_profile_request.dart';
import 'package:sell_your_crop/features/setting/data/model/response_model/get_profile_response.dart';
import '../../../../core/error/api_error_handler.dart';

class GetProfileDataSource {
  final ApiService _apiService;

  GetProfileDataSource(this._apiService);

  // GetProfile
  Future<GetProfileResponse> getProfile() async {
    try {
      final response = await _apiService.getProfile(
         'application/json'
    );
      return response;
    } on DioException catch (e) {
      throw ErrorHandler.handle(e).apiErrorModel;
    }
  }

  Future<GetProfileResponse> upDataProfile(UpdateProfileRequest updateProfileRequest) async {
    try {
      final response = await _apiService.updateProfile(
        updateProfileRequest ,
        '${getIt<SharedPrefHelper>().getData(key: ApiKey.language)}',
        'application/json',
      );
      return response;
    } on DioException catch (e) {
      throw ErrorHandler.handle(e).apiErrorModel;
    }
  }
}