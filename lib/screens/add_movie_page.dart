import 'dart:io';
import 'package:movie_app/screens/components/loading.dart';
import 'package:movie_app/utils/app_constants.dart';
import 'package:bottom_picker/bottom_picker.dart';
import 'package:bottom_picker/resources/arrays.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import '../cubit/app_cubid.dart';
import '../cubit/app_state.dart';
import '../utils/app_theme.dart';
import '../utils/colors.dart';
import 'components/outline_border.dart';

class AddMoviePage extends HookWidget {
  const AddMoviePage({super.key});
  @override
  Widget build(BuildContext context) {
    final movieName = useTextEditingController();
    final movieDirector = useTextEditingController();
    return SafeArea(
      child: Scaffold(
        backgroundColor: greyBackground,
        body: BlocBuilder<AppCubit, AppState>(
          builder: (context, state) {
            return Stack(
              children: [
                Column(
                  children: [
                    Expanded(
                      child: ListView(
                        shrinkWrap: true,
                        children: [
                          movieAndDirectorNameTextFieldsWidget(
                              movieName, movieDirector),
                          otherMovieInfoWidget(context, state)
                        ],
                      ),
                    ),
                    submitButtinWidget(context, movieName, movieDirector)
                  ],
                ),
                if (state.isLoading) showLoading()
              ],
            );
          },
        ),
      ),
    );
  }

  Column otherMovieInfoWidget(BuildContext context, AppState state) {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.only(top: 20, left: 20, right: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '${AppConstants.country}:',
                style: AppTheme.getTextTheme(null)
                    .bodyMedium!
                    .copyWith(fontSize: 19, color: Colors.white),
              ),
              TextButton(
                  onPressed: () {
                    countryPicker(
                      context,
                    );
                    FocusScope.of(context).requestFocus(
                      FocusNode(),
                    );
                  },
                  child: Text(
                    state.selectedCountryName ?? AppConstants.select,
                    style: const TextStyle(fontSize: 17),
                  ))
            ],
          ),
        ),
        Container(
          margin: const EdgeInsets.only(top: 20, left: 20, right: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '${AppConstants.date}:',
                style: AppTheme.getTextTheme(null)
                    .bodySmall!
                    .copyWith(fontSize: 19, color: Colors.white),
              ),
              TextButton(
                  onPressed: () {
                    movieDatePicker(context);
                    FocusScope.of(context).requestFocus(
                      FocusNode(),
                    );
                  },
                  child: Text(
                    state.selectedMovieDate ?? AppConstants.select,
                    style: const TextStyle(fontSize: 17),
                  ))
            ],
          ),
        ),
        Container(
          margin: const EdgeInsets.only(top: 20, left: 20, right: 18),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '${AppConstants.movieImage}:',
                style: AppTheme.getTextTheme(null)
                    .bodySmall!
                    .copyWith(fontSize: 19, color: Colors.white),
              ),
              TextButton(
                onPressed: () {
                  context.read<AppCubit>().selectImage();
                  FocusScope.of(context).requestFocus(
                    FocusNode(),
                  );
                },
                child: state.selectedImage != null
                    ? ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: Image.file(
                          File(state.selectedImage!),
                          height: 80,
                          width: 70,
                          fit: BoxFit.cover,
                        ),
                      )
                    : const Text(
                        AppConstants.select,
                        style: TextStyle(fontSize: 17),
                      ),
              )
            ],
          ),
        ),
        Container(
          margin: const EdgeInsets.only(left: 20, top: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '${AppConstants.movieRate}:',
                style: AppTheme.getTextTheme(null)
                    .bodySmall!
                    .copyWith(fontSize: 19, color: Colors.white),
              ),
              Container(
                margin: const EdgeInsets.only(right: 10),
                width: 140,
                child: RatingBar.builder(
                  initialRating: 3,
                  minRating: 1,
                  direction: Axis.horizontal,
                  allowHalfRating: true,
                  itemSize: 25,
                  itemCount: 5,
                  itemPadding: const EdgeInsets.symmetric(horizontal: 1.0),
                  itemBuilder: (context, _) => const Icon(
                    Icons.star,
                    color: Colors.amber,
                  ),
                  onRatingUpdate: (rating) {
                    context.read<AppCubit>().setMovieRate(
                          rating.toInt(),
                        );
                  },
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Column movieAndDirectorNameTextFieldsWidget(
      TextEditingController movieName, TextEditingController movieDirector) {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.only(top: 40, right: 20, left: 20),
          child: TextField(
            controller: movieName,
            style: AppTheme.getTextTheme(null)
                .bodyMedium!
                .copyWith(color: Colors.white),
            decoration: InputDecoration(
              labelText: 'Movie name',
              labelStyle: AppTheme.getTextTheme(null)
                  .bodyMedium!
                  .copyWith(color: Colors.white),
              disabledBorder: outlinedBorder(),
              enabledBorder: outlinedBorder(),
              border: outlinedBorder(),
              focusedBorder: outlinedBorder(),
            ),
          ),
        ),
        Container(
          margin: const EdgeInsets.only(top: 20, right: 20, left: 20),
          child: TextField(
            controller: movieDirector,
            style: AppTheme.getTextTheme(null)
                .bodyMedium!
                .copyWith(color: Colors.white),
            decoration: InputDecoration(
              labelText: 'Director name',
              labelStyle: AppTheme.getTextTheme(null)
                  .bodyMedium!
                  .copyWith(color: Colors.white),
              disabledBorder: outlinedBorder(),
              enabledBorder: outlinedBorder(),
              border: outlinedBorder(),
              focusedBorder: outlinedBorder(),
            ),
          ),
        ),
      ],
    );
  }

  Container submitButtinWidget(BuildContext context,
      TextEditingController movieName, TextEditingController movieDirector) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 45,
      decoration: BoxDecoration(
        color: Colors.blueAccent,
        borderRadius: BorderRadius.circular(12),
      ),
      margin: const EdgeInsets.only(bottom: 30, right: 20, left: 20),
      child: InkWell(
        onTap: () {
          context
              .read<AppCubit>()
              .addMovie(movieName.text, movieDirector.text, context);
        },
        child: Container(
          child: const Center(
            child: Text(
              AppConstants.submit,
              style: TextStyle(fontSize: 20, color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }

  void countryPicker(BuildContext context) {
    List<Text> countryTextWidgetList = [];
    for (var element in AppConstants.countryList) {
      countryTextWidgetList.add(Text(element));
    }
    BottomPicker(
      height: 250,
      backgroundColor: grey,
      items: countryTextWidgetList,
      dismissable: true,
      title: AppConstants.chooseMovieCountry,
      onSubmit: (index) {
        context
            .read<AppCubit>()
            .setSelectedCountryName(index, AppConstants.countryList);
      },
      titleStyle: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 20,
        color: Colors.white.withOpacity(0.5),
      ),
      pickerTextStyle: const TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.bold,
        fontSize: 20,
      ),
      displayButtonIcon: true,
      displayCloseIcon: true,
      closeIconColor: Colors.white,
      displaySubmitButton: true,
      bottomPickerTheme: BottomPickerTheme.blue,
    ).show(context);
  }

  void movieDatePicker(BuildContext context) {
    BottomPicker.date(
      height: 250,
      title: AppConstants.chooseMovieDate,
      backgroundColor: grey,
      dismissable: true,
      dateOrder: DatePickerDateOrder.dmy,
      pickerTextStyle: const TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.bold,
        fontSize: 18,
      ),
      titleStyle: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 20,
        color: Colors.white.withOpacity(0.5),
      ),
      initialDateTime: DateTime(
          context.read<AppCubit>().returnYear(),
          context.read<AppCubit>().returnMonth(),
          context.read<AppCubit>().returnDay()),
      onSubmit: (date) {
        context.read<AppCubit>().setSelectedMovieDate(
              date.toString(),
            );
      },
      maxDateTime: DateTime.now(),
      displayCloseIcon: true,
      closeIconColor: Colors.white,
      minDateTime: DateTime(1895),
      bottomPickerTheme: BottomPickerTheme.blue,
    ).show(context);
  }
}
