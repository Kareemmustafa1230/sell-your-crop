import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sell_your_crop/features/setting/data/repo/delete_profile_repo.dart';
import 'package:sell_your_crop/features/setting/logic/state_cubit/complaint_state.dart';


class DeleteProfileCubit extends Cubit<ComplaintState> {
  final DeleteProfileRepo _deleteProfileRepo;

  DeleteProfileCubit(this._deleteProfileRepo) : super(const ComplaintState.initial());

  Future<void> emitDeleteProfileState() async {
    emit(const ComplaintState.loading());
    final resendOtpResponse = await _deleteProfileRepo.deleteProfile();
    await resendOtpResponse.when(
      success: (response) async {
        emit(ComplaintState.success(message: response.msg!));
      },
      failure: (error) {
        emit(ComplaintState.error(error: error.apiErrorModel.msg));
      },
    );
  }
}

