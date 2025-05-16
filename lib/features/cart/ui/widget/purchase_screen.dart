import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:sell_your_crop/core/helpers/animate_do.dart';
import 'package:sell_your_crop/core/helpers/extensions.dart';
import 'package:sell_your_crop/core/language/lang_keys.dart';
import 'package:sell_your_crop/core/networking/di/dependency_injection.dart';
import 'package:sell_your_crop/features/cart/logic/cubit/purchase_cubit.dart';
import 'package:sell_your_crop/features/cart/logic/cubit/sell_purchase_state.dart';
import 'package:sell_your_crop/features/search/ui/widget/items_purchasing.dart';
import '../../../../core/theme/Color/colors.dart';
import '../../../../core/theme/text_style/text_style.dart';
import '../../logic/cubit/sell_cubit.dart';

class PurchaseScreen extends StatefulWidget {
  const PurchaseScreen({super.key});

  @override
  State<PurchaseScreen> createState() => _PurchaseScreenState();
}

class _PurchaseScreenState extends State<PurchaseScreen> {
  final ScrollController _scrollController = ScrollController();
  final RefreshController _refreshController = RefreshController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  void _onScroll() {
    if (_scrollController.position.pixels >= _scrollController.position.maxScrollExtent - 200) {
      final cubit = context.read<PurchaseCubit>();
      if (!cubit.isLoadingMore && cubit.hasMorePages) {
        cubit.loadMore();
      }
    }
  }
  @override
  void dispose() {
    _scrollController.dispose();
    _refreshController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PurchaseCubit, SellAndPurchaseState>(
      builder: (context, state) {
        final cubit = context.read<PurchaseCubit>();
        
        return Scaffold(
          appBar: AppBar(
            title: Text(context.translate(LangKeys.cropPurchaseing),
              style: TextStyleApp.font22black00Weight500.copyWith(
                  fontWeight: FontWeight.w600, color: ColorApp.black00),),
            elevation: 0,
            centerTitle: true,
            clipBehavior: Clip.antiAlias,
            shape: const RoundedRectangleBorder(
                side: BorderSide(color: ColorApp.black00),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(15),
                  bottomRight: Radius.circular(15),
                )
            ),
            backgroundColor: Colors.white,
          ),
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                children: [
                  SizedBox(height: 5.h),
                  if (state is Loading && cubit.currentPage == 1)
                     Expanded(
                      child:  Center(
                       child: Lottie.network('https://lottie.host/db7217e0-32bb-408f-b6b9-db056c049a47/LPdaWBvqqN.json',
                       animate: true,
                       height: 150,
                      ),
                     ),
                    ),
                  if (state is Success || (state is Loading && cubit.currentPage > 1))
                    Expanded(
                      child: SmartRefresher(
                        controller: _refreshController,
                        enablePullDown: true,
                        enablePullUp: cubit.hasMorePages,
                        onRefresh: () async {
                          await cubit.refresh();
                          _refreshController.refreshCompleted();
                        },
                        onLoading: () async {
                          await cubit.loadMore();
                          _refreshController.loadComplete();
                        },
                        child: ListView.builder(
                          controller: _scrollController,
                          itemCount: cubit.allData.length + (cubit.isLoadingMore ? 1 : 0),
                          itemBuilder: (context, index) {
                            if (index == cubit.allData.length) {
                              return const Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Center(
                                  child: CircularProgressIndicator(),
                                ),
                              );
                            }

                            final item = cubit.allData[index];
                            return BlocProvider(
                          create: (context) => getIt<SellCubit>(),
                           child: CustomFadeInDown(
                              duration: 1500,
                              child: ItemsPurchasing(
                                type: "${context.translate(LangKeys.type)}: ${item.genre ?? ""}",
                                quantity: '${context.translate(LangKeys.quantity)}: ${item.quantity ?? ""}',
                                price: '${context.translate(LangKeys.price)}: ${item.price ?? ""}',
                                date: '${context.translate(LangKeys.data)}: ${item.createdAt ?? ""}',
                                address: '${context.translate(LangKeys.address)}: ${item.city ?? ""}',
                                listingId: "${context.translate(LangKeys.listingId)}: ${item.id ?? ""}",
                                target: item.target ?? "",
                                targetIf: item.target ?? "",
                              ),
                            ),
);
                          },
                        ),
                      ),
                    ),
                  if (state is Error && cubit.allData.isEmpty)
                    Expanded(
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(state.error),
                            ElevatedButton(
                              onPressed: () => cubit.refresh(),
                              child: const Text('إعادة المحاولة'),
                            ),
                          ],
                        ),
                      ),
                    ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

