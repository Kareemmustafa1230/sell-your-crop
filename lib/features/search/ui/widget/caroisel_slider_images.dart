import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sell_your_crop/features/cart/logic/cubit/sell_cubit.dart';
import 'package:shimmer/shimmer.dart';
import '../../../../core/theme/Color/colors.dart';
import '../../../../core/theme/text_style/text_style.dart';

class CarouselSliderImages extends StatelessWidget {
  const CarouselSliderImages({
    super.key,
    required this.imageUrls,
    required this.type,
    required this.quantity,
    required this.price,
    required this.date,
    required this.address,
    required this.listingId,
    required this.targetIf,
    required this.target
  });

  final String type;
  final String quantity;
  final String price;
  final String date;
  final String address;
  final String listingId;
  final String targetIf;
  final String target;
  final List<String> imageUrls;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10.w),
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
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          CarouselSlider.builder(
            itemCount: imageUrls.length,
            itemBuilder: (context, imgIndex, realIndex) {
              return Image.network(
                imageUrls[imgIndex],
                width: double.infinity,
                height: 220.h,
                fit: BoxFit.fill,
                loadingBuilder: (context, child, loadingProgress) {
                  if (loadingProgress == null) {
                    return child;
                  }
                  return Shimmer.fromColors(
                    baseColor: Colors.grey[300]!,
                    highlightColor: Colors.grey[100]!,
                    child: Container(
                      width: double.infinity,
                      height: 220.h,
                      color: Colors.white,
                    ),
                  );
                },
              );
            },
            options: CarouselOptions(
              viewportFraction: 1,
              height: 220.h,
              enlargeCenterPage: true,
              enableInfiniteScroll: true,
              autoPlay: true,
              scrollDirection: Axis.horizontal,
            ),
          ),
          SizedBox(height: 12.h),
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
                  borderRadius: BorderRadius.all(Radius.circular(5)),
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
          SizedBox(height: 8.h),
          Row(
            children: [
              Expanded(
                child: Text(
                  quantity,
                  style: TextStyleApp.font14black00Weight500,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              SizedBox(width: 8.w),
              Expanded(
                child: Text(
                  listingId,
                  style: TextStyleApp.font14black00Weight500,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.end,
                ),
              ),
            ],
          ),
          SizedBox(height: 8.h),
          Text(
            price,
            style: TextStyleApp.font14black00Weight500,
            overflow: TextOverflow.ellipsis,
          ),
          SizedBox(height: 8.h),
          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      address,
                      style: TextStyleApp.font14black00Weight500,
                      overflow: TextOverflow.ellipsis,
                    ),
                    SizedBox(height: 4.h),
                    Text(
                      date,
                      style: TextStyleApp.font14black00Weight500,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
              InkWell(
                onTap: () {
                  context.read<SellCubit>().launchWhatsApp();
                },
                child: SvgPicture.asset(
                  'assets/svg/iOS.svg',
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