import 'package:bookly_app/features/home/presentation/views/home_view.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/home_view_body.dart';
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
            if (state is CombinedView) const HomeView(),
            if (state is SavedView)
              if (state is AudioView)
                if (state is ProfileView) const CustomToolBar(),
          ],
        );
      },
    );
  }
}
