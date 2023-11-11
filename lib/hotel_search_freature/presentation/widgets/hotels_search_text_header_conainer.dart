import 'package:flutter/material.dart';

import '../../../global/utils/constants.dart';
import '../../../global/utils/my_clipper.dart';

class HotelsSearchText extends StatelessWidget {
  const HotelsSearchText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: MyClipper(),
      child: Padding(
        padding: EdgeInsetsDirectional.only(
            start: AppConstants.unitWidthValu(context) * 2),
        child: Container(
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.secondary,
          ),
          padding: EdgeInsets.only(
              bottom: AppConstants.unitHeightValue(context) * 3,
              top: AppConstants.unitHeightValue(context) * 3,
              left: AppConstants.unitWidthValu(context) * 1),
          child: Text('Hotels Search           ',
              style: Theme.of(context).textTheme.bodyLarge),
        ),
      ),
    );
  }
}
