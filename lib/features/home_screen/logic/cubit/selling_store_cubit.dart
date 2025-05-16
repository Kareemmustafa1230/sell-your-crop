import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sell_your_crop/features/home_screen/data/model/selling_store_request.dart';
import 'package:sell_your_crop/features/home_screen/data/repo/selling_store_repo.dart';
import 'package:sell_your_crop/features/home_screen/logic/cubit/selling_store_state.dart';
import 'package:dio/dio.dart';
import 'dart:io';

class SellingStoreCubit extends Cubit<SellingStoreState> {
  final SellingStoreRepo _sellingStoreRepo;
  final Dio _dio = Dio();
  TextEditingController genreController = TextEditingController();
  int? cityId;
  String? target;
  List<XFile> img = []; // قائمة الصور
  XFile? video; // متغير الفيديو
  List<XFile> selectedImages = [];
  XFile? selectedVideo;

  TextEditingController quantityController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  SellingStoreCubit(this._sellingStoreRepo) : super(const SellingStoreState.initial());
  void clearAll() {
    genreController.clear();
    cityId = null;
    target = null;
    selectedImages.clear();
    selectedVideo = null;
    quantityController.clear();
    priceController.clear();
    phoneController.clear();
    emit(const SellingStoreState.initial());
  }
  Future<void> emitSellingStoreStates() async {
    emit(const SellingStoreState.loading());

    if (selectedImages.isEmpty && selectedVideo == null) {
      emit(const SellingStoreState.error(error: "No images or video selected"));
      return;
    }

    try {
      double totalProgress = 0.0;
      int totalFiles = selectedImages.length + (selectedVideo != null ? 1 : 0);
      int completedFiles = 0;

      // Upload images
      for (var image in selectedImages) {
        final file = File(image.path);
        final fileSize = await file.length();
        int uploadedBytes = 0;

        // Upload in chunks and update progress
        while (uploadedBytes < fileSize) {
          uploadedBytes += (fileSize ~/ 10); // Upload in chunks
          if (uploadedBytes > fileSize) uploadedBytes = fileSize;
          
          totalProgress = (completedFiles + (uploadedBytes / fileSize)) / totalFiles;
          emit(SellingStoreState.uploading(progress: totalProgress));
          
          // Simulate network delay for each chunk
          await Future.delayed(const Duration(milliseconds: 50));
        }
        completedFiles++;
      }

      // Upload video if exists
      if (selectedVideo != null) {
        final videoFile = File(selectedVideo!.path);
        final videoSize = await videoFile.length();
        int uploadedBytes = 0;

        // Upload video in smaller chunks for smoother progress
        while (uploadedBytes < videoSize) {
          uploadedBytes += (videoSize ~/ 20); // Smaller chunks for video
          if (uploadedBytes > videoSize) uploadedBytes = videoSize;
          
          totalProgress = (completedFiles + (uploadedBytes / videoSize)) / totalFiles;
          emit(SellingStoreState.uploading(progress: totalProgress));
          
          // Simulate network delay for each chunk
          await Future.delayed(const Duration(milliseconds: 100));
        }
        completedFiles++;
      }

      final imagePaths = selectedImages.map((file) => file.path).toList();
      final videoPath = selectedVideo?.path ?? "";

      final sellingStoreRequest = SellingStoreRequest(
        genre: genreController.text,
        target: target.toString(),
        quantity: quantityController.text,
        price: priceController.text,
        phone: phoneController.text,
        cityId: cityId.toString(),
        type: 'sell',
        img: imagePaths.isNotEmpty ? imagePaths : [],
        video: videoPath.isNotEmpty ? videoPath : '',
      );
      final response = await _sellingStoreRepo.sellingStore(sellingStoreRequest);

      await response.when(
        success: (response) async {
          emit(SellingStoreState.success(message: response.msg!));
        },
        failure: (error) {
          emit(SellingStoreState.error(error: error.apiErrorModel.msg));
        },
      );
    } catch (e) {
      emit(SellingStoreState.error(error: e.toString()));
    }
  }
}