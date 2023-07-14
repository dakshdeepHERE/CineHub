# Movies App

This is a Flutter-based mobile application that allows users to explore and discover movies using the Movies API from [http://moviesapi.ir/](http://moviesapi.ir/). The app utilizes the BLoC (Business Logic Component) architecture pattern for efficient state management and separation of concerns.

## Features

- Browse a vast collection of movies from various genres.
- Search for movies by title, genre, or any other relevant criteria.
- View detailed information about each movie, including plot, release date, duration, and rating.
- Save favorite movies for quick access.
- Get personalized movie recommendations based on user preferences.
- Watch movie trailers and related videos.
- Stay up to date with the latest movie releases and popular movies.

## Architecture and Libraries

The app follows the BLoC (Business Logic Component) architecture pattern, which ensures clear separation of UI, business logic, and data management. This helps maintain a scalable and maintainable codebase.

The following libraries and technologies are used in this project:

- **Flutter**: A cross-platform framework for building beautiful native applications.
- **BLoC**: A state management library that helps separate business logic from UI components.
- **Dart**: The programming language used to develop Flutter applications.
- **HTTP**: A library for making HTTP requests to retrieve data from the Movies API.
- **Provider**: A dependency injection library that allows for the efficient management of dependencies.
- **SharedPreferences**: A plugin for storing key-value pairs on the device for saving user preferences.

## Getting Started

To run this app on your local machine, follow these steps:

1. Ensure that you have Flutter and Dart installed on your system. For installation instructions, refer to the official Flutter documentation: [https://flutter.dev/docs/get-started/install](https://flutter.dev/docs/get-started/install)

2. Clone this repository using the following command:

   ```shell
   git clone https://github.com/dakshdeepHERE/CineHub
   ```

3. Navigate to the project directory:

   ```shell
   cd cinehub
   ```

4. Fetch the required dependencies by running the following command:

   ```shell
   flutter pub get
   ```

5. Connect your device or start the emulator.

6. Run the app using the following command:

   ```shell
   flutter run
   ```

## Configuration

To use the Movies API from [http://moviesapi.ir/](http://moviesapi.ir/), you need to obtain an API key. Once you have the key, open the `lib/config/api_config.dart` file and replace the placeholder value with your API key:

```dart
class ApiConfig {
  static const String apiKey = 'YOUR_API_KEY';
}
```

## Contribution

Contributions to this project are welcome. If you encounter any issues or have suggestions for improvements, please feel free to submit an issue or a pull request.

Before contributing, please read our [contribution guidelines](CONTRIBUTING.md).

## License

This project is licensed under the [MIT License](LICENSE).

## Acknowledgments

- Thanks to the team at [http://moviesapi.ir/](http://moviesapi.ir/) for providing the Movies API.
- Special thanks to the Flutter community for their support and the amazing libraries and tools they have developed.
- Thanks [Dribble]([https://dribbble.com/shots/popular](https://dribbble.com/shots/20285249-Movie-App-Exploration/attachments/15347450?mode=media)

## Contact

For any inquiries or questions, please contact [@Mail](mailto:dakshadeep1234@gmail.com).

If you find this project useful or interesting, we would greatly appreciate your support by giving it a star ⭐️ on GitHub. Your feedback and contribution are invaluable in helping us improve and enhance the app for everyone's benefit. Thank you for your support!
