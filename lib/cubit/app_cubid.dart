import 'dart:async';
import 'dart:io';
import 'package:movie_app/utils/extensions.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import '../models/movie_rm.dart';
import '../service/rest_client.dart';
import '../utils/app_constants.dart';
import 'app_state.dart';

final dio = Dio();
final client = MovieClient(dio);
double selectedBannerItemHeight = 100;

class AppCubit extends Cubit<AppState> {
  List<MovieRM> movieList = [];
  List<MovieRM> movieListByGenre = [];
  List<MovieRM> searchList = [];

  AppCubit()
      : super(
          const AppState(
              isLoading: false,
              text: '',
              hasError: false,
              movieList: [],
              searchList: [],
              genreList: [],
              page: 0,
              bannerPage: 0,
              actiorTabSelected: true,
              movieListByGenre: [],
              noSearchedItemFound: false),
        );

  onPageViewChange(int page) {
    emit(
      state.copyWith(bannerPage: page),
    );
  }

  double getSelectedBannerHeight() => selectedBannerItemHeight;

  Future<void> fetchMovieApi() async {
    emit(
      state.copyWith(isLoading: true),
    );
    try {
      final movieListServer = await client.getMovieList(0, '');

      movieList = movieListServer.movie ?? [];
      emit(
        state.copyWith(
            movieList: movieListServer.movie, isLoading: false, page: 0),
      );
    } catch (e) {
      print('Error is $e');
    }
  }

  Future<void> getGenreList() async {
    emit(
      state.copyWith(isLoading: true),
    );
    try {
      final genreList = await client.getGenresList();

      emit(
        state.copyWith(
          genreList: genreList,
          isLoading: false,
        ),
      );
    } catch (e) {
      print('Error is $e');
    }
  }

  Future<void> updatePage(
      String searchValue, bool movieByGenre, int genreId) async {
    emit(
      state.copyWith(page: state.page + 1, isLoading: true),
    );

    try {
      /* Need to add Movie model in State */
      if (movieByGenre) {
        final genreMoviesServer =
            await client.getMovieListByGenreId(genreId, state.page);
        movieListByGenre.addAll(genreMoviesServer.movie?.toList() ?? []);
        emit(
          state.copyWith(movieListByGenre: movieListByGenre, isLoading: false),
        );
      } else {
        final movieListServer =
            await client.getMovieList(state.page + 1, searchValue);
        print('page is ${state.page}');

        if (searchValue.isEmpty) {
          movieList.addAll(movieListServer.movie?.toList() ?? []);

          emit(
            state.copyWith(movieList: movieList, isLoading: false),
          );
        } else {
          searchList.addAll(movieListServer.movie?.toList() ?? []);

          emit(
            state.copyWith(searchList: searchList, isLoading: false),
          );
        }
      }
      print('movies from selected gender $movieByGenre');
    } catch (e) {
      print('Error is $e');
    }
  }

  Future<void> searchMovie(String searchValue) async {
    emit(state.copyWith(isLoading: true, page: 1));

    try {
      final searchListFromServer =
          await client.getMovieList(state.page, searchValue);

      searchList.clear();

      searchList = searchListFromServer.movie ?? [];
      emit(
        state.copyWith(
            searchList: searchList,
            isLoading: false,
            noSearchedItemFound: searchListFromServer.movie?.isEmpty),
      );
    } catch (e) {
      print('Error is $e');
    }
  }

  Future<void> selectImage() async {
    final File? imageFile;
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);
    imageFile = File(image!.path);

    CroppedFile? croppedFile = await ImageCropper().cropImage(
      sourcePath: imageFile.path,
      aspectRatioPresets: [
        CropAspectRatioPreset.square,
        CropAspectRatioPreset.ratio3x2,
        CropAspectRatioPreset.original,
        CropAspectRatioPreset.ratio4x3,
        CropAspectRatioPreset.ratio16x9
      ],
      uiSettings: [
        AndroidUiSettings(
            toolbarTitle: 'Cropper',
            toolbarColor: Colors.deepOrange,
            toolbarWidgetColor: Colors.white,
            initAspectRatio: CropAspectRatioPreset.original,
            lockAspectRatio: false),
        IOSUiSettings(
          title: 'Cropper',
        ),
      ],
    );
    emit(
      state.copyWith(selectedImage: croppedFile!.path),
    );
  }

  Future<void> showLoadong() async {
    emit(
      state.copyWith(isLoading: true),
    );
    await Future.delayed(
      const Duration(seconds: 2),
    );
    emit(
      state.copyWith(isLoading: false),
    );
  }

  void setSelectedCountryName(int index, List<String> countryList) {
    String selectedCountry = countryList[index];
    emit(
      state.copyWith(selectedCountryName: selectedCountry),
    );
  }

  void setSelectedMovieDate(String date) {
    emit(
      state.copyWith(
        selectedMovieTime: date.splitDate(),
      ),
    );
  }

  void setMovieRate(int rate) {
    emit(
      state.copyWith(movieRate: rate),
    );
  }

  Future<void> addMovie(
      String movieName, String movieDirector, BuildContext context) async {
    textFieldErrorHandeling(movieName, movieDirector);
    if (movieName.isNotEmpty && movieDirector.isNotEmpty) {
      emit(
        state.copyWith(
          isLoading: true,
        ),
      );
      try {
        FormData formData = FormData.fromMap({
          "title": movieName,
          'imdb_id': 'tt0232500',
          'director': movieDirector,
          'country': state.selectedCountryName!.split(' ')[1],
          'imdb_rating': state.movieRate,
          'year': state.selectedMovieDate!.split("-")[0],
          if (state.selectedImage != '')
            "poster": await MultipartFile.fromFile(
              state.selectedImage!,
              filename: state.selectedImage!,
            ),
        });
        await client.postNewMovie(formData);
        // ignore: use_build_context_synchronously
        context.pop();
        emit(
          state.copyWith(
            isLoading: false,
          ),
        );
      } catch (e) {
        print('error is $e');
        emit(
          state.copyWith(
            hasError: true,
            isLoading: false,
          ),
        );
      }
    }
  }

  List<int> textFieldErrorHandeling(
    String movieName,
    String movieDirector,
  ) {
    List<int> statusList = [];
    if (movieName.isEmpty && movieDirector.isEmpty) {
      statusList = [0, 0];
    } else if (movieName.isEmpty && movieDirector.isNotEmpty) {
      statusList = [0, 1];
    } else if (movieName.isNotEmpty && movieDirector.isEmpty) {
      statusList = [1, 0];
    } else if (movieName.isNotEmpty && movieDirector.isNotEmpty) {
      statusList = [1, 1];
    }
    return statusList;
  }

  Future<void> getMovieDetailById(int id, BuildContext context) async {
    final size = MediaQuery.of(context).size;
    emit(
      state.copyWith(
          isLoading: true, movieDetailBottomSheetHeight: size.height * .57),
    );
    try {
      final movieItemServer = await client.getMovieDetail(id);
      emit(
        state.copyWith(movieItem: movieItemServer, isLoading: false),
      );
    } catch (e) {
      print('Error is $e');
    }
  }

  Future<void> getGenreMovieById(int id) async {
    emit(
      state.copyWith(isLoading: true, movieListByGenre: [], page: 1),
    );
    movieListByGenre.clear();
    try {
      print('dfdf${AppConstants.genres}1/${AppConstants.movies}');

      final genreMoviesServer =
          await client.getMovieListByGenreId(id, state.page);
      movieListByGenre = (genreMoviesServer.movie?.toList() ?? []);
      print('value is ${genreMoviesServer.movie![0].title} ');

      emit(
        state.copyWith(movieListByGenre: movieListByGenre, isLoading: false),
      );
    } catch (e) {
      print('Error is $e');
    }
  }

  Timer? debounce;

  Timer? getdebounce() => debounce;

  onSearchTextChanged(String searchValue) {
    if (debounce?.isActive ?? false) debounce?.cancel();
    debounce = Timer(const Duration(milliseconds: 700), () {
      searchValue.isEmpty ? fetchMovieApi() : searchMovie(searchValue);
    });
  }

  void onTextChange(TextEditingController searchController) {
    useEffect(
      () => () {
        searchController.addListener(
          () {
            onSearchTextChanged(searchController.value.text);
          },
        );
      },
    );
  }

  List<MovieRM> genetateBannetItemes(BuildContext context) {
    return [
      movieList[0],
      movieList[4],
      movieList[8],
      movieList[1],
      movieList[9],
      movieList[5]
    ];
  }

  void onActorTapClicked() {
    if (debounce?.isActive ?? false) debounce?.cancel();
    debounce = Timer(const Duration(milliseconds: 200), () {
      emit(
        state.copyWith(
            actiorTabSelected: state.actiorTabSelected ? false : true),
      );
    });
  }

  void changeBottomSheetHeight(double deviceHeight) {
    emit(state.copyWith(
        movieDetailBottomSheetHeight:
            state.movieDetailBottomSheetHeight == deviceHeight * .57
                ? deviceHeight * .85
                : deviceHeight * .57));
  }

  int returnYear() {
    String date = state.selectedMovieDate ?? DateTime.now().year.toString();
    int selectedYear = int.parse(date.splitDate().splitDateToYear());
    return selectedYear;
  }

  int returnMonth() {
    String date =
        state.selectedMovieDate ?? DateTime.now().toString().splitDate();
    int selectedMonth = int.parse(date.splitDateToMonth());
    return selectedMonth;
  }

  int returnDay() {
    String date =
        state.selectedMovieDate ?? DateTime.now().toString().splitDate();
    int selectedDay = int.parse(date.splitDateToDay());
    return selectedDay;
  }

  String movieTimeInHoure() {
    String movieTimeInMinute = state.movieItem!.runtime!.split(' ')[0];

    String movieTimeDevidedToHoure =
        movieTimeInMinute.devideMinuteToHour(movieTimeInMinute);

    String finalMovieTimeInHourAndMinute = movieTimeInMinute
        .devideHoureAndMinute(movieTimeDevidedToHoure, movieTimeInMinute);

    return finalMovieTimeInHourAndMinute;
  }

  void clearSearchList() {
    searchList.clear();
    emit(
      state.copyWith(searchList: [], noSearchedItemFound: false),
    );
  }
}
