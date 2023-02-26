import 'package:flutter/material.dart';

class MarksTextField extends StatelessWidget {
  final TextEditingController? controller;
  final bool readOnly;
  final void Function(String)? onChange;

  const MarksTextField({
    this.controller,
    this.onChange,
    this.readOnly = false,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      textAlign: TextAlign.center,
      controller: controller,
      onChanged: onChange,
      readOnly: readOnly,
      decoration: const InputDecoration(
          filled: true,
          contentPadding: EdgeInsets.zero,
          border: OutlineInputBorder(
            borderSide: BorderSide.none,
          )),
    );
  }
}
