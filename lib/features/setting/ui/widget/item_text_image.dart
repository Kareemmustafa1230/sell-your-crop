import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sell_your_crop/core/helpers/extensions.dart';
import 'package:sell_your_crop/core/theme/text_style/text_style.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../core/language/lang_keys.dart';

class ItemTextImage extends StatelessWidget {
  const ItemTextImage({super.key, required this.name, required this.phone, required this.image});
  final String name ;
  final String phone;
  final String image;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(right: 28.w,left: 18.w),
      width: double.infinity,
      height: 120.h,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text('${context.translate(LangKeys.name)} : ',style: TextStyleApp.font18black00Weight400.copyWith(fontWeight: FontWeight.w500),),
                  Text(name),
                ],
              ),
              SizedBox(height: 13.h,),
              Row(
                children: [
                  Text('${context.translate(LangKeys.number)} : ',style: TextStyleApp.font18black00Weight400.copyWith(fontWeight: FontWeight.w500),),
                  Text(phone),
                ],
              ),
            ],
          ),
          const Spacer(),
           Container(
             width:85.w,
             height: 120.h,
             decoration: BoxDecoration(
               color: Colors.grey,
               borderRadius: BorderRadius.circular(10.r),
             ),
             child: Image.network(
               image,
               width:85.w ,
               height: 120.h,
               fit: BoxFit.fill,
                errorBuilder:(context, error, stackTrace) {
                  return Shimmer.fromColors(
                    baseColor: Colors.grey[300]!,
                    highlightColor: Colors.grey[100]!,
                    child: Container(
                      width: 85.w,
                      height: 900.h,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.r),
                      ),
                    ),
                  );
                } ,
                loadingBuilder:(context, child, loadingProgress) {
                      if (loadingProgress == null) {
                        return child;
                      } else {
                        return Shimmer.fromColors(
                          baseColor: Colors.grey[300]!,
                          highlightColor: Colors.grey[100]!,
                          child: Container(
                            width: double.infinity,
                            height: 900.h,
                            color: Colors.white,
                          ),
                        );
                      }
                    },
              ),
           ),
        ],
      ),
    );
  }
}
