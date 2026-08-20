import 'package:flutter/material.dart';

class HorizontalSpace extends StatelessWidget {
  const HorizontalSpace(this.size, {super.key});

  final double size;

  @override
  Widget build(BuildContext context) => SizedBox(width: size);
}

class VerticalSpace extends StatelessWidget {
  const VerticalSpace(this.size, {super.key});

  final double size;

  @override
  Widget build(BuildContext context) => SizedBox(height: size);
}
