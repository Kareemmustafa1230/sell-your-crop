import 'package:dio/dio.dart';
import 'package:sell_your_crop/core/networking/api/api_service.dart';
import 'package:sell_your_crop/features/forget_password/data/model/number_phone_change_password_log_out_response.dart';
import '../../../../core/error/api_error_handler.dart';
import '../../../../core/helpers/shared_pref_helper.dart';
import '../../../../core/networking/constants/api_constants.dart';
import '../../../../core/networking/di/dependency_injection.dart';

class DeleteProfileDataSource {
  final ApiService _apiService;

  DeleteProfileDataSource(this._apiService);

  // deleteProfile
  Future<NumberPhoneAndChangePasswordAndLogOutAndComplaintAndTechnicalSupportResponse> deleteProfile() async {
    try {
      final response = await _apiService.deleteProfile(
         '${getIt<SharedPrefHelper>().getData(key: ApiKey.authorization)}'
    );
      return response;
    } on DioException catch (e) {
      throw ErrorHandler.handle(e).apiErrorModel;
    }
  }
}