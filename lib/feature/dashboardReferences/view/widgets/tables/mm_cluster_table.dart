import 'package:flutter/material.dart';
import 'package:name_checker_app/core/theme/app_pallete.dart';
import 'package:two_dimensional_scrollables/two_dimensional_scrollables.dart';

class MmClusterTable extends StatelessWidget {
  const MmClusterTable({super.key});

  @override
  Widget build(BuildContext context) {
    final List<List<String>> data = [
      [
        "စဉ်",
        "မြန်မာဗျည်းတွဲ",
        "အသံထွက်သင်္ကေတ (မြန်-လိပ် ၂၀၁၉)",
        "အင်္ဂလိပ်အက္ခရာ ဖလှယ်နည်းစနစ် (MLLIP)",
        "အမည် သာဓက",
        "အင်္ဂလိပ်အက္ခရာ ဖလှယ်နည်း သာဓက"
      ],
      ["၁", "ျ", "/j/", "y", "ယပင့်", "Ya Pint"],
      ["၂", "ြ", "/j/", "r/y", "ဗြာဟ္မီအက္ခရာ/ယယစ်", "Branme Etkharar/Ya Yit"],
      ["၃", "ွ", "/w/", "w", "ဝဆွဲ", "Wa Hswell"],

      // Add more rows based on the table in the PDF
    ];
    final List<double> columnWidths = [50, 100, 150, 150, 150, 200];
    return Padding(
      padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
      child: SizedBox(
        height: 230,
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
          columnBuilder: (index) =>
              TableSpan(extent: FixedTableSpanExtent(columnWidths[index])),
          rowBuilder: (index) =>
              TableSpan(extent: FixedTableSpanExtent(index == 0 ? 80 : 50)),
        ),
      ),
    );
  }
}
