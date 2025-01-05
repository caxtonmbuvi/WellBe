import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.text,
    this.onTap,
    this.color,
    this.textColor = Colors.white,
    this.radius = 22,
    this.isIconButton = false,
    this.isBorder = false,
    this.widget,
    this.fontSize = 16,
    this.height = 45,
    this.width,
    this.fontWeight = FontWeight.normal,
  });
  final String text;
  final VoidCallback? onTap;
  final Color? color;
  final Color? textColor;
  final double radius;
  final bool isIconButton;
  final bool isBorder;
  final Widget? widget;
  final double fontSize;
  final double? height;
  final double? width;
  final FontWeight fontWeight;

  @override
  Widget build(BuildContext context) {
    final adjustedHeight = height ?? 50.0;

    return SizedBox(
      height: adjustedHeight,
      width: width,
      child: ElevatedButton(
        onPressed: onTap,
        style: ButtonStyle(
          shape: WidgetStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(radius),
              side: isBorder
                  ? const BorderSide(
                      color: Colors.blueAccent,
                    )
                  : BorderSide.none,
            ),
          ),
          backgroundColor: WidgetStateProperty.all(
            color ?? Colors.blue,
          ),
          elevation: WidgetStateProperty.all(0),
        ),
        child: isIconButton
            ? Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    text,
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: textColor,
                          fontSize: fontSize,
                          fontWeight: fontWeight,
                        ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  widget!,
                ],
              )
            : Text(
                    text,
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: textColor,
                          fontSize: fontSize,
                          fontWeight: fontWeight,
                        ),
                  ),
      ),
    );
  }
}
