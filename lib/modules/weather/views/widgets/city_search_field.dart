import 'package:flutter/material.dart';

import '../../../../shared/view/components/custom_text_field.dart';

class CitySearchField extends StatelessWidget {
  const CitySearchField({super.key, required this.controller, required this.onChanged});

  final TextEditingController controller;
  final ValueChanged<String> onChanged;

  @override
  Widget build(BuildContext context) {
    return CustomTextField(
      controller: controller,
      hint: 'Search for a city…',
      prefixIcon: const Icon(Icons.search),
      suffixIcon: controller.text.isEmpty
          ? null
          : IconButton(
              icon: const Icon(Icons.close),
              onPressed: () {
                controller.clear();
                onChanged('');
              },
            ),
      onChanged: onChanged,
    );
  }
}
