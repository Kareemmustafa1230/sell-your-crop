import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sell_your_crop/features/cart/data/repo/sell_repo.dart';
import 'package:sell_your_crop/features/search/data/model/search_response.dart';
import 'package:url_launcher/url_launcher.dart';
import 'sell_purchase_state.dart';

class SellCubit extends Cubit<SellAndPurchaseState> {
  final SellRepo _sellRepo;
  int currentPage = 1;
  bool isLoadingMore = false;
  bool hasMorePages = true;
  List<Data> allData = [];

  SellCubit(this._sellRepo) : super(const SellAndPurchaseState.initial()){
    emitSellState();
  }

    Future<void> emitSellState() async {
      try {
        if (currentPage == 1) {
          emit(const SellAndPurchaseState.loading());
        }
          final response = await _sellRepo.sell(page: currentPage);
          await response.when(
              success: (response) async{
                if(response.data?.isNotEmpty == true){
                  if (currentPage == 1) {
                    allData = response.data!;
                  } else {
                    allData.addAll(response.data!);
                  }
                  hasMorePages = response.links?.next != null;
                  emit(SellAndPurchaseState.success(
                    searchResponse: SearchResponse(
                      status: response.status,
                      msg: response.msg,
                      data: allData,
                      links: response.links,
                      meta: response.meta,
                    ),
                  ));
                }else{
                  hasMorePages = false;
                  if(currentPage == 1){
                    emit(const SellAndPurchaseState.error(error: 'لا توجد بيانات'));
                  }
                }
              }, 
              failure: (error){
                if(currentPage == 1){
                  emit( SellAndPurchaseState.error(error: error.apiErrorModel.msg));
                }
              }
          );
      } catch (e){
        if (currentPage == 1) {
          emit(SellAndPurchaseState.error(error: e.toString()));
        }
      }
    }

  Future<void> loadMore() async {
    if (isLoadingMore || !hasMorePages) return;

    try {
      isLoadingMore = true;
      currentPage++;
      await emitSellState();
    } finally {
      isLoadingMore = false;
    }
  }

  Future<void> refresh() async {
    currentPage = 1;
    hasMorePages = true;
    allData.clear();
    await emitSellState();
  }

  void launchWhatsApp()async{
    String phoneNumber = '201033895514';
    await launch('https://wa.me/$phoneNumber?text=مرحبا');
  }
  }