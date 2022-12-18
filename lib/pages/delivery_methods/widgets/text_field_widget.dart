import 'package:flutter/material.dart';
import 'package:parcel_delivery_app/core/colors.dart';

class TextFieldWidget extends StatelessWidget {
  const TextFieldWidget({
    super.key,
    required this.title,
    required this.hint,
    required this.type,
    required this.action,
  });
  final String title, hint;
  final TextInputType type;
  final TextInputAction action;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: Theme.of(context).textTheme.bodySmall,
        ),
        const SizedBox(height: 2),
        TextField(
          keyboardType: type,
          textInputAction: action,
          decoration: InputDecoration(
            hintText: hint,
            enabled: true,
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(
                color: kgrey,
              ),
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(
                color: kgrey,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(
                color: kblack,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
