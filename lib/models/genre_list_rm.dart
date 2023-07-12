// ignore: depend_on_referenced_packages
import 'package:movie_app/models/movie_rm.dart';

import 'movie_model_rm.dart';

class GenreListRM {
  List<MovieRM>? movie;
  Metadata? metadata;

  GenreListRM({this.movie, this.metadata});

  GenreListRM.fromJson(Map<String, dynamic> json) {
    if (json["data"] is List) {
      movie = json["data"] == null
          ? null
          : (json["data"] as List).map((e) => MovieRM.fromJson(e)).toList();
    }
    if (json["metadata"] is Map) {
      metadata =
          json["metadata"] == null ? null : Metadata.fromJson(json["metadata"]);
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _movie = <String, dynamic>{};
    if (movie != null) {
      _movie["data"] = movie?.map((e) => e.toJson()).toList();
    }
    if (metadata != null) {
      _movie["metadata"] = metadata?.toJson();
    }
    return _movie;
  }
}
