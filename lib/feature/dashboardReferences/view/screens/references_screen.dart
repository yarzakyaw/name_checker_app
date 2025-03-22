import 'package:flutter/material.dart';
import 'package:name_checker_app/core/widgets/buttons/simple_button_widget.dart';
import 'package:name_checker_app/feature/dashboardReferences/view/widgets/mm_references_widget.dart';
import 'package:name_checker_app/feature/dashboardReferences/view/widgets/pali_references_widget.dart';

class ReferencesWidget extends StatelessWidget {
  const ReferencesWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "ရည်ညွှန်းချက်",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ),
      body: SizedBox(
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 10),
            Padding(
                padding: const EdgeInsets.only(left: 20.0, right: 20.0),
                child: SimpleButtonWidget(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return MyanmarReferencesWidget();
                        },
                      ),
                    );
                  },
                  text: "မြန်မာအညွှန်း",
                ),
              ),
            SizedBox(height: 10),
            Padding(
                padding: const EdgeInsets.only(left: 20.0, right: 20.0),
                child: SimpleButtonWidget(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return PaliReferencesWidget();
                        },
                      ),
                    );
                  },
                  text: "ပါဠိအညွှန်း",
                ),
              ),
            
          ],
        ),
      ),
    );
  }
}
