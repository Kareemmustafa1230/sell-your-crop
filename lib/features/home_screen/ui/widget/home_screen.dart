import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sell_your_crop/core/helpers/extensions.dart';
import 'package:sell_your_crop/core/language/lang_keys.dart';
import 'package:sell_your_crop/core/theme/Color/colors.dart';
import 'package:sell_your_crop/core/theme/text_style/text_style.dart';
import 'package:sell_your_crop/features/home_screen/ui/widget/items_home_page_screen.dart';
import '../../../../core/router/routers.dart';

class HomePageScreen extends StatelessWidget {
  const HomePageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              SizedBox(height: 35.h),
              Text(context.translate(LangKeys.homePage), style: TextStyleApp.font22black00Weight500.copyWith(fontWeight: FontWeight.w600, color: ColorApp.black00),),
              SizedBox(height: 25.h,),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 4.w),
                child: Image.asset('assets/images/aya.png', height: 60.h, width: double.infinity,),
              ),
              SizedBox(height: 90.h),
              Row(
               mainAxisAlignment:MainAxisAlignment.center,
               children: [
                  ItemsHomePageScreen(text: context.translate(LangKeys.purchaseRequest), image: 'assets/images/purchase.png', colorText:ColorApp.brown40, colorContainer: ColorApp.redED, onTap: () {
                    context.pushNamed(Routes.purchaseRequest);
                    },),
                  SizedBox(width: 12.w),
                  ItemsHomePageScreen(text: context.translate(LangKeys.sellRequest), image: 'assets/images/sell.png', colorText: ColorApp.blueC1, colorContainer: ColorApp.greenE4, onTap: () {
                    context.pushNamed(Routes.sellRequest);
                  },),
               ],
             ),
              SizedBox(height: 8.h),
               ItemsHomePageScreen(text:  context.translate(LangKeys.companyOwnerData), image: 'assets/images/company.png', colorText: ColorApp.purpleD1, colorContainer: ColorApp.purpleD9, onTap: () {
                 context.pushNamed(Routes.partner);
               },),
            ],
          ),
        ),
      )
    );
  }
}
