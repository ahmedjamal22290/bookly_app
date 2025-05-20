import 'dart:developer';

import 'package:bookly_app/core/widgets/custom_error_text.dart';
import 'package:bookly_app/core/widgets/custom_loading_indicator.dart';
import 'package:bookly_app/features/search/presentation/manager/search_by_category_cubit/search_by_category_cubit_cubit.dart';
import 'package:bookly_app/features/search/presentation/manager/search_by_name_cubit/search_by_name_cubit_cubit.dart';
import 'package:bookly_app/features/search/presentation/views/widgets/category_button.dart';
import 'package:bookly_app/features/search/presentation/views/widgets/custom_search_text_field.dart';
import 'package:bookly_app/features/search/presentation/views/widgets/search_result_list_view.dart';
import 'package:bookly_app/features/search/presentation/views/widgets/search_view_appBar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchViewBody extends StatefulWidget {
  const SearchViewBody({super.key});

  @override
  State<SearchViewBody> createState() => _SearchViewBodyState();
}

class _SearchViewBodyState extends State<SearchViewBody> {
  bool searchByCategory = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          Expanded(
            child: CustomScrollView(
              physics: const BouncingScrollPhysics(),
              slivers: [
                const SliverToBoxAdapter(
                  child: Column(
                    children: [
                      SearchViewAppBar(),
                      SizedBox(height: 40),
                    ],
                  ),
                ),
                SliverToBoxAdapter(
                  child: CustomSearchTextField(
                    onSaved: (value) {
                      log(value);
                    },
                  ),
                ),
                SliverToBoxAdapter(
                  child: CategoryButton(
                    isCategory: searchByCategory,
                    onToggle: (value) {
                      setState(() {
                        searchByCategory = value;
                      });
                    },
                  ),
                ),
                const SliverToBoxAdapter(
                  child: SizedBox(height: 16),
                ),
                SliverToBoxAdapter(
                  child: searchByCategory
                      ? BlocBuilder<SearchByCategoryCubit,
                              SearchByCategoryCubitState>(
                          builder: (context, state) {
                          if (state is SearchByCategoryCubitLoading) {
                            return const CustomLoadingIndicator();
                          } else if (state is SearchByCategoryCubitSuccess) {
                            return SearchResultListView(
                              list: state.books,
                            );
                          } else if (state is SearchByCategoryCubitFailure) {
                            return CustomErrorText(
                                errorMessage: state.errorMessage);
                          } else {
                            return const CustomErrorText(
                                errorMessage: 'Start Searching...');
                          }
                        })
                      : BlocBuilder<SearchByNameCubit, SearchByNameCubitState>(
                          builder: (context, state) {
                          if (state is SearchByNameCubitLoading) {
                            return const CustomLoadingIndicator();
                          } else if (state is SearchByNameCubitFailure) {
                            return CustomErrorText(
                                errorMessage: state.errorMessage);
                          } else if (state is SearchByNameCubitSuccess) {
                            return SearchResultListView(list: state.books);
                          } else {
                            return const CustomErrorText(
                                errorMessage: 'Start Searching...');
                          }
                        }),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
