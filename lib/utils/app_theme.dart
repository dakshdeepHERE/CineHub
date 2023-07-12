import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AppTheme {
  static const Color secondary = Color(0xffFEA801);
  static const Color secondaryAccent = Color(0xffFFCD6C);
  static const Color grey = Color(0xffEEEEEE);
  static const Color lightGrey = Color(0xffDDDDDD);
  static const Color darkGrey = Color(0xff595959);
  static const Color red = Color(0xffEB2212);
  static const Color darkInputBackground = Color(0xff4A4A4A);
  static const Color lightSecondaryButtonColor = Color(0xffCAD8D6);
  static const Color darkSecondaryButtonColor = Color(0xff788886);
  static const Color darkLabelColor = Color(0xffB9B9B9);
  static const Color primary = Color(0xff176D60);
  static const Color primaryAccent = Color(0xff51A195);
  static const Color lightPrimary = Color.fromARGB(130, 23, 109, 96);
  static const Color darkSecondaryColor = Color(0xff9E9E9E);
  static const Color primary50 = Color(0xffe9d9ec);
  static const Color secondary600 = Color(0xff426cd4);
  static const Color secondary400 = Color(0xff8c9eff);
  static const Color secondary200 = Color(0xffa2aee8);
  static const Color secondary100 = Color(0xffaeb5dc);
  static const Color secondary50 = Color(0xffb9bdd1);
  static const Color errorColor = Color(0xffcf6679);
  static LinearGradient primaryGradient = const LinearGradient(
      colors: [primary, primaryAccent],
      begin: Alignment.centerLeft,
      end: Alignment.centerRight);

  static const List<Color> keyboardLightGradient = [
    Color(0xffBCBCBB),
    Color(0xffBABABA),
    Color(0xffB4B2AF),
    Color(0xffB0B0B0),
    Color(0xffB8B4AF),
    Color(0xffBFBDB9),
    Color(0xffACA79E),
    Color(0xff989494),
    Color(0xffA4A4A4),
    Color(0xffA8A8A8),
    Color(0xffDEDEDE),
    Color(0xffA4A4A4),
  ];
  static const List<Color> keyboardDarkGradient = [
    Color(0xff6C6964),
    Color(0xff35312A),
    Color(0xff35312A),
    Color(0xff6C6964),
    Color(0xff6C6964),
    Color(0xff3F3C3C),
    Color(0xff1D2025),
    Color(0xff3F3C3C),
    Color(0xff6C6964),
  ];

  static LinearGradient itemGradient = LinearGradient(
    colors: [
      const Color(0xff181A20).withOpacity(.8),
      const Color(0xff181A20).withOpacity(.7),
      const Color(0xff181A20).withOpacity(.3),
    ],
    begin: Alignment.bottomCenter,
    end: Alignment.topCenter,
  );
  static LinearGradient secondaryGradient = const LinearGradient(
      colors: [secondary, secondaryAccent],
      begin: Alignment.centerLeft,
      end: Alignment.centerRight);
  static const Widget loadingWidget = CircularProgressIndicator.adaptive();

  ///app theme used in app.dart
  static ThemeData lightThemeData(Locale locale) {
    return ThemeData(
        cardColor: const Color(0xffdadada),
        canvasColor: const Color(0xffeeeeee),
        scaffoldBackgroundColor: const Color(0xffeeeeee),
        hintColor: const Color(0xff979797),
        primaryColorLight: const Color(0xff9431EC),
        dialogBackgroundColor: const Color(0xff0d072b),
        unselectedWidgetColor: Colors.red,
        disabledColor: Colors.red,
        secondaryHeaderColor: Colors.white,
        bottomSheetTheme: const BottomSheetThemeData(
            backgroundColor: Color(0xffeeeeee), elevation: 0),

        ///divider Theme
        dividerTheme:
            DividerThemeData(color: Colors.black.withOpacity(.3), thickness: 1),
        progressIndicatorTheme:
            const ProgressIndicatorThemeData(color: primary),

        ///dialog Theme
        dialogTheme: DialogTheme(
            backgroundColor: const Color(0xff16163a),
            contentTextStyle: getTextTheme(locale).bodyMedium,
            titleTextStyle: getTextTheme(locale).bodyLarge),

        ///radio button theme
        radioTheme: RadioThemeData(
            fillColor:
                MaterialStateProperty.resolveWith<Color>((_) => secondary)),

        ///text Theme
        fontFamily: locale.languageCode == 'fa' ? "pelak" : "urbanist",
        textTheme: getTextTheme(locale).apply(
          bodyColor: Colors.black,
          displayColor: Colors.black,
        ),

        ///Icon Theme
        iconTheme: const IconThemeData(color: Colors.black),
        checkboxTheme: checkboxThemeData,

        ///snackBar Theme
        snackBarTheme: SnackBarThemeData(
            actionTextColor: Colors.white,
            contentTextStyle: getTextTheme(locale).bodySmall,
            backgroundColor: const Color(0xFF674A71),
            elevation: 0,
            behavior: SnackBarBehavior.floating,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16))),

        ///app Bar Theme
        appBarTheme: AppBarTheme(
            systemOverlayStyle: SystemUiOverlayStyle.light,
            titleTextStyle: getTextTheme(locale).titleLarge,
            backgroundColor: const Color(0xff0d072b),
            iconTheme: const IconThemeData(color: Colors.white),
            elevation: 0),
        inputDecorationTheme: getInputDecorationTheme(Brightness.light),
        colorScheme: const ColorScheme(
                onSecondaryContainer: lightPrimary,
                shadow: Colors.black,
                primary: Color(0xff176D60),
                primaryContainer: Color(0xff4b02c4),
                secondaryContainer: Color(0xffCCD4D3),
                secondary: secondary,
                surface: Color(0xff16163a),
                background: Color(0xff807D7D),
                error: errorColor,
                onPrimary: Color(0xff292D32),
                onSecondary: Color(0xffCCD4D3),
                onSurface: Color(0xffF2F2F5),
                onBackground: Colors.white,
                onError: Colors.black,
                surfaceTint: primary,
                onSurfaceVariant: Color(
                  0xffA0A4A8,
                ),
                onPrimaryContainer: Color(0xffccd4d3),
                brightness: Brightness.light)
            .copyWith(error: red));
  }

  static ThemeData darkThemeData(Locale locale) {
    return ThemeData(
      cardColor: const Color(0xff2e2d2d),
      canvasColor: Colors.black,
      scaffoldBackgroundColor: const Color(0xff181A20),
      hintColor: const Color(0xff979797),
      primaryColorLight: const Color(0xff9431EC),
      dialogBackgroundColor: const Color(0xff0d072b),
      checkboxTheme: checkboxThemeData,
      secondaryHeaderColor: const Color(0xff121317),
      bottomSheetTheme: const BottomSheetThemeData(
          backgroundColor: Color(0xff181A20), elevation: 0),

      ///divider Theme
      dividerTheme:
          DividerThemeData(color: Colors.white.withOpacity(.3), thickness: 1),
      progressIndicatorTheme:
          const ProgressIndicatorThemeData(color: Colors.white),

      ///dialog Theme
      dialogTheme: DialogTheme(
          backgroundColor: const Color(0xff16163a),
          contentTextStyle: getTextTheme(locale).bodyMedium,
          titleTextStyle: getTextTheme(locale).bodyLarge),

      ///radio button theme
      radioTheme: RadioThemeData(
          fillColor:
              MaterialStateProperty.resolveWith<Color>((_) => secondary)),

      ///text Theme
      fontFamily: locale.languageCode == 'fa' ? "pelak" : "urbanist",
      textTheme: getTextTheme(locale).apply(
        bodyColor: const Color(0xffDFDFDF),
        displayColor: const Color(0xffDFDFDF),
      ),

      ///Icon Theme
      iconTheme: const IconThemeData(color: Colors.white),

      ///snackBar Theme
      snackBarTheme: SnackBarThemeData(
          actionTextColor: Colors.white,
          contentTextStyle: getTextTheme(locale).bodySmall,
          backgroundColor: const Color(0xFF674A71),
          elevation: 0,
          behavior: SnackBarBehavior.floating,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(16))),

      ///app Bar Theme
      appBarTheme: AppBarTheme(
          systemOverlayStyle: SystemUiOverlayStyle.light,
          titleTextStyle: getTextTheme(locale).titleLarge,
          backgroundColor: const Color(0xff0d072b),
          iconTheme: const IconThemeData(color: Colors.white),
          elevation: 0),

      inputDecorationTheme: getInputDecorationTheme(Brightness.dark),
      colorScheme: const ColorScheme(
              onSecondaryContainer: Color(0xff222429),
              shadow: Colors.white,
              primary: Color(0xff176D60),
              primaryContainer: Color(0xff4b02c4),
              secondaryContainer: Color(0xff3E3E3E),
              secondary: secondary,
              surface: Color(0xff16163a),
              background: Color(0xff807D7D),
              error: errorColor,
              onPrimary: Color(0xffdfdfdf),
              onSecondary: Color(0xff222429),
              onSurface: Color(0xffB4B9B8),
              onBackground: Colors.black,
              onError: Colors.black,
              surfaceTint: secondary,
              onSurfaceVariant: Color(
                0xffA0A4A8,
              ),
              onPrimaryContainer: Color(0xff292b31),
              brightness: Brightness.dark)
          .copyWith(error: errorColor),
    );
  }

  static getInputDecorationTheme(Brightness brightness) {
    return InputDecorationTheme(
      labelStyle: TextStyle(
        fontSize: 12.0,
        fontWeight: FontWeight.w400,
        color: brightness == Brightness.light
            ? Colors.black.withOpacity(.7)
            : darkLabelColor,
      ),
      hintStyle: const TextStyle(
        fontSize: 14.0,
        color: Colors.white,
        fontWeight: FontWeight.w400,
      ),
      errorStyle: const TextStyle(
        fontSize: 0.1,
        color: Colors.transparent,
        height: 0,
        fontWeight: FontWeight.w100,
      ),
      errorBorder: InputBorder.none,
      focusedErrorBorder: InputBorder.none,
      disabledBorder: InputBorder.none,
      contentPadding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
      fillColor: Colors.transparent,
      filled: true,
      enabledBorder: InputBorder.none,
      focusedBorder: InputBorder.none,
    );
  }

  ///textTheme
  static TextTheme getTextTheme(Locale? locale) {
    return const TextTheme(
      displayLarge: TextStyle(
          fontSize: 48,
          fontWeight: FontWeight.w700,
          textBaseline: TextBaseline.alphabetic,
          letterSpacing: -1.5),
      displayMedium: TextStyle(
          fontSize: 40,
          fontWeight: FontWeight.w700,
          textBaseline: TextBaseline.alphabetic,
          letterSpacing: -0.5),
      displaySmall: TextStyle(
          fontSize: 32,
          fontWeight: FontWeight.w700,
          textBaseline: TextBaseline.alphabetic,
          letterSpacing: 0.0),
      headlineMedium: TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.w700,
          textBaseline: TextBaseline.alphabetic,
          letterSpacing: 0.25),
      headlineSmall: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w700,
          textBaseline: TextBaseline.alphabetic,
          letterSpacing: 0.0),
      titleLarge: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w700,
          textBaseline: TextBaseline.alphabetic,
          letterSpacing: 0.15),
      bodyLarge: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w700,
          textBaseline: TextBaseline.alphabetic,
          letterSpacing: 0.5),
      bodyMedium: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w500,
          textBaseline: TextBaseline.alphabetic,
          letterSpacing: 0.25),
      titleMedium: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w500,
          textBaseline: TextBaseline.alphabetic,
          letterSpacing: 0.15),
      titleSmall: TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w500,
          textBaseline: TextBaseline.alphabetic,
          letterSpacing: 0.1),
      labelLarge: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w700,
          textBaseline: TextBaseline.alphabetic,
          letterSpacing: 1.25),
      bodySmall: TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w400,
          textBaseline: TextBaseline.alphabetic,
          letterSpacing: 0.4),
      labelSmall: TextStyle(
          fontSize: 10,
          fontWeight: FontWeight.w400,
          textBaseline: TextBaseline.alphabetic,
          letterSpacing: 1.5),
    );
  }

  static CheckboxThemeData checkboxThemeData = CheckboxThemeData(
    checkColor: MaterialStateProperty.all(Colors.white),
    fillColor: MaterialStateProperty.all(primary),
  );
}
