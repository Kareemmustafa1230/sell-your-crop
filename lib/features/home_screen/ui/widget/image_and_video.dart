import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sell_your_crop/features/home_screen/logic/cubit/selling_store_cubit.dart';
import 'package:sell_your_crop/features/home_screen/ui/widget/picture_image_or_video.dart';

class ImageAndVideo extends StatefulWidget {
  const ImageAndVideo({super.key});

  @override
  State<ImageAndVideo> createState() => _ImageAndVideoState();
}

class _ImageAndVideoState extends State<ImageAndVideo> {
  final ImagePicker _picker = ImagePicker();
  List<XFile> selectedImages = [];
  XFile? selectedVideo;

  Future<void> pickImages() async {
    final pickedImages = await _picker.pickMultiImage();
    if (pickedImages.isNotEmpty) {
      setState(() {
        selectedImages = pickedImages;
      });

      context.read<SellingStoreCubit>().selectedImages = selectedImages;
    }
  }

  Future<void> pickVideo() async {
    final pickedVideo = await _picker.pickVideo(source: ImageSource.gallery);
    if (pickedVideo != null) {
      setState(() {
        selectedVideo = pickedVideo;
      });

      context.read<SellingStoreCubit>().selectedVideo = selectedVideo;
    }
  }

  void removeImage(int index) {
    setState(() {
      selectedImages.removeAt(index);
    });
  }

  void removeVideo() {
    setState(() {
      selectedVideo = null;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            PictureImageOrVideo(
              onTap: selectedVideo != null ? null : pickImages,
              icon: Icon(
                CupertinoIcons.photo,
                size: 30,
                color: selectedVideo != null ? Colors.grey : Colors.black,
              ),
            ),
            SizedBox(width: 75.w),
            PictureImageOrVideo(
              onTap: selectedImages.isNotEmpty ? null : pickVideo,
              icon: Icon(
                CupertinoIcons.videocam_fill,
                size: 30,
                color: selectedImages.isNotEmpty ? Colors.grey : Colors.black,
              ),
            ),
          ],
        ),

        if (selectedImages.isNotEmpty) ...[
          SizedBox(height: 20.h),
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              crossAxisSpacing: 8,
              mainAxisSpacing: 8,
              childAspectRatio: 1,
            ),
            itemCount: selectedImages.length,
            itemBuilder: (context, index) {
              return Stack(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.file(
                      File(selectedImages[index].path),
                      width: double.infinity,
                      height: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Positioned(
                    top: 5,
                    right: 5,
                    child: InkWell(
                      onTap: () => removeImage(index),
                      child: Container(
                        padding: const EdgeInsets.all(4),
                        decoration: const BoxDecoration(
                          color: Colors.red,
                          shape: BoxShape.circle,
                        ),
                        child: const Icon(
                          Icons.close,
                          color: Colors.white,
                          size: 16,
                        ),
                      ),
                    ),
                  ),
                ],
              );
            },
          ),
        ],

        if (selectedVideo != null) ...[
          SizedBox(height: 20.h),
          Stack(
            children: [
              Container(
                width: double.infinity,
                height: 200.h,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const Center(
                  child: Icon(
                    Icons.play_circle_outline,
                    size: 50,
                    color: Colors.grey,
                  ),
                ),
              ),
              Positioned(
                top: 5,
                right: 5,
                child: InkWell(
                  onTap: removeVideo,
                  child: Container(
                    padding: const EdgeInsets.all(4),
                    decoration: const BoxDecoration(
                      color: Colors.red,
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(
                      Icons.close,
                      color: Colors.white,
                      size: 16,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ],
    );
  }
}
