import 'package:flutter/material.dart';

InputDecoration decoration(BuildContext context, String text) {
  return InputDecoration(
    fillColor: Theme.of(context).colorScheme.primary,
    filled: true,
    hintText: text,
    hintStyle: Theme.of(context).textTheme.bodySmall,
    border: OutlineInputBorder(borderRadius: BorderRadius.circular(30)),
  );
}
