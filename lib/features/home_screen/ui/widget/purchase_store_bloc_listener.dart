import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sell_your_crop/core/helpers/extensions.dart';
import 'package:sell_your_crop/features/home/ui/screen/home_screen.dart';
import 'package:sell_your_crop/features/home_screen/logic/cubit/purchase_store_cubit.dart';
import 'package:sell_your_crop/features/home_screen/logic/cubit/purchase_store_state.dart';
import '../../../../core/widget/toast.dart';

class PurchaseStoreBlocListener extends StatelessWidget {
  const PurchaseStoreBlocListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<PurchaseStoreCubit, PurchaseStoreState>(
      listener: (context, state) async {
        if (state is Success) {
          toast(text: state.message, color: Colors.green);
          context.pushWithTransition(screen:const Home());
        } else if (state is Error) {
          toast(text:state.error, color: Colors.red);
        } else if (state is Loading) {
        }
      },
      child: const SizedBox.shrink(),
    );
  }
}
