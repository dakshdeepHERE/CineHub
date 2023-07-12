// ignore_for_file: use_build_context_synchronously

import 'package:movie_app/models/genres_rm.dart';
import 'package:movie_app/screens/components/loading.dart';
import 'package:movie_app/utils/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import '../cubit/app_cubid.dart';
import '../cubit/app_cubit.dart';
import '../cubit/app_state.dart';
import '../utils/app_constants.dart';
import '../utils/image_list.dart';
import 'components/app_bar.dart';

class AllMoviesPage extends StatefulHookWidget {
  const AllMoviesPage({
    super.key,
    required this.genreRM,
  });
  final GenresRM genreRM;
  @override
  State<AllMoviesPage> createState() => _AllMoviesPageState();
}

class _AllMoviesPageState extends State<AllMoviesPage> {
  final ScrollController scrollController = ScrollController();

  @override
  void dispose() {
    if (context.read<AppCubit>().getdebounce() != null) {
      context.read<AppCubit>().getdebounce()!.cancel();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final searchTextFieldController = useTextEditingController();
    final size = MediaQuery.of(context).size;
    context.read<AppCubit>().onTextChange(searchTextFieldController);
    scrollController.addListener(() {
      if (scrollController.position.atEdge) {
        if (scrollController.position.pixels != 0) {
          context.read<AppCubit>().updatePage(searchTextFieldController.text,
              widget.genreRM.name!.isNotEmpty, widget.genreRM.id ?? -1);
        }
      }
    });
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xFF1d1c1c),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            context.push('/addMovie');
          },
          child: const Icon(Icons.add),
        ),
        body: BlocBuilder<AppCubit, AppState>(
          builder: (context, state) {
            return Column(
              children: [
                if (state.movieList.isNotEmpty ||
                    state.movieListByGenre.isNotEmpty)
                  AppBarWidget(
                      haveSearchTextField: false,
                      selectedGenreName: widget.genreRM.name == ''
                          ? AppConstants.latesetMovies
                          : widget.genreRM.name),
                movieListWidget(size, state),
              ],
            );
          },
        ),
      ),
    );
  }

  Widget movieListWidget(Size size, AppState state) {
    final bool movieByGenreIsEmpty = state.movieListByGenre.isEmpty;
    return Expanded(
      child: Stack(
        children: [
          ListView.separated(
            shrinkWrap: true,
            controller: scrollController,
            itemCount: movieByGenreIsEmpty
                ? state.movieList.length
                : state.movieListByGenre.length,
            separatorBuilder: (context, index) {
              return Container(
                margin: const EdgeInsets.symmetric(vertical: 3),
                height: 1.5,
                color: Colors.grey,
              );
            },
            itemBuilder: (context, index) {
              return Container(
                margin: const EdgeInsets.only(left: 15),
                child: InkWell(
                  onTap: () async {
                    await context.read<AppCubit>().getMovieDetailById(
                        movieByGenreIsEmpty
                            ? state.movieList[index].id!
                            : state.movieListByGenre[index].id!,
                        context);
                    context.push(
                      '/movieDetailPage',
                    );
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: size.width * .6,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              movieByGenreIsEmpty
                                  ? state.movieList[index].title ?? ''
                                  : state.movieListByGenre[index].title ?? '',
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: AppTheme.getTextTheme(null)
                                  .bodyLarge!
                                  .copyWith(color: Colors.white),
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            Text(
                              movieByGenreIsEmpty
                                  ? state.movieList[index].country ?? ''
                                  : state.movieListByGenre[index].country ?? '',
                              overflow: TextOverflow.ellipsis,
                              style: AppTheme.getTextTheme(null)
                                  .bodyMedium!
                                  .copyWith(color: Colors.white),
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            SizedBox(
                              height: 20,
                              width: size.width * .5,
                              child: ListView.separated(
                                separatorBuilder: (context, index) {
                                  return Container(
                                    margin: const EdgeInsets.symmetric(
                                        horizontal: 5),
                                    width: 2,
                                    height: 20,
                                    color: Colors.grey,
                                  );
                                },
                                scrollDirection: Axis.horizontal,
                                itemCount: movieByGenreIsEmpty
                                    ? state.movieList[index].genres?.length ?? 0
                                    : state.movieListByGenre[index].genres
                                            ?.length ??
                                        0,
                                itemBuilder: (context, genreIndex) {
                                  return Text(
                                    movieByGenreIsEmpty
                                        ? state.movieList[index]
                                            .genres![genreIndex]
                                        : state.movieListByGenre[index]
                                            .genres![genreIndex],
                                    style: AppTheme.getTextTheme(null)
                                        .bodyMedium!
                                        .copyWith(color: Colors.white),
                                  );
                                },
                              ),
                            )
                          ],
                        ),
                      ),
                      Container(
                        margin:
                            const EdgeInsets.only(right: 15, top: 6, bottom: 4),
                        child: Column(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(12),
                              child: Image.network(
                                movieByGenreIsEmpty
                                    ? state.movieList[index].poster ?? ''
                                    : state.movieListByGenre[index].poster ??
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
                              movieByGenreIsEmpty
                                  ? state.movieList[index].year ?? ''
                                  : state.movieListByGenre[index].year ?? '',
                              style: AppTheme.getTextTheme(null)
                                  .titleMedium!
                                  .copyWith(color: Colors.white),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              );
            },
          ),
          if (state.isLoading) showLoading()
        ],
      ),
    );
  }
}
