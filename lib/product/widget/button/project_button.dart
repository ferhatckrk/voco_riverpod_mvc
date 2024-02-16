import 'package:flutter/material.dart';

class ProjectButton extends StatelessWidget {
  final String text;
  final VoidCallback? function;
  final double height;
  final double? width;
  final Color? color;
  final Color? textColor;
  
  const ProjectButton({
    Key? key,
    required this.text,
    required this.function,
    this.height = 55,
    this.width,
    this.textColor,
    this.color,
  }) : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return Container(
      height: height,
      width: width ?? (size.width * 0.8),
      decoration: BoxDecoration(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(15),
      ),
      child: ElevatedButton(
        onPressed: function,
        style: ElevatedButton.styleFrom(
          backgroundColor: color ?? Colors.blue,
          shadowColor: Colors.transparent,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        ),
        child: Text(
          text,
          style: Theme.of(context)
              .textTheme
              .displayLarge!
              .copyWith(color: textColor),
        ),
      ),
    );
  }
}
