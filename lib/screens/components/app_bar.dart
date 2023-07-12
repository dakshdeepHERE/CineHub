import 'package:movie_app/utils/app_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../cubit/app_cubid.dart';
import '../../utils/app_theme.dart';
import 'outline_border.dart';

class AppBarWidget extends StatelessWidget {
  const AppBarWidget(
      {super.key,
      this.searchTextFieldController,
      this.selectedGenreName,
      required this.haveSearchTextField});

  final TextEditingController? searchTextFieldController;
  final bool haveSearchTextField;
  final String? selectedGenreName;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      margin: const EdgeInsets.only(right: 20, left: 10, bottom: 10),
      width: size.width,
      child: Row(
        children: [
          InkWell(
            onTap: () {
              context.pop();
            },
            child: Container(
              width: 35,
              height: 35,
              color: Colors.transparent,
              margin: const EdgeInsets.only(top: 8),
              child: const Icon(
                Icons.arrow_back_ios_rounded,
                color: Colors.white,
              ),
            ),
          ),
          if (haveSearchTextField)
            Expanded(
              child: Container(
                margin: const EdgeInsets.only(top: 12, left: 15),
                child: TextField(
                  controller: searchTextFieldController,
                  style: AppTheme.getTextTheme(null)
                      .titleMedium!
                      .copyWith(color: Colors.white),
                  textInputAction: TextInputAction.search,
                  decoration: (const InputDecoration())
                      .applyDefaults(
                          AppTheme.getInputDecorationTheme(Brightness.dark))
                      .copyWith(
                          labelText: AppConstants.search,
                          suffixIcon: InkWell(
                            onTap: () {
                              String searchValue =
                                  searchTextFieldController!.text;

                              context.read<AppCubit>().searchMovie(searchValue);
                            },
                            child: const Icon(Icons.search),
                          ),
                          contentPadding: const EdgeInsets.only(left: 8),
                          disabledBorder: outlinedBorder(),
                          enabledBorder: outlinedBorder(),
                          border: outlinedBorder(),
                          focusedBorder: outlinedBorder(),
                          suffixIconColor: Colors.white),
                ),
              ),
            )
          else
            Expanded(
              child: Container(
                margin: const EdgeInsets.only(left: 10, top: 7),
                child: Text(
                  selectedGenreName!,
                  textAlign: TextAlign.left,
                  style: AppTheme.getTextTheme(null)
                      .bodyLarge!
                      .copyWith(color: Colors.white),
                ),
              ),
            )
        ],
      ),
    );
  }
}
