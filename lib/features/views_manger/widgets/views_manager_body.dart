import 'package:bookly_app/features/views_manger/manager/views_manager_cubit/views_manager_cubit.dart';
import 'package:bookly_app/features/views_manger/widgets/custom_page_view.dart';
import 'package:bookly_app/features/views_manger/widgets/custom_tool_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ViewsManagerBody extends StatefulWidget {
  const ViewsManagerBody({super.key});

  @override
  State<ViewsManagerBody> createState() => _ViewsManagerBodyState();
}

class _ViewsManagerBodyState extends State<ViewsManagerBody> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ViewsManagerCubit, ViewsManagerState>(
      builder: (context, state) {
        return const Stack(
          children: [
            CustomPageView(),
            CustomToolBar(),
          ],
        );
      },
    );
  }
}
