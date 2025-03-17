import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:name_checker_app/core/constants/text_strings.dart';
import 'package:name_checker_app/core/theme/app_pallete.dart';
import 'package:name_checker_app/core/utils/utils.dart';
import 'package:name_checker_app/core/widgets/buttons/simple_button_widget.dart';
import 'package:name_checker_app/core/widgets/formFields/custom_textform_field.dart';
import 'package:name_checker_app/feature/auth/viewmodel/auth_view_model.dart';

class SignupTabcontrollerWidget extends ConsumerStatefulWidget {
  const SignupTabcontrollerWidget({super.key});

  @override
  ConsumerState<SignupTabcontrollerWidget> createState() =>
      _SignupTabcontrollerWidgetState();
}

class _SignupTabcontrollerWidgetState
    extends ConsumerState<SignupTabcontrollerWidget>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();
  final passwordController = TextEditingController();
  var showPassword = false;

  final formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    _tabController = TabController(
      length: tabOptions.length,
      vsync: this,
    );
  }

  @override
  void dispose() {
    _tabController.dispose();
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    phoneController.dispose();
    super.dispose();
  }

  List<Widget> tabOptions = [
    const Tab(text: tSignupWithEmail),
    const Tab(text: tSignupWithPhone),
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 475,
      child: Form(
        key: formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TabBar(
              labelStyle: Theme.of(context).textTheme.bodyLarge,
              controller: _tabController,
              tabs: tabOptions,
              indicator: UnderlineTabIndicator(
                borderSide: BorderSide(
                  width: 2.0,
                  color: AppPallete.gradient4,
                ),
                insets: const EdgeInsets.symmetric(horizontal: 0.0),
              ),
              indicatorWeight: 4.0,
              //labelPadding: const EdgeInsets.only(left: 30.0, right: 30.0),
            ),
            Expanded(
              child: TabBarView(
                controller: _tabController,
                children: [
                  Column(
                    children: [
                      const SizedBox(height: 15),
                      CustomTextformField(
                        hintText: tName,
                        controller: nameController,
                        prefixIcon: const Icon(LineAwesomeIcons.user),
                        validator: (value) {
                          if (value!.trim().isEmpty) {
                            return tNameMissing;
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 15),
                      CustomTextformField(
                        hintText: tEmail,
                        controller: emailController,
                        prefixIcon: const Icon(LineAwesomeIcons.envelope),
                        validator: (value) {
                          if (value!.trim().isEmpty) {
                            return tEmailMissing;
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 15),
                      CustomTextformField(
                        hintText: tPassword,
                        controller: passwordController,
                        isObscureText: !showPassword,
                        prefixIcon: const Icon(Icons.lock),
                        suffixIcon: IconButton(
                          icon: showPassword
                              ? const Icon(LineAwesomeIcons.eye)
                              : const Icon(LineAwesomeIcons.eye_slash),
                          onPressed: () {
                            setState(() {
                              showPassword = !showPassword;
                            });
                          },
                        ),
                        validator: (value) {
                          return validatePassword(value);
                        },
                      ),
                      const SizedBox(height: 20),
                      SimpleButtonWidget(
                        text: tSignupBody,
                        onPressed: () async {
                          if (formKey.currentState!.validate()) {
                            await ref
                                .read(authViewModelProvider.notifier)
                                .signupUser(
                                  name: nameController.text.trim(),
                                  email: emailController.text.trim(),
                                  password: passwordController.text.trim(),
                                );
                          }
                        },
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      const SizedBox(height: 15),
                      // CustomfieldWidget(
                      //   hintText: tName,
                      //   controller: nameController,
                      // ),
                      // const SizedBox(height: 15),
                      // CustomfieldWidget(
                      //   hintText: tPhone,
                      //   controller: phoneController,
                      // ),
                      const SizedBox(height: 20),
                      SimpleButtonWidget(
                        text: tSignupBody,
                        onPressed: () {},
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
