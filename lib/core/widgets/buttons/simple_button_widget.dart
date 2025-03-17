import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:name_checker_app/core/theme/app_pallete.dart';

class SimpleButtonWidget extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  const SimpleButtonWidget({
    super.key,
    required this.onPressed,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: kIsWeb ? MediaQuery.of(context).size.width / 2 : double.infinity,
      height: 60,
      child: ElevatedButton(
        onPressed: onPressed,
        child: Text(
          text,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
            fontSize: kIsWeb ? 24 : 20,
            fontWeight: FontWeight.bold,
            color: AppPallete.gradient7,
          ),
        ),
      ),
    );
  }
}
