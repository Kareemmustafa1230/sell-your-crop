import 'package:sell_your_crop/core/helpers/shared_pref_helper.dart';
import 'package:sell_your_crop/core/networking/api/api_service.dart';
import 'package:sell_your_crop/core/networking/constants/api_constants.dart';
import 'package:sell_your_crop/core/networking/di/dependency_injection.dart';
import 'package:sell_your_crop/features/forget_password/data/model/change_password_request.dart';
import '../../../../core/error/api_error_handler.dart';
import '../model/number_phone_change_password_log_out_response.dart';

class ChangePasswordDataSource {
  final ApiService _apiService;

  ChangePasswordDataSource(this._apiService);

  // ChangePassword
  Future<NumberPhoneAndChangePasswordAndLogOutAndComplaintAndTechnicalSupportResponse> changePassword( ChangePasswordRequest changePasswordRequest ) async {
    try {
      final response = await _apiService.changePassword(changePasswordRequest,
      'application/json',
          '${getIt<SharedPrefHelper>().getData(key: ApiKey.language)}'
      );
      return response;
    } catch (e) {
      throw ErrorHandler.handle(e).apiErrorModel;
    }
  }
  }
