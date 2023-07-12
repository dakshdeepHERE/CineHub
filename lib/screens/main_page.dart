// ignore_for_file: use_build_context_synchronously

import 'package:movie_app/cubit/app_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../cubit/app_cubid.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: TextButton(
                onPressed: () async {
                  await context.read<AppCubit>().fetchMovieApi();
                  await context.read<AppCubit>().getGenreList();
                  context.push('/movieList');
                },
                child: const Text(
                  'Enter the CineHub',
                  style: TextStyle(fontSize: 22),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
