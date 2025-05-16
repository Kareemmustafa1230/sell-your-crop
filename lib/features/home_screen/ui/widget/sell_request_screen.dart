import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sell_your_crop/core/helpers/extensions.dart';
import 'package:sell_your_crop/core/language/lang_keys.dart';
import 'package:sell_your_crop/core/theme/Color/colors.dart';
import 'package:sell_your_crop/core/theme/text_style/text_style.dart';
import 'package:sell_your_crop/features/home_screen/ui/widget/add_crop_user.dart';
import 'package:sell_your_crop/features/home_screen/ui/widget/button_sell.dart';
import 'package:sell_your_crop/features/home_screen/ui/widget/image_and_video.dart';
import 'package:sell_your_crop/features/home_screen/ui/widget/sell_store_bloc_listener.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sell_your_crop/features/home_screen/logic/cubit/selling_store_cubit.dart';
import 'package:sell_your_crop/features/home_screen/logic/cubit/selling_store_state.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

import '../../../../core/widget/text_app.dart';

class SellRequestScreen extends StatelessWidget {
  const SellRequestScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorApp.whiteFF,
      appBar: AppBar(
        title: Text(context.translate(LangKeys.addACrop),
          style: TextStyleApp.font24whiteFFWeight600.copyWith(color: ColorApp.black00),),
        elevation: 0,
        backgroundColor: ColorApp.whiteFF,
        centerTitle: true,
        clipBehavior: Clip.antiAlias,
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Padding(
              padding:  EdgeInsets.symmetric(horizontal: 20.w,vertical: 24.h),
              child:  Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                   AddCropUser(),
                  SizedBox(height: 22.h),
                  TextApp(text: context.translate(LangKeys.aDDPicture), style: TextStyleApp.font18black00Weight400),
                  SizedBox(height: 35.h),
                  const ImageAndVideo(),
                  SizedBox(height: 100.h),
                  const ButtonSell(),
                  const SellStoreBlocListener(),
                  SizedBox(height: 100.h),
                ],
              ),
            ),
          ),
          BlocBuilder<SellingStoreCubit, SellingStoreState>(
            builder: (context, state) {
              return state.maybeWhen(
                loading: () => _buildLoadingOverlay(context, 0),
                uploading: (progress) => _buildLoadingOverlay(context, progress),
                orElse: () => const SizedBox.shrink(),
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _buildLoadingOverlay(BuildContext context, double progress) {
    return Container(
      color: Colors.black.withOpacity(0.5),
      child: Center(
        child: Container(
          width: 300.w,
          padding: EdgeInsets.all(20.w),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15.r),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                blurRadius: 10,
                spreadRadius: 2,
              ),
            ],
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              LoadingAnimationWidget.staggeredDotsWave(
                color: ColorApp.green73,
                size: 50,
              ),
              SizedBox(height: 20.h),
              Text(
                context.translate(LangKeys.addACrop),
                style: TextStyleApp.font18black00Weight400,
              ),
              SizedBox(height: 10.h),
              Text(
                'جاري رفع المحتوى...',
                style: TextStyleApp.font18black00Weight400.copyWith(
                  color: Colors.grey,
                ),
              ),
              SizedBox(height: 15.h),
              ClipRRect(
                borderRadius: BorderRadius.circular(10.r),
                child: LinearProgressIndicator(
                  value: progress,
                  backgroundColor: Colors.grey[200],
                  valueColor: AlwaysStoppedAnimation<Color>(ColorApp.green73),
                  minHeight: 8.h,
                ),
              ),
              SizedBox(height: 10.h),
              Text(
                '${(progress * 100).toInt()}%',
                style: TextStyleApp.font18black00Weight400.copyWith(
                  color: ColorApp.green73,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
