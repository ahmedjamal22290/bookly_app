import 'dart:developer';

import 'package:bookly_app/features/Audio/presentation/views/Audio_view.dart';
import 'package:bookly_app/features/Saved/presentation/views/saved_view.dart';
import 'package:bookly_app/features/home/presentation/views/home_view.dart';
import 'package:bookly_app/features/profile/presentation/views/profile_view.dart';
import 'package:bookly_app/features/views_manger/manager/views_manager_cubit/views_manager_cubit.dart';
import 'package:bookly_app/features/views_manger/widgets/custom_tool_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ViewsManagerBody extends StatelessWidget {
  const ViewsManagerBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ViewsManagerCubit, ViewsManagerState>(
      builder: (context, state) {
        return Stack(
          children: [
            CustomPageView(),
            const CustomToolBar(),
          ],
        );
      },
    );
  }
}

class CustomPageView extends StatefulWidget {
  const CustomPageView({
    super.key,
  });

  @override
  State<CustomPageView> createState() => _CustomPageViewState();
}

class _CustomPageViewState extends State<CustomPageView> {
  PageController _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ViewsManagerCubit, ViewsManagerState>(
      listener: (context, state) {
        if (state is CombinedViewState) {
          _pageController.jumpToPage(0);
          BlocProvider.of<ViewsManagerCubit>(context).index = 0;
        }
        if (state is SavedViewState) {
          _pageController.jumpToPage(1);
          BlocProvider.of<ViewsManagerCubit>(context).index = 1;
        }
        if (state is AudioViewState) {
          _pageController.jumpToPage(2);
          BlocProvider.of<ViewsManagerCubit>(context).index = 2;
        }
        if (state is ProfileViewState) {
          _pageController.jumpToPage(3);
          BlocProvider.of<ViewsManagerCubit>(context).index = 3;
        }
      },
      builder: (context, state) {
        return PageView(
          onPageChanged: (pageIndex) {
            BlocProvider.of<ViewsManagerCubit>(context).index = pageIndex;
            log(pageIndex.toString());
            BlocProvider.of<ViewsManagerCubit>(context).whatIndex();
          },
          controller: _pageController,
          scrollDirection: Axis.horizontal,
          children: [
            HomeView(),
            SavedView(),
            AudioView(),
            ProfileView(),
          ],
        );
      },
    );
  }
}
