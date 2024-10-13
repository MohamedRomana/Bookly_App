import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CustomSearchTextField extends StatelessWidget {
  const CustomSearchTextField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      cursorColor: Colors.blue,
      decoration: InputDecoration(
        enabledBorder: buildOutlineInputBorder(
          const BorderSide(color: Colors.white),
        ),
        focusedBorder: buildOutlineInputBorder(
          const BorderSide(color: Colors.blue),
        ),
        hintText: 'Search',
        suffixIcon: const Icon(
          FontAwesomeIcons.magnifyingGlass,
          size: 23,
        ),
      ),
    );
  }

  OutlineInputBorder buildOutlineInputBorder(BorderSide borderSide) {
    return OutlineInputBorder(
      borderSide: borderSide,
      borderRadius: BorderRadius.circular(16),
    );
  }
}
