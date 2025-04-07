import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sell_your_crop/features/login/logic/cubit/login_state.dart';
import 'package:sell_your_crop/features/setting/data/repo/up_data_new_password_profile_repo.dart';
import '../../data/model/request_model/up_data_password_request.dart';


class UpDataNewPasswordProfileCubit extends Cubit<LoginState> {
  final UpDataNewPasswordProfileRepo _upDataNewPasswordProfileRepo;
  TextEditingController oldPasswordController = TextEditingController();
  TextEditingController newPasswordController = TextEditingController();
  TextEditingController confirmationPasswordController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  UpDataNewPasswordProfileCubit(this._upDataNewPasswordProfileRepo) : super(const LoginState.initial());

  Future<void> emitUpDataNwPasswordProfileState() async {
    emit(const LoginState.loading());
    final resendOtpResponse = await _upDataNewPasswordProfileRepo.updateNewPasswordProfile(
        UpDataPasswordRequest(
            password: newPasswordController.text,
            passwordConfirmation: confirmationPasswordController.text,
            oldPassword: oldPasswordController.text
      )
    );
    await resendOtpResponse.when(
      success: (response) async {
        emit(LoginState.success(message: response.msg!));
      },
      failure: (error) {
        emit(LoginState.error(error: error.apiErrorModel.msg));
      },
    );
  }
}

