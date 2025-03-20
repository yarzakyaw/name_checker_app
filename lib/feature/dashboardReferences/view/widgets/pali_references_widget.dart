import 'package:flutter/material.dart';
import 'package:name_checker_app/core/theme/app_pallete.dart';
import 'package:name_checker_app/feature/dashboardReferences/view/widgets/tables/pali_conjunct_consonant.dart';
import 'package:name_checker_app/feature/dashboardReferences/view/widgets/tables/pali_consonant_vowel_a.dart';
import 'package:name_checker_app/feature/dashboardReferences/view/widgets/tables/pali_consonant_vowel_a_extended.dart';
import 'package:name_checker_app/feature/dashboardReferences/view/widgets/tables/pali_extra.dart';
import 'package:name_checker_app/feature/dashboardReferences/view/widgets/tables/pali_number.dart';
import 'package:name_checker_app/feature/dashboardReferences/view/widgets/tables/pali_vowel_combination.dart';
import 'package:name_checker_app/feature/dashboardReferences/view/widgets/tables/pali_vowel_table.dart';

class PaliReferencesWidget extends StatelessWidget {
  const PaliReferencesWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "ပါဠိအညွှန်း",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 10),
            Text(
              "VOWELS",
              style: TextStyle(
                  fontSize: 16,
                  fontFamily: "Pyidaungsu",
                  color: AppPallete.gradient7),
              textAlign: TextAlign.justify,
            ),
            PaliVowelTable(),
            SizedBox(height: 10),
            Text(
              "CONSONANTS WITH VOWEL 'A'",
              style: TextStyle(
                  fontSize: 16,
                  fontFamily: "Pyidaungsu",
                  color: AppPallete.gradient7),
              textAlign: TextAlign.justify,
            ),
            PaliConsonantVowelA(),
            PaliConsonantVowelAExtended(),
            SizedBox(height: 10),
            Text(
              "VOWELS IN COMBINATION",
              style: TextStyle(
                  fontSize: 16,
                  fontFamily: "Pyidaungsu",
                  color: AppPallete.gradient7),
              textAlign: TextAlign.justify,
            ),
            PaliVowelCombination(),
            SizedBox(height: 10),
            Text(
              "CONJUNCT-CONSONANTS",
              style: TextStyle(
                  fontSize: 16,
                  fontFamily: "Pyidaungsu",
                  color: AppPallete.gradient7),
              textAlign: TextAlign.justify,
            ),
            PaliConjunctConsonant(),
            PaliExtra(),
            PaliNumber(),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "ကျမ်းကိုး- The Pali Alphabet in Myanmar and Roman Characters (ပဋ္ဌာနပါဠိ- ပဋ္ဌမတွဲ)။",
                style: TextStyle(
                    fontSize: 16,
                    fontFamily: "Pyidaungsu",
                    color: AppPallete.gradient7),
                textAlign: TextAlign.justify,
              ),
            ),
            SizedBox(height: 20),
          ],
        ),
      ),
      /* body: Column(
        children: [
          Expanded(child: SfPdfViewer.asset("assets/Pali.pdf")),
          SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "ကျမ်းကိုး- The Pali Alphabet in Myanmar and Roman Characters (ပဋ္ဌာနပါဠိ- ပဋ္ဌမတွဲ)။",
              style: TextStyle(
                  fontSize: 16,
                  fontFamily: "Pyidaungsu",
                  color: AppPallete.gradient7),
              textAlign: TextAlign.justify,
            ),
          ),
          SizedBox(height: 20),
        ],
      ), */
    );
  }
}
