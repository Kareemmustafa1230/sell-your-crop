import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sell_your_crop/core/helpers/extensions.dart';
import 'package:sell_your_crop/core/helpers/shared_pref_helper.dart';
import 'package:sell_your_crop/core/networking/constants/api_constants.dart';
import 'package:sell_your_crop/core/networking/di/dependency_injection.dart';
import 'package:sell_your_crop/features/setting/logic/cubit/log_out_cubit.dart';
import 'package:sell_your_crop/features/setting/logic/state_cubit/log_out_state.dart';
import '../../../../../core/router/routers.dart';
import '../../../../../core/widget/toast.dart';

class LogOutBlocListeners extends StatelessWidget {
  const LogOutBlocListeners({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<LogOutCubit,LogOutState>(
      listener: (context, state) async {
        if (state is Success) {
          toast(text: state.message, color: Colors.green);
          context.pushNamed(Routes.onboarding);
          SystemNavigator.pop();
          await getIt<SharedPrefHelper>().removeData(key: ApiKey.authorization);
          await getIt<SharedPrefHelper>().clearData();
        } else if (state is Error) {
          toast(text:state.error, color: Colors.red);
        } else if (state is Loading) {
        }
      },
      child: const SizedBox.shrink(),
    );
  }
}
