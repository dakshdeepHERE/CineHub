import 'package:movie_app/models/movie_model_rm.dart';
import 'package:movie_app/utils/app_constants.dart';
import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';

import '../models/genres_rm.dart';
import '../models/movie_rm.dart';

part 'rest_client.g.dart';

@RestApi(baseUrl: AppConstants.movieBaseUrl)
abstract class MovieClient {
  factory MovieClient(Dio dio, {String baseUrl}) = _MovieClient;

  @GET(AppConstants.movies)
  Future<MovieModelRM> getMovieList(
      @Query('page') int page, @Query('q') String searchValue);

  @MultiPart()
  @POST('${AppConstants.movies}multi/')
  Future<MovieRM> postNewMovie(@Body() FormData param);

  @GET('${AppConstants.movies}/{id}')
  Future<MovieRM> getMovieDetail(@Path("id") id);

  @GET('${AppConstants.genres}{id}/${AppConstants.movies}')
  Future<MovieModelRM> getMovieListByGenreId(
    @Path("id") id,
    @Query('page') int page,
  );

  @GET(AppConstants.genres)
  Future<List<GenresRM>> getGenresList();

  // @MultiPart()
  // Future<double> uploadDocument(
  //     @Part(name: "id") int id, @Part(name: "document") File document);
}
