import 'package:movie_app/models/genres_rm.dart';
import 'package:movie_app/screens/add_movie_page.dart';
import 'package:movie_app/screens/all_movies_page.dart';
import 'package:movie_app/screens/genre_list_page.dart';
import 'package:movie_app/screens/main_page.dart';
import 'package:movie_app/screens/movie_detail_page.dart';
import 'package:movie_app/screens/movie_list_page.dart';
import 'package:movie_app/screens/search_list_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import 'cubit/app_cubid.dart';

void main() {
  runApp(
    MyApp(),
  );
}

class MyApp extends StatelessWidget {
  final GoRouter _router = GoRouter(
    routes: [
      GoRoute(
        path: "/",
        builder: (context, state) => const MainPage(),
      ),
      GoRoute(
        path: "/addMovie",
        builder: (context, state) => const AddMoviePage(),
      ),
      GoRoute(
        path: "/movieList",
        builder: (context, state) => MovieListPage(),
      ),
      GoRoute(
        path: "/allMoviesPage",
        builder: (context, state) {
          GenresRM genreRM = state.extra as GenresRM;
          return AllMoviesPage(
            genreRM: genreRM,
          );
        },
      ),
      GoRoute(
        path: '/movieDetailPage',
        builder: (context, state) {
          return const MovieDetailPage();
        },
      ),
      GoRoute(
        path: '/genreListPage',
        builder: (context, state) {
          String genreName = state.extra as String;
          return GenreListPage(
            genreName: genreName,
          );
        },
      ),
      GoRoute(
        path: '/searchListPage',
        builder: (context, state) {
          return const SearchListPage();
        },
      )
    ],
  );
  MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AppCubit(),
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        routerConfig: _router,
      ),
    );
  }
}
