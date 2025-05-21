import 'package:bookly_app/core/utils/service_locater.dart';
import 'package:bookly_app/features/Saved/data/repos/saved_repo_impl.dart';
import 'package:bookly_app/features/Saved/presentation/manager/saved_books_cubit/saved_books_cubit.dart';
import 'package:bookly_app/features/home/data/repos/home_repo_impl.dart';
import 'package:bookly_app/features/home/presentation/manager/featured_books_cubit/featured_books_cubit.dart';
import 'package:bookly_app/features/home/presentation/manager/newest_books_cubit/newest_books_cubit.dart';
import 'package:bookly_app/features/views_manger/manager/views_manager_cubit/views_manager_cubit.dart';
import 'package:bookly_app/features/views_manger/widgets/views_manager_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ViewsManager extends StatelessWidget {
  const ViewsManager({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => FeaturedBooksCubit(
            getIt.get<HomeRepoImpl>(),
          )..fetchFeaturedBoooks(),
        ),
        BlocProvider(
          create: (context) => NewestBooksCubit(
            getIt.get<HomeRepoImpl>(),
          )..fetchNewestBooks(),
        ),
        BlocProvider(
          create: (context) => ViewsManagerCubit(),
        ),
      ],
      child: const Scaffold(
        body: ViewsManagerBody(),
      ),
    );
  }
}
