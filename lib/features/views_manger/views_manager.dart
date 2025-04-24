import 'package:bookly_app/features/views_manger/manager/views_manager_cubit/views_manager_cubit.dart';
import 'package:bookly_app/features/views_manger/widgets/views_manager_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ViewsManager extends StatelessWidget {
  const ViewsManager({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ViewsManagerCubit(),
      child: const Scaffold(
        body: ViewsManagerBody(),
      ),
    );
  }
}
