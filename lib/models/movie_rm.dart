class MovieRM {
  MovieRM({
    required this.id,
    required this.title,
    required this.poster,
    required this.year,
    required this.rated,
    required this.released,
    required this.runtime,
    required this.director,
    required this.writer,
    required this.actors,
    required this.plot,
    required this.country,
    required this.awards,
    required this.metascore,
    required this.imdbRating,
    required this.imdbVotes,
    required this.imdbId,
    required this.type,
    required this.genres,
    required this.images,
  });
  late final int? id;
  late final String? title;
  late final String? poster;
  late final String? year;
  late final String? rated;
  late final String? released;
  late final String? runtime;
  late final String? director;
  late final String? writer;
  late final String? actors;
  late final String? plot;
  late final String? country;
  late final String? awards;
  late final String? metascore;
  late final String? imdbRating;
  late final String? imdbVotes;
  late final String? imdbId;
  late final String? type;
  late final List<String>? genres;
  late final List<String>? images;

  MovieRM.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    poster = json['poster'];
    year = json['year'];
    rated = json['rated'] ?? '';
    released = json['released'] ?? '';
    runtime = json['runtime'] ?? '';
    director = json['director'];
    writer = json['writer'] ?? '';
    actors = json['actors'] ?? '';
    plot = json['plot'] ?? '';
    country = json['country'] ?? '';
    awards = json['awards'] ?? '';
    metascore = json['metascore'] ?? '';
    imdbRating = json['imdb_rating'] ?? '';
    imdbVotes = json['imdb_votes'] ?? '';
    imdbId = json['imdb_id'] ?? '';
    type = json['type'] ?? '';
    genres = List.castFrom<dynamic, String>(json['genres'] ?? []);
    images = List.castFrom<dynamic, String>(json['images'] ?? []);
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id ?? "";
    data['title'] = title ?? '';
    data['poster'] = poster ?? '';
    data['year'] = year ?? '';
    data['rated'] = rated ?? '';
    data['released'] = released ?? '';
    data['runtime'] = runtime ?? '';
    data['director'] = director ?? '';
    data['writer'] = writer ?? '';
    data['actors'] = actors ?? '';
    data['plot'] = plot ?? '';
    data['country'] = country ?? '';
    data['awards'] = awards ?? '';
    data['metascore'] = metascore ?? '';
    data['imdb_rating'] = imdbRating ?? '';
    data['imdb_votes'] = imdbVotes ?? '';
    data['imdb_id'] = imdbId ?? '';
    data['type'] = type ?? '';
    data['genres'] = genres ?? [];
    data['images'] = images ?? [];
    return data;
  }
}
