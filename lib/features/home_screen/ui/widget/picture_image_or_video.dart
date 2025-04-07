import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PictureImageOrVideo extends StatelessWidget {
  const PictureImageOrVideo({
    super.key,
    required this.onTap,
    required this.icon,
  });

  final VoidCallback? onTap;
  final Icon icon;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: 100.w,
        height: 100.h,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10.r),
          border: Border.all(
            width: 1,
            color: Colors.grey,
          ),
        ),
        child: icon,
      ),
    );
  }
}
