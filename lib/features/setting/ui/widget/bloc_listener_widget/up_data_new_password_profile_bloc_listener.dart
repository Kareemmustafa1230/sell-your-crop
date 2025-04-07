import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sell_your_crop/core/helpers/extensions.dart';
import 'package:sell_your_crop/core/router/routers.dart';
import 'package:sell_your_crop/features/login/logic/cubit/login_state.dart';
import 'package:sell_your_crop/features/setting/logic/cubit/up_data_new_password_profile_cubit.dart';
import '../../../../../core/widget/toast.dart';

class UpDataNewPasswordProfileBlocListener extends StatelessWidget {
  const UpDataNewPasswordProfileBlocListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<UpDataNewPasswordProfileCubit,LoginState>(
      listener: (context, state) async {
        if (state is Success) {
          toast(text: state.message, color: Colors.green);
          context.pushReplacementNamed(Routes.home);
        } else if (state is Error) {
          toast(text:state.error, color: Colors.red);
        }
      },
      child: const SizedBox.shrink(),
    );
  }
}
