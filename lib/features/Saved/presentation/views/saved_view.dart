import 'package:bookly_app/features/Saved/presentation/views/widgets/saved_view_body.dart';
import 'package:flutter/material.dart';

class SavedView extends StatelessWidget {
  const SavedView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SavedViewBody(),
    );
  }
}
