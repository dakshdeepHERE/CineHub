import 'package:flutter/cupertino.dart';

class AppConstants {
  static const postBaseUrl = 'https://jsonplaceholder.typicode.com/';
  static const posts = 'posts/';
  static const movieBaseUrl = 'http://moviesapi.ir/api/v1/';
  static const movies = 'movies/';
  static const genres = 'genres/';

  static var countryItem = const Text('');
  static const liveNow = 'Live now';
  static const watchNow = 'Watch now';
  static const seeAll = 'See all';
  static const latesetMovies = 'Lateset movies';
  static const topRated = 'Top rated';
  static const playNow = 'Play now';
  static const download = 'Download';
  static const actors = 'Actors';
  static const writer = 'Writer';
  static const photoes = 'Photes';
  static const genresText = 'Genres';
  static const noMovieFound = 'No movie has been found! :(';
  static const noDescriptionAvailable = 'No description available!';
  static const country = 'Country';
  static const select = 'Select';
  static const submit = 'Submit';
  static const date = 'Date';
  static const movieImage = 'Movie Image';
  static const movieRate = 'Movie rate';
  static const welcomeBack = 'Welcome back to';
  static const search = 'Search';
  static const chooseMovieDate = 'Choose movie date';
  static const chooseMovieCountry = 'Choose movie country';

  static const countryList = [
    "🇦🇫 Afghanistan",
    "🇦🇽 Åland Islands",
    "🇦🇱 Albania",
    "🇩🇿 Algeria",
    "🇦🇸 American Samoa",
    "🇦🇩 Andorra",
    "🇦🇴 Angola",
    "🇦🇮 Anguilla",
    "🇦🇶 Antarctica",
    "🇦🇬 Antigua & Barbuda",
    "🇦🇷 Argentina",
    "🇦🇲 Armenia",
    "🇦🇼 Aruba",
    "🇦🇺 Australia",
    "🇦🇹 Austria",
    "🇦🇿 Azerbaijan",
    "🇧🇸 Bahamas",
    "🇧🇭 Bahrain",
    "🇧🇩 Bangladesh",
    "🇧🇧 Barbados",
    "🇧🇾 Belarus",
    "🇧🇪 Belgium",
    "🇧🇿 Belize",
    "🇧🇯 Benin",
    "🇧🇲 Bermuda",
    "🇧🇹 Bhutan",
    "🇧🇴 Bolivia",
    "🇧🇶 Bonaire, Sint Eustatius and Saba",
    "🇧🇦 Bosnia & Herzegovina",
    "🇧🇼 Botswana",
    "🇧🇷 Brazil",
    "🇮🇴 British Indian Ocean Territory",
    "🇻🇬 British Virgin Islands",
    "🇧🇳 Brunei Darussalam",
    "🇧🇬 Bulgaria",
    "🇧🇫 Burkina Faso",
    "🇧🇮 Burundi",
    "🇰🇭 Cambodia",
    "🇨🇲 Cameroon",
    "🇨🇦 Canada",
    "🇨🇻 Cape Verde",
    "🇰🇾 Cayman Islands",
    "🇨🇫 Central African Republic",
    "🇹🇩 Chad",
    "🇨🇱 Chile",
    "🇨🇳 China",
    "🇨🇽 Christmas Island",
    "🇨🇨 Cocos (Keeling) Islands",
    "🇨🇴 Colombia",
    "🇰🇲 Comoros",
    "🇨🇬 Congo (Republic of the)",
    "🇨🇩 Democratic Republic of the Congo",
    "🇨🇰 Cook Islands",
    "🇨🇷 Costa Rica",
    "🇭🇷 Croatia",
    "🇨🇺 Cuba",
    "🇨🇼 Curaçao",
    "🇨🇾 Cyprus",
    "🇨🇿 Czech Republic",
    "🇩🇰 Denmark",
    "🇩🇯 Djibouti",
    "🇩🇲 Dominica",
    "🇩🇴 Dominican Republic",
    "🇪🇨 Ecuador",
    "🇪🇬 Egypt",
    "🇸🇻 El Salvador",
    "🇬🇶 Equatorial Guinea",
    "🇪🇷 Eritrea",
    "🇪🇪 Estonia",
    "🇪🇹 Ethiopia",
    "🇫🇰 Falkland Islands (Malvinas)",
    "🇫🇴 Faroe Islands",
    "🇫🇯 Fiji",
    "🇫🇮 Finland",
    "🇫🇷 France",
    "🇬🇫 French Guiana",
    "🇵🇫 French Polynesia",
    "🇹🇫 French Southern Territories",
    "🇬🇦 Gabon",
    "🇬🇲 Gambia",
    "🇬🇪 Georgia",
    "🇩🇪 Germany",
    "🇬🇭 Ghana",
    "🇬🇮 Gibraltar",
    "🇬🇷 Greece",
    "🇬🇱 Greenland",
    "🇬🇩 Grenada",
    "🇬🇵 Guadeloupe",
    "🇬🇺 Guam",
    "🇬🇹 Guatemala",
    "🇬🇬 Guernsey",
    "🇬🇳 Guinea",
    "🇬🇼 Guinea-Bissau",
    "🇬🇾 Guyana",
    "🇭🇹 Haiti",
    "🇭🇳 Honduras",
    "🇭🇰 Hong Kong SAR China",
    "🇭🇺 Hungary",
    "🇮🇸 Iceland",
    "🇮🇳 India",
    "🇮🇩 Indonesia",
    "🇮🇷 Iran",
    "🇮🇶 Iraq",
    "🇮🇪 Ireland",
    "🇮🇲 Isle of Man",
    "🇮🇱 Israel",
    "🇮🇹 Italy",
    "🇨🇮 Ivory Coast",
    "🇯🇲 Jamaica",
    "🇯🇵 Japan",
    "🇯🇪 Jersey",
    "🇯🇴 Jordan",
    "🇰🇿 Kazakhstan",
    "🇰🇪 Kenya",
    "🇰🇮 Kiribati",
    "🇽🇰 Kosovo",
    "🇰🇼 Kuwait",
    "🇰🇬 Kyrgyzstan",
    "🇱🇦 Laos",
    "🇱🇻 Latvia",
    "🇱🇧 Lebanon",
    "🇱🇸 Lesotho",
    "🇱🇷 Liberia",
    "🇱🇾 Libya",
    "🇱🇮 Liechtenstein",
    "🇱🇹 Lithuania",
    "🇱🇺 Luxembourg",
    "🇲🇴 Macau SAR China",
    "🇲🇰 Macedonia (FYROM)",
    "🇲🇬 Madagascar",
    "🇲🇼 Malawi",
    "🇲🇾 Malaysia",
    "🇲🇻 Maldives",
    "🇲🇱 Mali",
    "🇲🇹 Malta",
    "🇲🇭 Marshall Islands",
    "🇲🇶 Martinique",
    "🇲🇷 Mauritania",
    "🇲🇺 Mauritius",
    "🇾🇹 Mayotte",
    "🇲🇽 Mexico",
    "🇫🇲 Micronesia",
    "🇲🇩 Moldova",
  ];
}
