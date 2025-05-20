import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CustomSearchTextField extends StatelessWidget {
  const CustomSearchTextField({
    super.key,
    required this.onSaved,
  });
  final void Function(String) onSaved;
  @override
  Widget build(BuildContext context) {
    final TextEditingController _controller = TextEditingController();
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0),
      child: TextFormField(
        controller: _controller,
        onFieldSubmitted: (value) {
          onSaved(value);
        },
        style: const TextStyle(color: Color(0xffE0D6F5)),
        decoration: InputDecoration(
          filled: true,
          fillColor: const Color(0xff1C1533),
          hintText: "Search",
          suffixIcon: IconButton(
              onPressed: () {
                onSaved(_controller.text);
              },
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
