import 'package:flutter/material.dart';
import 'package:name_checker_app/core/constants/text_strings.dart';
import 'package:name_checker_app/core/theme/app_pallete.dart';

class FormDividerWidget extends StatelessWidget {
  const FormDividerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = MediaQuery.of(context).platformBrightness == Brightness.dark;
    final lineColor = isDark ? AppPallete.gradient4 : AppPallete.gradient4;
    return Row(
      children: [
        Flexible(
          child: Divider(
            thickness: 1,
            indent: 50,
            color: lineColor,
            endIndent: 10,
          ),
        ),
        Text(
          tOr,
          style: Theme.of(context).textTheme.bodyLarge!.apply(
                color: isDark ? AppPallete.whiteColor : AppPallete.whiteColor,
              ),
        ),
        Flexible(
          child: Divider(
            thickness: 1,
            indent: 10,
            color: lineColor,
            endIndent: 50,
          ),
        ),
      ],
    );
  }
}
