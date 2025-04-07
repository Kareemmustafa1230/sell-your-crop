import 'package:sell_your_crop/core/helpers/shared_pref_helper.dart';
import 'package:sell_your_crop/core/networking/api/api_service.dart';
import 'package:sell_your_crop/core/networking/constants/api_constants.dart';
import 'package:sell_your_crop/core/networking/di/dependency_injection.dart';
import 'package:sell_your_crop/features/forget_password/data/model/code_otp_request.dart';
import 'package:sell_your_crop/features/forget_password/data/model/code_otp_and_up_data_password_profile_response.dart';
import '../../../../core/error/api_error_handler.dart';

class CodeOtpDataSource {
  final ApiService _apiService;

  CodeOtpDataSource(this._apiService);

  // CodeOtp
  Future<CodeOtpAndUpDataPasswordProfileResponse> verifyOtp(CodeOtpRequest codeOtpRequest ) async {
    try {
      final response = await _apiService.verifyOtp(
          codeOtpRequest,
          'application/json',
          '${getIt<SharedPrefHelper>().getData(key: ApiKey.language)}'

    );
      return response;
    } catch (e) {
      throw ErrorHandler.handle(e).apiErrorModel;
    }
  }
}
