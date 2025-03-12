import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:name_checker_app/core/theme/app_pallete.dart';
import 'package:name_checker_app/feature/dashboard/view/screens/about_screen.dart';
import 'package:name_checker_app/feature/dashboard/view/screens/mm_eng_screen.dart';
import 'package:name_checker_app/feature/dashboard/view/screens/pali_roman_screen.dart';
import 'package:name_checker_app/feature/dashboard/view/screens/references_screen.dart';
import 'package:name_checker_app/feature/dashboard/view/widgets/buttons/simple_button_widget.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  Map<String, String> mappingMM = {};
  Map<String, String> mappingPali = {};

  @override
  void initState() {
    super.initState();
    loadMapping();
  }

  Future<void> loadMapping() async {
    final String responseMM =
        await rootBundle.loadString('assets/mm_eng_mapping.json');
    final String responsePali =
        await rootBundle.loadString('assets/pali_roman_mapping.json');
    setState(() {
      mappingMM = Map<String, String>.from(json.decode(responseMM));
      mappingPali = Map<String, String>.from(json.decode(responsePali));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(left: 8.0, top: 40.0),
        child: Column(
          children: [
            Row(
              children: [
                Text(
                  'v2.0',
                  style: TextStyle(color: AppPallete.gradient6),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10.0, right: 10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) {
                                return AboutWidget();
                              },
                            ),
                          );
                        },
                        child: Row(
                          children: [
                            Icon(
                              Icons.info,
                              color: AppPallete.greyColor,
                            ),
                            SizedBox(width: 5),
                            Text(
                              "အကြောင်းအရာ",
                              style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 15,
                                  color: AppPallete.gradient6),
                              textAlign: TextAlign.right,
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 15),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) {
                                return ReferencesWidget();
                              },
                            ),
                          );
                        },
                        child: Row(
                          children: [
                            Icon(
                              Icons.info,
                              color: AppPallete.greyColor,
                            ),
                            SizedBox(width: 5),
                            Text(
                              "ရည်ညွှန်းချက်",
                              style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 15,
                                  color: AppPallete.gradient6),
                              textAlign: TextAlign.right,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 200),
            Text(
              "အမည်စာလုံးပေါင်းဖလှယ်ခြင်းနည်းစနစ်",
              overflow: TextOverflow.ellipsis,
              maxLines: 2,
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 25,
                  color: AppPallete.gradient6),
            ),
            SizedBox(height: 30),
            Padding(
              padding: const EdgeInsets.only(left: 20.0, right: 20.0),
              child: SimpleButtonWidget(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return MmEngScreen(mapping: mappingMM);
                      },
                    ),
                  );
                },
                text: "မြန်မာ-အင်္ဂလိပ်",
              ),
            ),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.only(left: 20.0, right: 20.0),
              child: SimpleButtonWidget(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return PaliRomanScreen(
                          mapping: mappingPali,
                        );
                      },
                    ),
                  );
                },
                text: "ပါဠိ-ရိုမန်",
              ),
            ),
          ],
        ),
      ),
    );
  }
}
