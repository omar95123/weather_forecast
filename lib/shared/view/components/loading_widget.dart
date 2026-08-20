import 'package:flutter/material.dart';

import '../helper/export.dart';

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({super.key, this.size = 28});

  final double size;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: size,
        height: size,
        child: CircularProgressIndicator(strokeWidth: 2.6, color: Palette().primary),
      ),
    );
  }
}
