import 'dart:ui';
import 'package:movie_app/cubit/app_state.dart';
import 'package:movie_app/utils/extensions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../cubit/app_cubid.dart';
import '../utils/app_constants.dart';
import '../utils/app_theme.dart';
import '../utils/colors.dart';
import '../utils/image_list.dart';

class MovieDetailPage extends StatelessWidget {
  const MovieDetailPage({super.key});

  @override
  Widget build(BuildContext buildContext) {
    final size = MediaQuery.of(buildContext).size;
    return SafeArea(
      child: Scaffold(
        body: BlocBuilder<AppCubit, AppState>(
          builder: (context, state) {
            return Stack(
              alignment: Alignment.bottomCenter,
              children: [
                Stack(
                  children: [
                    Image.network(
                      state.movieItem?.poster ?? noImageAvilable,
                      fit: BoxFit.cover,
                      height: 320,
                      width: size.width,
                    ),
                    BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 3, sigmaY: 3),
                      child: SizedBox(
                        width: size.width,
                        height: size.height * .3,
                      ),
                    ),
                    Container(
                      margin:
                          const EdgeInsets.only(right: 12, left: 12, top: 20),
                      width: size.width,
                      height: 270,
                      child: Stack(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(15),
                            child: Image.network(
                              state.movieItem?.poster ?? noImageAvilable,
                              fit: BoxFit.fill,
                              width: size.width,
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.only(
                                top: 22, right: 18, left: 18),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                InkWell(
                                  onTap: () {
                                    buildContext.pop();
                                  },
                                  child: const SizedBox(
                                    width: 30,
                                    height: 30,
                                    child: Icon(
                                      Icons.arrow_back,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                                const Icon(
                                  Icons.share,
                                  color: Colors.white,
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                    bottomSheetWidget(context, size, state)
                  ],
                ),
              ],
            );
          },
        ),
      ),
    );
  }

  Align bottomSheetWidget(BuildContext context, Size size, AppState state) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: GestureDetector(
        onVerticalDragUpdate: (details) {
          int sensitivity = 8;
          if (details.delta.dy > sensitivity) {
            context.read<AppCubit>().changeBottomSheetHeight(size.height);
            // Down Swipe
          } else if (details.delta.dy < -sensitivity) {
            context.read<AppCubit>().changeBottomSheetHeight(size.height);
            // Up Swipe
          }
        },
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            AnimatedContainer(
              height: state.movieDetailBottomSheetHeight,
              alignment: Alignment.bottomCenter,
              margin: const EdgeInsets.only(top: 20),
              width: size.width,
              decoration: const BoxDecoration(
                color: greyBackground,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10),
                  topRight: Radius.circular(10),
                ),
              ),
              duration: const Duration(milliseconds: 300),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Container(
                      margin: const EdgeInsets.only(top: 10),
                      width: 50,
                      height: 4,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100),
                          color: Colors.white),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 20, left: 20),
                    child: Text(
                      state.movieItem!.title ?? "",
                      style: AppTheme.getTextTheme(null)
                          .titleLarge!
                          .copyWith(color: Colors.white),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(left: 20, top: 8),
                    child: Row(
                      children: [
                        Text(
                          state.movieItem!.plot!.isNotEmpty
                              ? context.read<AppCubit>().movieTimeInHoure()
                              : '',
                          style: AppTheme.getTextTheme(null)
                              .bodyMedium!
                              .copyWith(color: Colors.grey),
                        ),
                        if (state.movieItem!.plot!.isNotEmpty)
                          Container(
                            margin: const EdgeInsets.symmetric(horizontal: 10),
                            width: 5,
                            height: 5,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(100),
                            ),
                          ),
                        Container(
                          margin: EdgeInsets.only(
                              right:
                                  state.movieItem!.plot!.isNotEmpty ? 10 : 0),
                          height: 18,
                          child: ListView.separated(
                            separatorBuilder: (context, index) {
                              return Container(
                                decoration: BoxDecoration(
                                  color: Colors.grey,
                                  borderRadius: BorderRadius.circular(100),
                                ),
                                margin:
                                    const EdgeInsets.symmetric(horizontal: 4),
                                width: 2,
                              );
                            },
                            scrollDirection: Axis.horizontal,
                            shrinkWrap: true,
                            itemCount: state.movieItem!.genres!.length,
                            itemBuilder: (context, index) {
                              return Text(
                                state.movieItem!.genres![index],
                                style: AppTheme.getTextTheme(null)
                                    .bodyMedium!
                                    .copyWith(color: Colors.grey),
                              );
                            },
                          ),
                        ),
                        Text(
                          state.movieItem!.year.toString(),
                          style: AppTheme.getTextTheme(null)
                              .bodyMedium!
                              .copyWith(color: Colors.grey),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 18),
                    child: Row(
                      children: [
                        Container(
                          margin: const EdgeInsets.only(left: 12, right: 10),
                          child: Column(
                            children: [
                              Container(
                                margin: const EdgeInsets.only(top: 6),
                                child: const Icon(
                                  CupertinoIcons.arrow_down_to_line_alt,
                                  size: 25,
                                  color: Colors.white,
                                ),
                              ),
                              Container(
                                margin: const EdgeInsets.only(top: 4),
                                child: Text(
                                  AppConstants.download,
                                  style: AppTheme.getTextTheme(null)
                                      .bodySmall!
                                      .copyWith(color: Colors.white),
                                ),
                              )
                            ],
                          ),
                        ),
                        Expanded(
                          child: Container(
                            height: 44,
                            margin: const EdgeInsets.only(right: 20),
                            decoration: BoxDecoration(
                              color: purple,
                              borderRadius: BorderRadius.circular(100),
                            ),
                            child: Center(
                              child: Text(
                                AppConstants.playNow,
                                style: AppTheme.getTextTheme(null)
                                    .bodyLarge!
                                    .copyWith(color: Colors.white),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 22, right: 12, left: 12),
                    child: Text(
                      state.movieItem!.plot!,
                      maxLines: 5,
                      overflow: TextOverflow.ellipsis,
                      style: AppTheme.getTextTheme(null)
                          .bodyMedium!
                          .copyWith(color: Colors.grey),
                    ),
                  ),
                  if (state.movieItem!.plot!.isEmpty)
                    Container(
                      margin: const EdgeInsets.only(top: 40),
                      child: Center(
                        child: Text(
                          AppConstants.noDescriptionAvailable,
                          style: AppTheme.getTextTheme(null)
                              .titleLarge!
                              .copyWith(color: Colors.white),
                        ),
                      ),
                    ),
                  if (state.movieItem!.plot!.isNotEmpty)
                    actorAndWriterTabWidget(context, state),
                  if (state.movieDetailBottomSheetHeight == size.height * .85 &&
                      state.movieItem!.plot!.isNotEmpty &&
                      state.movieItem!.images!.isNotEmpty)
                    moviePhotosWidget(state)
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  SizedBox moviePhotosWidget(AppState state) {
    return SizedBox(
      height: 230,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            margin: const EdgeInsets.only(top: 15, left: 20),
            child: Text(
              AppConstants.photoes,
              style: AppTheme.getTextTheme(null)
                  .titleLarge!
                  .copyWith(color: Colors.white),
            ),
          ),
          Container(
            height: 165,
            margin: const EdgeInsets.only(top: 20),
            child: ListView.separated(
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return Container(
                    margin: EdgeInsets.only(left: index == 0 ? 20 : 0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Image.network(
                          state.movieItem?.images?[index] ?? noImageAvilable),
                    ),
                  );
                },
                separatorBuilder: (context, index) {
                  return Container(
                    width: 15,
                  );
                },
                itemCount: state.movieItem?.images?.length ?? 0),
          ),
        ],
      ),
    );
  }

  Column actorAndWriterTabWidget(BuildContext context, AppState state) {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.only(top: 10, left: 20),
          child: Row(
            children: [
              InkWell(
                onTap: () {
                  context.read<AppCubit>().onActorTapClicked();
                },
                child: Column(
                  children: [
                    Text(
                      AppConstants.actors,
                      style: AppTheme.getTextTheme(null).bodyLarge!.copyWith(
                          color: state.actiorTabSelected
                              ? Colors.white
                              : Colors.grey,
                          fontWeight: FontWeight.w400),
                    ),
                    if (state.actiorTabSelected)
                      Container(
                        margin: const EdgeInsets.only(top: 5, left: 2),
                        width: 65,
                        height: 2,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(100),
                            color: purple),
                      )
                  ],
                ),
              ),
              InkWell(
                onTap: () {
                  context.read<AppCubit>().onActorTapClicked();
                },
                child: Column(
                  children: [
                    Container(
                      margin: const EdgeInsets.only(left: 20),
                      child: Text(
                        AppConstants.writer,
                        style: AppTheme.getTextTheme(null).bodyLarge!.copyWith(
                            color: !state.actiorTabSelected
                                ? Colors.white
                                : Colors.grey,
                            fontWeight: FontWeight.w400),
                      ),
                    ),
                    if (!state.actiorTabSelected)
                      Container(
                        margin: const EdgeInsets.only(top: 5, left: 27),
                        width: 65,
                        height: 2,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(100),
                            color: purple),
                      )
                  ],
                ),
              )
            ],
          ),
        ),
        if (state.actiorTabSelected && state.movieItem!.actors!.isNotEmpty)
          Container(
            margin: const EdgeInsets.only(top: 10),
            height: 150,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                final actorName = AppExtensions('')
                    .devideActorsIntoList(state.movieItem!.actors!)[index];
                return Container(
                  margin: EdgeInsets.only(left: index == 0 ? 20 : 0),
                  width: 100,
                  height: 60,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Image.network(
                          actorImageList[index],
                          fit: BoxFit.cover,
                          height: 100,
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: 5),
                        child: Text(
                          actorName,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.center,
                          style: AppTheme.getTextTheme(null)
                              .bodyMedium!
                              .copyWith(
                                  color: Colors.white,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400),
                        ),
                      ),
                    ],
                  ),
                );
              },
              itemCount: AppExtensions('')
                  .devideActorsIntoList(state.movieItem?.actors ?? '')
                  .length,
              separatorBuilder: (context, index) {
                return Container(
                  width: 10,
                );
              },
            ),
          )
        else
          Container(
            margin: const EdgeInsets.only(top: 10),
            height: 150,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                String writerName = AppExtensions('').devideWritersIntoList(
                    state.movieItem?.writer ?? '')[index];

                return Container(
                  margin: EdgeInsets.only(left: index == 0 ? 20 : 0),
                  width: 100,
                  height: 60,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Image.network(
                          writerImageList[index],
                          fit: BoxFit.cover,
                          height: 100,
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: 5),
                        child: Text(
                          writerName,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.center,
                          style: AppTheme.getTextTheme(null)
                              .bodyMedium!
                              .copyWith(
                                  color: Colors.white,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400),
                        ),
                      ),
                    ],
                  ),
                );
              },
              itemCount: AppExtensions('')
                  .devideWritersIntoList(state.movieItem?.writer ?? '')
                  .length,
              separatorBuilder: (context, index) {
                return Container(
                  width: 10,
                );
              },
            ),
          ),
      ],
    );
  }
}
