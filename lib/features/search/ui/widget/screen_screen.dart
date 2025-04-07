import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:sell_your_crop/core/helpers/extensions.dart';
import 'package:sell_your_crop/core/language/lang_keys.dart';
import 'package:sell_your_crop/core/theme/Color/colors.dart';
import 'package:sell_your_crop/features/search/logic/cubit/search_cubit.dart';
import 'package:sell_your_crop/features/search/logic/cubit/search_state.dart';
import 'package:sell_your_crop/features/search/ui/widget/caroisel_slider_images.dart';
import 'package:sell_your_crop/features/search/ui/widget/items_purchasing.dart';
import 'package:sell_your_crop/features/search/ui/widget/items_video.dart';
import '../../../../core/widget/app-text-form-field.dart';

class ScreenScreen extends StatefulWidget {
  const ScreenScreen({super.key});

  @override
  State<ScreenScreen> createState() => _ScreenScreenState();
}

class _ScreenScreenState extends State<ScreenScreen> {
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _setupScrollController();
  }

  void _setupScrollController() {
    _scrollController.addListener(() {
      if (_scrollController.position.pixels >=
          _scrollController.position.maxScrollExtent - 200) {
        final cubit = context.read<SearchCubit>();
        if (!cubit.isLoadingMore && cubit.hasMorePages) {
          cubit.loadMore();
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SearchCubit, SearchState>(
      listener: (context, state) {
        if (state is Error) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(state.error)),
          );
        }
      },
      builder: (context, state) {
        final cubit = context.read<SearchCubit>();
        return Scaffold(
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                children: [
                  TextFormFieldApp(
                    prefixIcon: Transform(
                      alignment: Alignment.center,
                      transform: Matrix4.identity()..scale(-1.0, 1.0),
                      child: const Icon(
                        CupertinoIcons.search,
                        color: Colors.black,
                        size: 24,
                      ),
                    ),
                    enableBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.r),
                      borderSide: const BorderSide(
                        color: Color(0xFFAAAAAA),
                        width: 1,
                      ),
                    ),
                    focusBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.r),
                      borderSide: const BorderSide(
                        color: Color(0xFFAAAAAA),
                        width: 1,
                      ),
                    ),
                    hintStyle: const TextStyle(
                      color: ColorApp.black00,
                    ),
                    textInputType: TextInputType.text,
                    background: const Color(0xFFD9D9D9),
                    hintText: context.translate(LangKeys.search),
                    controller: cubit.searchController,
                    onChange: (String value) {
                      cubit.emitSearchState(searchQuery: value);
                    },
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Search is required';
                      }
                      return 'null';
                    },
                  ),
                  const SizedBox(height: 20),
                  Expanded(
                    child: Builder(
                      builder: (context) {
                        if (cubit.searchController.text.isEmpty) {
                          return Center(
                            child: Lottie.network(
                              'https://lottie.host/db0d7fff-a6f3-4f7e-b8a7-c121a9094a4a/wJoFyBq0yw.json',
                              animate: true,
                              height: 500,
                            ),
                          );
                        }

                        if (state is Loading && cubit.currentPage == 1) {
                          return Center(
                            child: Lottie.network(
                              'https://lottie.host/ec36b2d4-f314-4126-96fa-13057ec47852/VGDdIYefCR.json',
                              animate: true,
                              height: 200,
                            ),
                          );
                        }

                        if (state is Success) {
                          if (cubit.allData.isEmpty) {
                            return Center(
                              child: Lottie.network(
                                'https://lottie.host/db0d7fff-a6f3-4f7e-b8a7-c121a9094a4a/wJoFyBq0yw.json',
                                animate: true,
                                height: 500,
                              ),
                            );
                          }

                          return RefreshIndicator(
                            onRefresh: () => cubit.refresh(),
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
                                if (item.img != null && item.img!.isNotEmpty) {
                                  return CarouselSliderImages(
                                    imageUrls: item.img!,
                                    type: "${context.translate(LangKeys.type)}: ${item.id ?? ""}",
                                    quantity: '${context.translate(LangKeys.quantity)}: ${item.quantity ?? ""}',
                                    price: '${context.translate(LangKeys.price)}: ${item.price ?? ""}',
                                    date: '${context.translate(LangKeys.data)}: ${item.createdAt ?? ""}',
                                    address: '${context.translate(LangKeys.address)}: ${item.city}',
                                    listingId: "${context.translate(LangKeys.listingId)}: ${item.id ?? ""}",
                                    target: item.target ?? "",
                                    targetIf: '${item.target}',
                                  );
                                } else if (item.video != null && item.video!.isNotEmpty) {
                                  return ItemsVideo(
                                    videoUrl: item.video ?? '',
                                    type: "${context.translate(LangKeys.type)}: ${item.id ?? ""}",
                                    quantity: '${context.translate(LangKeys.quantity)}: ${item.quantity ?? ""}',
                                    price: '${context.translate(LangKeys.price)}: ${item.price ?? ""}',
                                    date: '${context.translate(LangKeys.data)}: ${item.createdAt ?? ""}',
                                    address: '${context.translate(LangKeys.address)}: ${item.city}',
                                    listingId: "${context.translate(LangKeys.listingId)}: ${item.id ?? ""}",
                                    target: item.target ?? "",
                                    targetIf: '${item.target}',
                                  );
                                } else {
                                  return ItemsPurchasing(
                                    type: "${context.translate(LangKeys.type)}: ${item.id ?? ""}",
                                    quantity: '${context.translate(LangKeys.quantity)}: ${item.quantity ?? ""}',
                                    price: '${context.translate(LangKeys.price)}: ${item.price ?? ""}',
                                    date: '${context.translate(LangKeys.data)}: ${item.createdAt ?? ""}',
                                    address: '${context.translate(LangKeys.address)}: ${item.city}',
                                    listingId: "${context.translate(LangKeys.listingId)}: ${item.id ?? ""}",
                                    target: item.target ?? "",
                                    targetIf: '${item.target}',
                                  );
                                }
                              },
                            ),
                          );
                        }

                        return const SizedBox.shrink();
                      },
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

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }
}
