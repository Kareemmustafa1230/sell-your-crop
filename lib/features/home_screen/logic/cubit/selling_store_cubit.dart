import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sell_your_crop/features/home_screen/data/model/selling_store_request.dart';
import 'package:sell_your_crop/features/home_screen/data/repo/selling_store_repo.dart';
import 'package:sell_your_crop/features/home_screen/logic/cubit/selling_store_state.dart';

class SellingStoreCubit extends Cubit<SellingStoreState> {
  final SellingStoreRepo _sellingStoreRepo;
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

  Future<void> emitSellingStoreStates() async {
    emit(const SellingStoreState.loading());

    if (selectedImages.isEmpty && selectedVideo == null) {
      emit(const SellingStoreState.error(error: "No images or video selected"));
      return;
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
  }
}