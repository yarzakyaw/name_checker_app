import 'package:flutter/material.dart';
import 'package:name_checker_app/core/theme/app_pallete.dart';
import 'package:two_dimensional_scrollables/two_dimensional_scrollables.dart';

class PaliVowelCombination extends StatelessWidget {
  const PaliVowelCombination({super.key});

  @override
  Widget build(BuildContext context) {
    final List<List<String>> data = [
      [
        "က\tka",
        "ကာ\tkā",
        "ကိ\tki",
        "ကီ\tkī",
        "ကု\tku",
        "ကူ\tkū",
        "ကေ\tke",
        "ကော\tko"
      ],
      [
        "ခ\tkha",
        "ခါ\tkhā",
        "ခိ\tkhi",
        "ခီ\tkhī",
        "ခု\tkhu",
        "ခူ\tkhū",
        "ခေ\tkhe",
        "ခေါ\tkho"
      ],
    ];
    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: SizedBox(
        height: 100,
        child: TableView.builder(
          cellBuilder: (context, coordinates) {
            return TableViewCell(
              child: Container(
                decoration: BoxDecoration(
                    border: Border.all(color: AppPallete.gradient6)),
                child: Center(
                  child: Text(
                    data[coordinates.row][coordinates.column],
                    style: TextStyle(
                        fontSize: 16,
                        color: AppPallete.gradient7,
                        fontFamily: "Pyidaungsu"),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            );
          },
          columnCount: data[0].length,
          rowCount: data.length,
          columnBuilder: (index) => TableSpan(extent: FixedTableSpanExtent(90)),
          rowBuilder: (index) => TableSpan(extent: FixedTableSpanExtent(50)),
        ),
      ),
    );
  }
}
