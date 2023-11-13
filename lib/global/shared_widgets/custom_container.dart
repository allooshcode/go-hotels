import 'package:flutter/material.dart';

import '../utils/constants.dart';

class CustomContainer extends StatelessWidget {
  const CustomContainer({Key? key, required this.child}) : super(key: key);
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: AppConstants.unitWidthValu(context) * 90,
      // height: AppConstants.unitHeightValue(context) * 10,
      margin: const EdgeInsets.all(4),
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.primary,
          borderRadius: BorderRadius.circular(30)),
      child: child,
    );
  }
}
