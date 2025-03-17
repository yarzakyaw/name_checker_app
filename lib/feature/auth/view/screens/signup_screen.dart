import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:name_checker_app/core/constants/text_strings.dart';
import 'package:name_checker_app/core/utils/utils.dart';
import 'package:name_checker_app/core/widgets/dividers/form_divider_widget.dart';
import 'package:name_checker_app/core/widgets/indicators/loader.dart';
import 'package:name_checker_app/feature/auth/view/widgets/form_header_widget.dart';
import 'package:name_checker_app/feature/auth/view/widgets/signup_tabcontroller_widget.dart';
import 'package:name_checker_app/feature/auth/view/widgets/social_footer_widget.dart';
import 'package:name_checker_app/feature/auth/viewmodel/auth_view_model.dart';

class SignupScreen extends ConsumerWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isLoading = ref
        .watch(authViewModelProvider.select((val) => val?.isLoading == true));

    ref.listen(authViewModelProvider, (_, next) {
      next?.when(
        data: (data) {
          showSnackBar(
            context,
            tAccCreated,
          );
          Navigator.pushNamedAndRemoveUntil(
            context,
            '/',
            (_) => false,
          );
        },
        error: (error, st) {
          showSnackBar(context, error.toString());
        },
        loading: () {},
      );
    });
    return Scaffold(
      appBar: AppBar(),
      body: isLoading
          ? const Loader()
          : Padding(
              padding: const EdgeInsets.all(8.0),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    const FormHeaderWidget(
                      title: tSignupTitle,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      textAlign: TextAlign.center,
                    ),
                    const SignupTabcontrollerWidget(),
                    const FormDividerWidget(),
                    SocialFooterWidget(
                      text1: tAlreadyHaveAnAccount,
                      text2: tSignin,
                      onPressed: () {
                        Navigator.pushNamed(context, 'SigninScreen');
                        // Navigator.push(
                        //   context,
                        //   MaterialPageRoute(
                        //     builder: (context) => const SigninScreen(),
                        //   ),
                        // );
                      },
                    )
                  ],
                ),
              ),
            ),
    );
  }
}
