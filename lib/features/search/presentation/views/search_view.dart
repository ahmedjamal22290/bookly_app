import 'package:bookly_app/core/utils/service_locater.dart';
import 'package:bookly_app/features/search/data/repos/search_repo_impl.dart';
import 'package:bookly_app/features/search/presentation/manager/search_by_category_cubit/search_by_category_cubit_cubit.dart';
import 'package:bookly_app/features/search/presentation/manager/search_by_name_cubit/search_by_name_cubit_cubit.dart';
import 'package:bookly_app/features/search/presentation/views/widgets/search_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
            create: (context) =>
                SearchByNameCubit(getIt.get<SearchRepoImpl>())),
        BlocProvider(
            create: (context) =>
                SearchByCategoryCubit(getIt.get<SearchRepoImpl>())),
      ],
      child: const Scaffold(
        body: SearchViewBody(),
      ),
    );
  }
}
