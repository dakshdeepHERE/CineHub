import 'package:movie_app/models/movie_rm.dart';

/// data : [{"id":1,"title":"The Shawshank Redemption","poster":"http://moviesapi.ir/images/tt0111161_poster.jpg","year":"1994","country":"USA","imdb_rating":"9.3","genres":["Crime","Drama"],"images":["http://moviesapi.ir/images/tt0111161_screenshot1.jpg","http://moviesapi.ir/images/tt0111161_screenshot2.jpg","http://moviesapi.ir/images/tt0111161_screenshot3.jpg"]},{"id":2,"title":"The Godfather","poster":"http://moviesapi.ir/images/tt0068646_poster.jpg","year":"1972","country":"USA","imdb_rating":"9.2","genres":["Crime","Drama"],"images":["http://moviesapi.ir/images/tt0068646_screenshot1.jpg","http://moviesapi.ir/images/tt0068646_screenshot2.jpg","http://moviesapi.ir/images/tt0068646_screenshot3.jpg"]},{"id":3,"title":"The Godfather: Part II","poster":"http://moviesapi.ir/images/tt0071562_poster.jpg","year":"1974","country":"USA","imdb_rating":"9.0","genres":["Crime","Drama"],"images":["http://moviesapi.ir/images/tt0071562_screenshot1.jpg","http://moviesapi.ir/images/tt0071562_screenshot2.jpg","http://moviesapi.ir/images/tt0071562_screenshot3.jpg"]},{"id":4,"title":"The Dark Knight","poster":"http://moviesapi.ir/images/tt0468569_poster.jpg","year":"2008","country":"USA, UK","imdb_rating":"9.0","genres":["Action","Crime","Drama"],"images":["http://moviesapi.ir/images/tt0468569_screenshot1.jpg","http://moviesapi.ir/images/tt0468569_screenshot2.jpg","http://moviesapi.ir/images/tt0468569_screenshot3.jpg"]},{"id":5,"title":"12 Angry Men","poster":"http://moviesapi.ir/images/tt0050083_poster.jpg","year":"1957","country":"USA","imdb_rating":"8.9","genres":["Crime","Drama"],"images":["http://moviesapi.ir/images/tt0050083_screenshot1.jpg","http://moviesapi.ir/images/tt0050083_screenshot2.jpg","http://moviesapi.ir/images/tt0050083_screenshot3.jpg"]},{"id":6,"title":"Schindler's List","poster":"http://moviesapi.ir/images/tt0108052_poster.jpg","year":"1993","country":"USA","imdb_rating":"8.9","genres":["Biography","Drama","History"],"images":["http://moviesapi.ir/images/tt0108052_screenshot1.jpg","http://moviesapi.ir/images/tt0108052_screenshot2.jpg","http://moviesapi.ir/images/tt0108052_screenshot3.jpg"]},{"id":7,"title":"Pulp Fiction","poster":"http://moviesapi.ir/images/tt0110912_poster.jpg","year":"1994","country":"USA","imdb_rating":"8.9","genres":["Crime","Drama"],"images":["http://moviesapi.ir/images/tt0110912_screenshot1.jpg","http://moviesapi.ir/images/tt0110912_screenshot2.jpg","http://moviesapi.ir/images/tt0110912_screenshot3.jpg"]},{"id":8,"title":"The Lord of the Rings: The Return of the King","poster":"http://moviesapi.ir/images/tt0167260_poster.jpg","year":"2003","country":"USA, New Zealand","imdb_rating":"8.9","genres":["Adventure","Drama","Fantasy"],"images":["http://moviesapi.ir/images/tt0167260_screenshot1.jpg","http://moviesapi.ir/images/tt0167260_screenshot2.jpg","http://moviesapi.ir/images/tt0167260_screenshot3.jpg"]},{"id":9,"title":"The Good, the Bad and the Ugly","poster":"http://moviesapi.ir/images/tt0060196_poster.jpg","year":"1966","country":"Italy, Spain, West Germany, USA","imdb_rating":"8.9","genres":["Western"],"images":["http://moviesapi.ir/images/tt0060196_screenshot1.jpg","http://moviesapi.ir/images/tt0060196_screenshot2.jpg","http://moviesapi.ir/images/tt0060196_screenshot3.jpg"]},{"id":10,"title":"Fight Club","poster":"http://moviesapi.ir/images/tt0137523_poster.jpg","year":"1999","country":"USA, Germany","imdb_rating":"8.8","genres":["Drama"],"images":["http://moviesapi.ir/images/tt0137523_screenshot1.jpg","http://moviesapi.ir/images/tt0137523_screenshot2.jpg","http://moviesapi.ir/images/tt0137523_screenshot3.jpg"]}]
/// metadata : {"current_page":"1","per_page":10,"page_count":25,"total_count":250}

class MovieModelRM {
  MovieModelRM({
    List<MovieRM>? movie,
    Metadata? metadata,
  }) {
    _movieItem = movie;
    _metadata = metadata;
  }

  MovieModelRM.fromJson(dynamic json) {
    if (json['data'] != null) {
      _movieItem = [];
      json['data'].forEach((v) {
        _movieItem?.add(MovieRM.fromJson(v));
      });
    }
    _metadata =
        json['metadata'] != null ? Metadata.fromJson(json['metadata']) : null;
  }
  List<MovieRM>? _movieItem;
  Metadata? _metadata;
  MovieModelRM copyWith({
    List<MovieRM>? data,
    Metadata? metadata,
  }) =>
      MovieModelRM(
        movie: data ?? _movieItem,
        metadata: metadata ?? _metadata,
      );
  List<MovieRM>? get movie => _movieItem;
  Metadata? get metadata => _metadata;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_movieItem != null) {
      map['data'] = _movieItem?.map((v) => v.toJson()).toList();
    }
    if (_metadata != null) {
      map['metadata'] = _metadata?.toJson();
    }
    return map;
  }
}

/// current_page : "1"
/// per_page : 10
/// page_count : 25
/// total_count : 250

class Metadata {
  Metadata({
    String? currentPage,
    num? perPage,
    num? pageCount,
    num? totalCount,
  }) {
    _currentPage = currentPage;
    _perPage = perPage;
    _pageCount = pageCount;
    _totalCount = totalCount;
  }

  Metadata.fromJson(dynamic json) {
    _currentPage = json['current_page'];
    _perPage = json['per_page'];
    _pageCount = json['page_count'];
    _totalCount = json['total_count'];
  }
  String? _currentPage;
  num? _perPage;
  num? _pageCount;
  num? _totalCount;
  Metadata copyWith({
    String? currentPage,
    num? perPage,
    num? pageCount,
    num? totalCount,
  }) =>
      Metadata(
        currentPage: currentPage ?? _currentPage,
        perPage: perPage ?? _perPage,
        pageCount: pageCount ?? _pageCount,
        totalCount: totalCount ?? _totalCount,
      );
  String? get currentPage => _currentPage;
  num? get perPage => _perPage;
  num? get pageCount => _pageCount;
  num? get totalCount => _totalCount;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['current_page'] = _currentPage;
    map['per_page'] = _perPage;
    map['page_count'] = _pageCount;
    map['total_count'] = _totalCount;
    return map;
  }
}