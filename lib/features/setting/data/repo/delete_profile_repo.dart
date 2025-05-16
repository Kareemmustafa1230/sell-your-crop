import 'package:sell_your_crop/features/forget_password/data/model/number_phone_change_password_log_out_response.dart';
import 'package:sell_your_crop/features/setting/data/data_source/delete_profile_data_source.dart';
import '../../../../core/error/api_error_handler.dart';
import '../../../../core/networking/api/api_result.dart';

class DeleteProfileRepo {
  final DeleteProfileDataSource _deleteProfileDataSource;

  DeleteProfileRepo(this._deleteProfileDataSource);

  Future<ApiResult<NumberPhoneAndChangePasswordAndLogOutAndComplaintAndTechnicalSupportResponse>> deleteProfile() async {
    try {
      final response = await _deleteProfileDataSource.deleteProfile();
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }
}