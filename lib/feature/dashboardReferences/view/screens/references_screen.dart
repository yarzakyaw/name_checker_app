import 'package:flutter/material.dart';
import 'package:name_checker_app/core/theme/app_pallete.dart';
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
      body: Column(
        children: [
          SizedBox(height: 10),
          Center(
            child: SizedBox(
              width: MediaQuery.of(context).size.width * 0.9,
              height: 60,
              child: ElevatedButton(
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
                child: Text(
                  "မြန်မာအညွှန်း",
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: AppPallete.gradient7,
                  ),
                ),
              ),
            ),
          ),
          SizedBox(height: 10),
          Center(
            child: SizedBox(
              width: MediaQuery.of(context).size.width * 0.9,
              height: 60,
              child: ElevatedButton(
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
                child: Text(
                  "ပါဠိအညွှန်း",
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: AppPallete.gradient7,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
