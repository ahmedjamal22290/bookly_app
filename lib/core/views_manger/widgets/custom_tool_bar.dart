import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CustomToolBar extends StatelessWidget {
  const CustomToolBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
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
                SvgPicture.asset(
                  'assets/icons/Combined Shape.svg',
                  width: 16,
                  height: 20,
                  colorFilter:
                      const ColorFilter.mode(Colors.white, BlendMode.srcATop),
                ),
                SvgPicture.asset(
                  'assets/icons/Saved.svg',
                  width: 16,
                  height: 20,
                  colorFilter:
                      const ColorFilter.mode(Colors.white, BlendMode.srcATop),
                ),
                SvgPicture.asset(
                  'assets/icons/Audio.svg',
                  width: 16,
                  height: 20,
                  colorFilter:
                      const ColorFilter.mode(Colors.white, BlendMode.srcATop),
                ),
                Image.asset(
                  'assets/images/Profile.png',
                  width: 26,
                  height: 26,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
