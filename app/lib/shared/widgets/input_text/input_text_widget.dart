import 'package:flutter/material.dart';

import 'package:app/shared/themes/app_colors.dart';
import 'package:app/shared/themes/app_text_styles.dart';

class InputTextWidget extends StatelessWidget {
  const InputTextWidget({
    Key? key,
    required this.label,
    required this.icon,
    this.initialValue,
    this.validator,
    this.controller,
    required this.onChanged
  }) : super(key: key);
  final String label;
  final IconData icon;
  final String? initialValue;
  final String? Function(String?)? validator;
  final TextEditingController? controller;
  final void Function(String value) onChanged;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: Column(
        children: [
          TextFormField(
            onChanged: onChanged,
            controller: controller,
            initialValue: initialValue,
            validator: validator,
            style: TextStyles.input,
            decoration: InputDecoration(
              contentPadding: EdgeInsets.zero,
              labelText: label,
              labelStyle: TextStyles.input,
              icon: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                   Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 18.0),
                    child: Icon(icon,
                        color: AppColors.primary),
                  ),
                  Container(
                    width: 1,
                    height: 48,
                    color: AppColors.stroke,
                  )
                ],
              ),
              border: InputBorder.none,
            ),
          ),
          const Divider(
            thickness: 1,
            height: 1,
            color: AppColors.stroke,
          ),
        ],
      ),
    );
  }
}
