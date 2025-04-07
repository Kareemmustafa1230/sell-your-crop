import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sell_your_crop/features/search/data/model/search_response.dart';
import '../../data/repo/search_repo.dart';
import 'search_state.dart';
import 'dart:async';

class SearchCubit extends Cubit<SearchState> {

  final SearchRepo _searchRepo;
  int currentPage = 1;
  bool isLoadingMore = false;
  bool hasMorePages = true;
  List<Data> allData = [];
  Timer? _debounce;
  SearchCubit(this._searchRepo) : super(const SearchState.initial());
  TextEditingController searchController = TextEditingController();
  Future<void> emitSearchState({required String searchQuery}) async {

    if (searchQuery.isEmpty) {
      emit(const SearchState.initial());
      allData.clear();
      currentPage = 1;
      hasMorePages = true;
      return;
    }

    if (_debounce?.isActive ?? false) _debounce?.cancel();
    _debounce = Timer(const Duration(milliseconds: 500), () async {
      try {
        if (currentPage == 1) {
          emit(const SearchState.loading());
        }
        final response = await _searchRepo.search(
          searchQuery: searchQuery,
          page: currentPage,
        );
        await response.when(
          success: (response) async {
            if (response.data?.isNotEmpty == true) {
              if (currentPage == 1) {
                allData = response.data!;
              } else {
                allData.addAll(response.data!);
              }
              final nextPageUrl = response.links?.next;
              hasMorePages = nextPageUrl != null && nextPageUrl.contains('page=');
              emit(SearchState.success(
                searchResponse: SearchResponse(
                  status: response.status,
                  msg: response.msg,
                  data: allData,
                  links: response.links,
                  meta: response.meta,

                ),
              ));
            } else {
              hasMorePages = false;
              if (currentPage == 1) {
                emit(const SearchState.error(error: 'لا توجد بيانات'));
              }
            }
          },
          failure: (error) {
            if (currentPage == 1) {
              emit(SearchState.error(error: error.apiErrorModel.msg));
            }
          },
        );
      } catch (e) {
        if (currentPage == 1) {
          emit(SearchState.error(error: e.toString()));
        }
      }
    });

  }
  Future<void> loadMore() async {
    if (isLoadingMore || !hasMorePages || searchController.text.isEmpty) return;
    try {
      isLoadingMore = true;
      currentPage++;
      final response = await _searchRepo.search(
        searchQuery: searchController.text,
        page: currentPage,
      );
      response.when(
        success: (response) {
          if (response.data?.isNotEmpty == true) {
            allData.addAll(response.data!);
            final nextPageUrl = response.links?.next;
            hasMorePages = nextPageUrl != null && nextPageUrl.contains('page=');
            emit(SearchState.success(
              searchResponse: SearchResponse(
                status: response.status,
                msg: response.msg,
                data: allData,
                links: response.links,
                meta: response.meta,
              ),
            ));
          } else {
            hasMorePages = false;
          }
        },
        failure: (error) {
          currentPage--;
          hasMorePages = false;
        },
      );
    } finally {
      isLoadingMore = false;
    }
  }
  Future<void> refresh() async {
    currentPage = 1;
    hasMorePages = true;
    allData.clear();
    await emitSearchState(searchQuery: searchController.text);
  }
  @override
  Future<void> close() {
    _debounce?.cancel();
    searchController.dispose();
    return super.close();
  }
}