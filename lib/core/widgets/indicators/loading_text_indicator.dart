import 'package:flutter/material.dart';
import 'package:name_checker_app/core/constants/text_strings.dart';
import 'package:name_checker_app/core/theme/app_pallete.dart';

class LoadingTextIndicator extends StatelessWidget {
  const LoadingTextIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const SizedBox(
          width: 20,
          height: 20,
          child: CircularProgressIndicator(color: AppPallete.whiteColor),
        ),
        const SizedBox(width: 10),
        Text(
          tLoading,
          style: Theme.of(context).textTheme.bodyLarge!.apply(
                color: AppPallete.whiteColor,
              ),
        )
      ],
    );
  }
}
