import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CustomSearchTextField extends StatelessWidget {
  const CustomSearchTextField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0),
      child: TextFormField(
        style: const TextStyle(color: Color(0xffE0D6F5)),
        decoration: InputDecoration(
          filled: true,
          fillColor: const Color(0xff1C1533),
          hintText: "Search",
          suffixIcon: IconButton(
              onPressed: () {},
              icon: const Icon(
                FontAwesomeIcons.magnifyingGlass,
                size: 15,
              )),
          enabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Color(0xFF64598A))),
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(
              color: Color(0xff332B50),
            ),
            borderRadius: BorderRadius.all(
              Radius.circular(20),
            ),
          ),
        ),
      ),
    );
  }
}
