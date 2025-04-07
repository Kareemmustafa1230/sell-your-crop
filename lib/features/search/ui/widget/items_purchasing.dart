import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sell_your_crop/core/theme/Color/colors.dart';
import 'package:sell_your_crop/features/cart/logic/cubit/sell_cubit.dart';
import '../../../../core/theme/text_style/text_style.dart';

class ItemsPurchasing extends StatelessWidget {
  const ItemsPurchasing({
    super.key,
    required this.type,
    required this.quantity,
    required this.price,
    required this.date,
    required this.address,
    required this.listingId,
    required this.target,
    required this.targetIf
  });

  final String type;
  final String quantity;
  final String price;
  final String date;
  final String address;
  final String listingId;
  final String targetIf;
  final String target;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(14.w),
      margin: EdgeInsets.only(bottom: 10.h),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10.r),
        border: Border.all(
          width: 1,
          color: Colors.green,
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: Text(
                  type,
                  style: TextStyleApp.font14black00Weight500,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              SizedBox(width: 8.w),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 4.h),
                decoration: const BoxDecoration(
                    color: ColorApp.goldenrodYellow,
                    borderRadius: BorderRadius.all(Radius.circular(5))
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    if (targetIf == 'exportation' || targetIf == 'تصدير') ...[
                      SvgPicture.asset(
                        'assets/svg/Subtract.svg',
                        height: 20.h,
                        width: 20.w,
                      ),
                      SizedBox(width: 4.w),
                      Text(
                        target,
                        style: TextStyleApp.font14black00Weight500,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ] else ...[
                      SvgPicture.asset(
                        'assets/svg/Shop.svg',
                        height: 20.h,
                        width: 20.w,
                      ),
                      SizedBox(width: 4.w),
                      Text(
                        target,
                        style: TextStyleApp.font14black00Weight500,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: 12.h),
          Text(
            quantity,
            style: TextStyleApp.font14black00Weight500,
            overflow: TextOverflow.ellipsis,
          ),
          SizedBox(height: 8.h),
          Text(
            price,
            style: TextStyleApp.font14black00Weight500,
            overflow: TextOverflow.ellipsis,
          ),
          SizedBox(height: 8.h),
          Text(
            date,
            style: TextStyleApp.font14black00Weight500,
            overflow: TextOverflow.ellipsis,
          ),
          SizedBox(height: 8.h),
          Text(
            address,
            style: TextStyleApp.font14black00Weight500,
            overflow: TextOverflow.ellipsis,
          ),
          SizedBox(height: 8.h),
          Text(
            listingId,
            style: TextStyleApp.font14black00Weight500,
            overflow: TextOverflow.ellipsis,
          ),
          SizedBox(height: 12.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              InkWell(
                onTap:() {
                  context.read<SellCubit>().launchWhatsApp();
                },
                child:SvgPicture.asset('assets/svg/iOS.svg',
                  height: 35.h,
                  width: 35.w,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}