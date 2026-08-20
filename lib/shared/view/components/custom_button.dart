import 'package:flutter/material.dart';

import '../helper/export.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.text,
    this.onTap,
    this.isOutlined = false,
    this.isLoading = false,
    this.child,
    this.backgroundColor,
    this.textColor,
    this.width,
    this.height = 52,
    this.borderRadius = 14,
  });

  final String text;
  final VoidCallback? onTap;
  final bool isOutlined;
  final bool isLoading;
  final Widget? child;
  final Color? backgroundColor;
  final Color? textColor;
  final double? width;
  final double height;
  final double borderRadius;

  @override
  Widget build(BuildContext context) {
    final defaultBgColor = isOutlined ? Palette().white : Palette().primary;
    final defaultTextColor = isOutlined ? Palette().primary : Palette().white;

    return SizedBox(
      width: width ?? double.infinity,
      height: height,
      child: ElevatedButton(
        onPressed: isLoading ? null : onTap,
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor ?? defaultBgColor,
          foregroundColor: textColor ?? defaultTextColor,
          elevation: isOutlined ? 0 : 1,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius),
            side: isOutlined ? BorderSide(color: Palette().primary, width: 1.5) : BorderSide.none,
          ),
        ),
        child: isLoading
            ? SizedBox(
                width: 22,
                height: 22,
                child: CircularProgressIndicator(
                  strokeWidth: 2.4,
                  color: textColor ?? defaultTextColor,
                ),
              )
            : (child ?? Text(text, style: TextStyles().button.copyWith(color: textColor ?? defaultTextColor))),
      ),
    );
  }
}
