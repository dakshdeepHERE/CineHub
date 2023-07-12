import 'package:movie_app/models/genres_rm.dart';
import 'package:equatable/equatable.dart';
import '../models/movie_rm.dart';

class AppState extends Equatable {
  final bool hasError;
  final List<MovieRM> movieList;
  final List<MovieRM> movieListByGenre;
  final List<GenresRM> genreList;
  final List<MovieRM> searchList;
  final int page;
  final bool isLoading;
  final String text;
  final bool noSearchedItemFound;
  final String? selectedCountryName;
  final String? selectedMovieDate;
  final String? selectedImage;
  final int? movieRate;
  final int? bannerPage;
  final bool actiorTabSelected;
  final double? movieDetailBottomSheetHeight;

  final MovieRM? movieItem;
  const AppState(
      {required this.page,
      required this.noSearchedItemFound,
      required this.hasError,
      required this.searchList,
      required this.genreList,
      required this.movieList,
      required this.isLoading,
      required this.text,
      required this.movieListByGenre,
      this.selectedCountryName,
      this.selectedMovieDate,
      this.selectedImage,
      this.movieRate,
      this.bannerPage,
      this.movieItem,
      required this.actiorTabSelected,
      this.movieDetailBottomSheetHeight});

  AppState copyWith(
      {bool? hasError,
      List<MovieRM>? searchList,
      List<MovieRM>? movieList,
      List<MovieRM>? movieListByGenre,
      List<GenresRM>? genreList,
      int? page,
      bool? isLoading,
      bool? noSearchedItemFound,
      String? text,
      String? selectedCountryName,
      String? selectedMovieTime,
      String? selectedImage,
      int? movieRate,
      int? bannerPage,
      MovieRM? movieItem,
      bool? actiorTabSelected,
      double? movieDetailBottomSheetHeight}) {
    return AppState(
        noSearchedItemFound: noSearchedItemFound ?? this.noSearchedItemFound,
        searchList: searchList ?? this.searchList,
        genreList: genreList ?? this.genreList,
        movieListByGenre: movieListByGenre ?? this.movieListByGenre,
        movieDetailBottomSheetHeight:
            movieDetailBottomSheetHeight ?? this.movieDetailBottomSheetHeight,
        movieList: movieList ?? this.movieList,
        hasError: hasError ?? this.hasError,
        page: page ?? this.page,
        isLoading: isLoading ?? this.isLoading,
        text: text ?? this.text,
        selectedCountryName: selectedCountryName ?? this.selectedCountryName,
        selectedMovieDate: selectedMovieTime ?? selectedMovieDate,
        selectedImage: selectedImage ?? this.selectedImage,
        movieRate: movieRate ?? this.movieRate,
        bannerPage: bannerPage ?? this.bannerPage,
        movieItem: movieItem ?? this.movieItem,
        actiorTabSelected: actiorTabSelected ?? this.actiorTabSelected);
  }

  @override
  List<Object?> get props => [
        noSearchedItemFound,
        isLoading,
        text,
        hasError,
        movieList,
        page,
        selectedCountryName,
        selectedMovieDate,
        selectedImage,
        movieRate,
        bannerPage,
        movieItem,
        actiorTabSelected,
        movieDetailBottomSheetHeight,
        genreList,
        movieListByGenre
      ];
}
