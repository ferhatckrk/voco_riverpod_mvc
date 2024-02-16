import 'package:flutter/material.dart';

import '../project_textfield.dart';

mixin ProjectTextFieldMixin on State<ProjectTextField> {
  bool isInvisibleText = false;

  @override
  void initState() {
    super.initState();
    isInvisibleText = widget.isPassword ? true : false;
  }

 InputDecoration inputDecoration() {
    return InputDecoration(
      suffixIcon: widget.isPassword
          ? GestureDetector(
              onTap: () {
                setState(() {
                  isInvisibleText = !isInvisibleText;
                });
              },
              child: Icon(
                isInvisibleText ? Icons.visibility_off : Icons.visibility,
                color: Theme.of(context).colorScheme.onPrimary,
              ))
          : const SizedBox(),
      hintText: widget.hintText,
      hintStyle: Theme.of(context).textTheme.displaySmall!.copyWith(
            color: Theme.of(context).colorScheme.onPrimary.withOpacity(0.5),
          ),
      border: InputBorder.none,
      filled: true,
      fillColor: Theme.of(context).colorScheme.onBackground,
      focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: Theme.of(context).colorScheme.surface)),
      enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide:
              BorderSide(color: Theme.of(context).colorScheme.onSurface)),
    );
  }
}
