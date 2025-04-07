import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sell_your_crop/features/setting/data/model/request_model/up_date_profile_request.dart';
import 'package:sell_your_crop/features/setting/data/repo/get_profile_repo.dart';
import 'package:sell_your_crop/features/setting/logic/state_cubit/get_profile_state.dart';


class GetProfileCubit extends Cubit<ProfileState> {
  final GetProfileRepo _getProfileRepo;
  final formKey = GlobalKey<FormState>();
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  GetProfileCubit(this._getProfileRepo) : super(const ProfileState.initial());

  Future<void> emitGetProfileStates() async {
    emit(const ProfileState.loading());
    final response = await _getProfileRepo.getProfile();
    await response.when(
        success: (response) async{
      emit(ProfileState.loadSuccess(getProfileResponse: response));
       nameController.text = response.data?.name ?? '';
       phoneController.text = response.data?.mobile ?? '';
        }, failure: (error) {
      emit(ProfileState.error(error: error.apiErrorModel.msg));
    });
  }

  Future<void> emitUpDataProfileState() async {
      emit(const ProfileState.loading());
      final response = await _getProfileRepo.upDataProfile(
        UpdateProfileRequest(
           mobile: phoneController.text,
           name: nameController.text,
        ),
      );
      await response.when(
        success: (response) async {
          emit(ProfileState.updateSuccess(message: response.msg!));
        },
        failure: (error) {
          emit(ProfileState.error(error: error.apiErrorModel.msg));
        },
      );
  }
}


