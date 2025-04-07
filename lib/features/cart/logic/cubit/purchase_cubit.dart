import 'package:flutter_bloc/flutter_bloc.dart';
import '../../data/repo/purchase_repo.dart';
import 'sell_purchase_state.dart';
import '../../../search/data/model/search_response.dart';

class PurchaseCubit extends Cubit<SellAndPurchaseState> {
  final PurchaseRepo _purchaseRepo;
  int currentPage = 1;
  bool isLoadingMore = false;
  bool hasMorePages = true;
  List<Data> allData = [];

  PurchaseCubit(this._purchaseRepo) : super(const SellAndPurchaseState.initial()) {
    emitPurchaseState();
  }

  Future<void> emitPurchaseState() async {
    try {
      if (currentPage == 1) {
        emit(const SellAndPurchaseState.loading());
      }
      
      final response = await _purchaseRepo.purchase(page: currentPage);
      
      await response.when(
        success: (response) async {
          if (response.data?.isNotEmpty == true) {
            if (currentPage == 1) {
              allData = response.data!;
            } else {
              allData.addAll(response.data!);
            }
            
            hasMorePages = response.links?.next != null;
            
            emit(SellAndPurchaseState.success(
              searchResponse: SearchResponse(
                data: allData,
                links: response.links,
                meta: response.meta,
              ),
            ));
          } else {
            hasMorePages = false;
            if (currentPage == 1) {
              emit(const SellAndPurchaseState.error(error: "لا توجد بيانات"));
            }
          }
        },
        failure: (error) {
          if (currentPage == 1) {
            emit(SellAndPurchaseState.error(error: error.apiErrorModel.msg));
          }
        },
      );
    } catch (e) {
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
      await emitPurchaseState();
    } finally {
      isLoadingMore = false;
    }
  }

  Future<void> refresh() async {
    currentPage = 1;
    hasMorePages = true;
    allData.clear();
    await emitPurchaseState();
  }
}


