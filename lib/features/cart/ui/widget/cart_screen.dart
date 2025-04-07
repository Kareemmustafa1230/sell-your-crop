import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sell_your_crop/core/helpers/animate_do.dart';
import 'package:sell_your_crop/core/helpers/extensions.dart';
import 'package:sell_your_crop/core/language/lang_keys.dart';
import 'package:sell_your_crop/core/router/routers.dart';
import 'package:sell_your_crop/core/theme/text_style/text_style.dart';
import 'package:sell_your_crop/features/cart/ui/widget/cart_text_container.dart';
import '../../../../core/theme/Color/colors.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});
//context.translate(LangKeys.accountSettings)
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Padding(
        padding:  EdgeInsets.only(right:23.w,left:23.w ),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 35.h),
              Text(context.translate(LangKeys.shopping),
                style: TextStyleApp.font24whiteFFWeight600.copyWith(color: ColorApp.black00,),),
              SizedBox(height: 140.h),
              CustomFadeInRight(
                duration: 500,
                child: CartTextContainer(text: context.translate(LangKeys.selling),
                onTap:(){
                  context.pushNamed(Routes.sell);
                },
              ),
            ),
              SizedBox(height: 56.h),
          CustomFadeInLeft(
            duration: 500,
            child:CartTextContainer(text: context.translate(LangKeys.purchasing),
                onTap: () {
                  context.pushNamed(Routes.purchase);
                },
              ),
             ),
            ],
          ),
        ),
      ),
    );
  }
}
