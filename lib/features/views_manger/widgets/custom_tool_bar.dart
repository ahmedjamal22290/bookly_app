import 'dart:ui';

import 'package:bookly_app/features/views_manger/manager/views_manager_cubit/views_manager_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

class CustomToolBar extends StatefulWidget {
  const CustomToolBar({
    super.key,
  });

  @override
  State<CustomToolBar> createState() => _CustomToolBarState();
}

class _CustomToolBarState extends State<CustomToolBar> {
  // int index = 0;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ViewsManagerCubit, ViewsManagerState>(
        listener: (context, state) {
      if (state is CombinedViewState) {
        BlocProvider.of<ViewsManagerCubit>(context).index = 0;

        setState(() {});
      }
      if (state is SavedViewState) {
        BlocProvider.of<ViewsManagerCubit>(context).index = 1;
        setState(() {});
      }
      if (state is AudioViewState) {
        BlocProvider.of<ViewsManagerCubit>(context).index = 2;
        setState(() {});
      }
      if (state is ProfileViewState) {
        BlocProvider.of<ViewsManagerCubit>(context).index = 3;
        setState(() {});
      }
    }, builder: (context, index) {
      return Positioned(
        bottom: 30,
        left: MediaQuery.sizeOf(context).width * 0.184,
        right: MediaQuery.sizeOf(context).width * 0.181,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(32),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 15, sigmaY: 15),
            child: Container(
              width: MediaQuery.sizeOf(context).width * 0.6346,
              height: 51,
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.1),
                borderRadius: BorderRadius.circular(32),
                border: Border.all(
                  color: Colors.white.withOpacity(0.2),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  InkWell(
                    onTap: () {
                      BlocProvider.of<ViewsManagerCubit>(context).index = 0;
                      BlocProvider.of<ViewsManagerCubit>(context)
                          .navigateToPage(0);
                      setState(() {});
                    },
                    child: SvgPicture.asset(
                      'assets/icons/Combined Shape.svg',
                      width: 16,
                      height: 20,
                      colorFilter: ColorFilter.mode(
                          BlocProvider.of<ViewsManagerCubit>(context).index == 0
                              ? Colors.white
                              : Colors.black.withOpacity(0.5),
                          BlendMode.srcATop),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      BlocProvider.of<ViewsManagerCubit>(context).index = 1;
                      BlocProvider.of<ViewsManagerCubit>(context)
                          .navigateToPage(1);
                      setState(() {});
                    },
                    child: SvgPicture.asset(
                      'assets/icons/Saved.svg',
                      width: 16,
                      height: 20,
                      colorFilter: ColorFilter.mode(
                          BlocProvider.of<ViewsManagerCubit>(context).index == 1
                              ? Colors.white
                              : Colors.black.withOpacity(0.5),
                          BlendMode.srcATop),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      BlocProvider.of<ViewsManagerCubit>(context).index = 2;
                      BlocProvider.of<ViewsManagerCubit>(context)
                          .navigateToPage(2);
                      setState(() {});
                    },
                    child: SvgPicture.asset(
                      'assets/icons/Audio.svg',
                      width: 16,
                      height: 20,
                      colorFilter: ColorFilter.mode(
                          BlocProvider.of<ViewsManagerCubit>(context).index == 2
                              ? Colors.white
                              : Colors.black.withOpacity(0.5),
                          BlendMode.srcATop),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      BlocProvider.of<ViewsManagerCubit>(context).index = 3;
                      BlocProvider.of<ViewsManagerCubit>(context)
                          .navigateToPage(3);
                      setState(() {});
                    },
                    child: Image.asset(
                      'assets/images/Profile.png',
                      width: 26,
                      height: 26,
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      );
    });
  }
}
