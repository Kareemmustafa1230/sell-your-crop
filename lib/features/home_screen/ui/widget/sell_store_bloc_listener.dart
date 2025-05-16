import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sell_your_crop/core/helpers/extensions.dart';
import 'package:sell_your_crop/features/home/ui/screen/home_screen.dart';
import 'package:sell_your_crop/features/home_screen/logic/cubit/selling_store_cubit.dart';
import 'package:sell_your_crop/features/home_screen/logic/cubit/selling_store_state.dart';
import '../../../../core/widget/toast.dart';

class SellStoreBlocListener extends StatelessWidget {
  const SellStoreBlocListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<SellingStoreCubit, SellingStoreState>(
      listener: (context, state) async {
        state.maybeWhen(
          success: (message) {
            toast(text: message, color: Colors.green);
            context.pushWithTransition(screen: const Home());
          },
          error: (error) {
            toast(text: error, color: Colors.red);
          },
          orElse: () {},
        );
      },
      child: const SizedBox.shrink(),
    );
  }
}
