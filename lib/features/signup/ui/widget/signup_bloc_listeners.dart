import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sell_your_crop/core/helpers/extensions.dart';
import '../../../../core/router/routers.dart';
import '../../../../core/widget/toast.dart';
import '../../logic/cubit/sign_up_user_cubit.dart';
import '../../logic/cubit/sign_up_user_state.dart';

class SignupBlocListeners extends StatelessWidget {
  const SignupBlocListeners({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<SignUpUserCubit, SignupState>(
      listener: (context, state) async {
        if (state is Success) {
          toast(text: state.message, color: Colors.green);
          context.pushNamed(Routes.home);
        } else if (state is Error) {
          toast(text: state.error, color: Colors.red);
        } else if (state is Loading) {
        }
      },
      child: const SizedBox.shrink(),
    );
  }
}
