// ignore_for_file: use_build_context_synchronously

import 'package:movie_app/utils/app_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import '../cubit/app_cubid.dart';
import '../cubit/app_state.dart';
import '../utils/app_theme.dart';
import '../utils/image_list.dart';
import 'components/app_bar.dart';
import 'components/loading.dart';

class SearchListPage extends HookWidget {
  const SearchListPage({super.key});

  @override
  Widget build(BuildContext context) {
    final searchTextFieldController = useTextEditingController();
    final ScrollController scrollController = ScrollController();
    final size = MediaQuery.of(context).size;
    context.read<AppCubit>().onTextChange(searchTextFieldController);
    scrollController.addListener(() {
      if (scrollController.position.atEdge) {
        if (scrollController.position.pixels != 0) {
          context
              .read<AppCubit>()
              .updatePage(searchTextFieldController.text, false, -1);
        }
      }
    });
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xFF1d1c1c),
        body: BlocBuilder<AppCubit, AppState>(
          builder: (context, state) {
            return Stack(
              children: [
                Column(
                  children: [
                    AppBarWidget(
                        searchTextFieldController: searchTextFieldController,
                        haveSearchTextField: true),
                    Expanded(
                      child: !state.noSearchedItemFound
                          ? ListView.separated(
                              shrinkWrap: true,
                              controller: scrollController,
                              itemCount: state.searchList.length,
                              separatorBuilder: (context, index) {
                                return Container(
                                  margin:
                                      const EdgeInsets.symmetric(vertical: 3),
                                  height: 1.5,
                                  color: Colors.grey,
                                );
                              },
                              itemBuilder: (context, index) {
                                return Container(
                                  margin: const EdgeInsets.only(left: 15),
                                  child: InkWell(
                                    onTap: () async {
                                      await context
                                          .read<AppCubit>()
                                          .getMovieDetailById(
                                              state.searchList[index].id!,
                                              context);
                                      context.push(
                                        '/movieDetailPage',
                                      );
                                    },
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        SizedBox(
                                          width: size.width * .6,
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                state.searchList[index].title ??
                                                    '',
                                                maxLines: 2,
                                                overflow: TextOverflow.ellipsis,
                                                style:
                                                    AppTheme.getTextTheme(null)
                                                        .bodyLarge!
                                                        .copyWith(
                                                            color:
                                                                Colors.white),
                                              ),
                                              const SizedBox(
                                                height: 15,
                                              ),
                                              Text(
                                                state.searchList[index]
                                                        .country ??
                                                    '',
                                                overflow: TextOverflow.ellipsis,
                                                style:
                                                    AppTheme.getTextTheme(null)
                                                        .bodyMedium!
                                                        .copyWith(
                                                            color:
                                                                Colors.white),
                                              ),
                                              const SizedBox(
                                                height: 15,
                                              ),
                                              SizedBox(
                                                height: 20,
                                                width: size.width * .5,
                                                child: ListView.separated(
                                                  separatorBuilder:
                                                      (context, index) {
                                                    return Container(
                                                      margin: const EdgeInsets
                                                              .symmetric(
                                                          horizontal: 5),
                                                      width: 2,
                                                      height: 20,
                                                      color: Colors.grey,
                                                    );
                                                  },
                                                  scrollDirection:
                                                      Axis.horizontal,
                                                  itemCount: state
                                                          .searchList[index]
                                                          .genres
                                                          ?.length ??
                                                      0,
                                                  itemBuilder:
                                                      (context, genreIndex) {
                                                    return Text(
                                                      state.searchList[index]
                                                                  .genres?[
                                                              genreIndex] ??
                                                          '',
                                                      style:
                                                          AppTheme.getTextTheme(
                                                                  null)
                                                              .bodyMedium!
                                                              .copyWith(
                                                                  color: Colors
                                                                      .white),
                                                    );
                                                  },
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                        Container(
                                          margin: const EdgeInsets.only(
                                              right: 15, top: 6, bottom: 4),
                                          child: Column(
                                            children: [
                                              ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(12),
                                                child: Image.network(
                                                  state.searchList[index]
                                                          .poster ??
                                                      noImageAvilable,
                                                  width: size.width * .15,
                                                  height: 80,
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                              const SizedBox(
                                                height: 6,
                                              ),
                                              Text(
                                                state.searchList[index].year ??
                                                    '',
                                                style:
                                                    AppTheme.getTextTheme(null)
                                                        .titleMedium!
                                                        .copyWith(
                                                            color:
                                                                Colors.white),
                                              ),
                                            ],
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                );
                              },
                            )
                          : Center(
                              child: Text(
                                AppConstants.noMovieFound,
                                style: AppTheme.getTextTheme(null)
                                    .bodyLarge!
                                    .copyWith(color: Colors.white),
                              ),
                            ),
                    )
                  ],
                ),
                if (state.isLoading) showLoading()
              ],
            );
          },
        ),
      ),
    );
  }
}
