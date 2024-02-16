// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:voco_riverpod_mvc/product/widget/textfield/mixin/project_textfield_mixin.dart';

class ProjectTextField extends StatefulWidget {
  final TextEditingController? controller;
  bool isPassword;
  final String? hintText;
  final Function(String onChanged)? onChanged;
  final double? height;
  final double? width;
  final TextInputType? keyboardType;
  ProjectTextField({
    super.key,
    this.controller,
    this.isPassword = false,
    this.hintText,
    this.onChanged,
    this.height,
    this.width,
    this.keyboardType,
  });

  @override
  State<ProjectTextField> createState() => _ProjectTextFieldState();
}

class _ProjectTextFieldState extends State<ProjectTextField> with ProjectTextFieldMixin {

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return SizedBox(
      width: widget.width ?? (size.width * 0.8),
      height: widget.height,
      child: TextField(
        cursorColor: Colors.white,
        cursorRadius: const Radius.circular(20),
        onChanged: widget.onChanged,
        controller: widget.controller,
        obscureText: isInvisibleText,
        keyboardType: widget.keyboardType,
        obscuringCharacter: "●",
        style: Theme.of(context).textTheme.bodyLarge,
        decoration: inputDecoration(),
      ),
    );
  }
}
