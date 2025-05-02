import 'dart:async';

import 'package:bookly_app/core/widgets/custom_error_text.dart';
import 'package:bookly_app/core/widgets/custom_loading_indicator.dart';
import 'package:bookly_app/features/home/presentation/manager/featured_books_cubit/featured_books_cubit.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/featured_list_view_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FeaturedBookListView extends StatefulWidget {
  const FeaturedBookListView({super.key});

  @override
  State<FeaturedBookListView> createState() => _FeaturedBookListViewState();
}

class _FeaturedBookListViewState extends State<FeaturedBookListView> {
  final ScrollController _scrollController = ScrollController();
  late Timer _timer;
  int currIndex = 0;
  @override
  void initState() {
    super.initState();
    _startAutoScroll();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FeaturedBooksCubit, FeaturedBooksState>(
      builder: (context, state) {
        if (state is FeaturedBooksFailureState) {
          return CustomErrorText(errorMessage: state.errMessage);
        } else if (state is FeaturedBooksSuccessState) {
          return Padding(
            padding: const EdgeInsets.only(left: 15.0),
            child: SizedBox(
              height: MediaQuery.of(context).size.height / 3.625,
              child: ListView.builder(
                  controller: _scrollController,
                  physics: const BouncingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  itemCount: state.books.length,
                  itemBuilder: (context, index) {
                    return FeaturedListViewItem(
                      key: ValueKey(index),
                      selected: index == currIndex,
                      bookModel: state.books[index],
                    );
                  }),
            ),
          );
        } else {
          return const CustomLoadingIndicator();
        }
      },
    );
  }

  void _startAutoScroll() {
    _timer = Timer.periodic(const Duration(seconds: 5), (timer) {
      if (_scrollController.hasClients) {
        double maxScroll = _scrollController.position.maxScrollExtent;
        setState(() {
          currIndex++;
        });
        double nextScroll = _scrollController.offset +
            MediaQuery.of(context).size.width * (150 / 375);
        if (nextScroll >= maxScroll) {
          currIndex = 0;
          setState(() {});
          _scrollController.jumpTo(0);
        } else {
          _scrollController.animateTo(
            nextScroll + 28,
            duration: const Duration(milliseconds: 350),
            curve: Curves.easeOut,
          );
        }
      }
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }
}
