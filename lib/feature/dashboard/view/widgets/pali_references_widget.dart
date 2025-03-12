import 'package:flutter/material.dart';
import 'package:name_checker_app/core/theme/app_pallete.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

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
        body: Column(
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
        ));
  }
}
