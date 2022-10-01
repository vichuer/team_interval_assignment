import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String hint;
  final IconData iconData;
  final bool? isObscure;
  final TextInputType? type;
  final Function()? toggleVisibility;
  final bool? isVisible;
  final TextEditingController controller;

  const CustomTextField(
      {super.key,
      required this.hint,
      required this.iconData,
      required this.controller,
      this.isObscure,
      this.type,
      this.toggleVisibility,
      this.isVisible});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          border: Border.all(color: Colors.green),
          borderRadius: BorderRadius.circular(15)),
      child: Padding(
        padding: const EdgeInsets.only(left: 8.0),
        child: TextField(
          controller: controller,
          textAlignVertical: TextAlignVertical.center,
          keyboardType: type,
          style: TextStyle(color: Colors.white),
          obscureText: isVisible == null ? false : !isVisible!,
          decoration: InputDecoration(
              border: InputBorder.none,
              hintText: hint,
              hintStyle: TextStyle(color: Colors.lightGreen),
              prefixIcon: Icon(
                iconData,
                color: Colors.lightGreen,
              ),
              suffixIcon: isObscure == null
                  ? null
                  : IconButton(
                      onPressed: toggleVisibility,
                      icon: Icon(!isVisible!
                          ? Icons.visibility
                          : Icons.visibility_off))),
        ),
      ),
    );
  }
}
