import 'package:flutter/material.dart';
import 'package:name_checker_app/core/theme/app_pallete.dart';
import 'package:two_dimensional_scrollables/two_dimensional_scrollables.dart';

class PaliConjunctConsonant extends StatelessWidget {
  const PaliConjunctConsonant({super.key});

  @override
  Widget build(BuildContext context) {
    final List<List<String>> data = [
      ["က္က\tkka", "ဉ္စ\tñca", "ဒွ\tdva", "မ္ဗ\tmba"],
      ["က္ခ\tkkha", "ဉ္ဆ\tñcha", "ဓျ\tdhya", "မ္ဘ\tmbha"],
      ["ကျ\tkya", "ဉ္ဇ\tñja", "ဓွ\tdhva", "မ္မ\tmma"],
      ["ကြိ\tkri", "ဉ္ဈ\tñjha", "န္တ\tnta", "မျ\tmya"],
      ["က္လ\tkla", "ဋ္ဋ\tṭṭa", "န္တွ\tntva", "မှ\tmha"],
      ["ကွ\tkva", "ဋ္ဌ\tṭṭha", "န္ထ\tntha", "ယျ\tyya"],
      ["ချ\tkhya", "ဍ္ဍ\tḍḍa", "န္ဒ\tnda", "ယှ\tyha"],
      ["ခွ\tkhva", "ဍ္ဎ\tḍḍh", "န္ဒြ\tndra", "လ္လ\tlla"],
      ["ဂ္ဂ\tgga", "ဏ္ဋ\tṇṭa", "န္ဓ\tndha", "လျ\tlya"],
      ["ဂ္ဂ\tggha", "ဏ္ဌ\tṇṭha", "န္န\tnna", "လှ\tlha"],
      ["ဂျ\tgya", "ဏ္ဍ\tṇḍa", "နျ\tnya", "ဝှ\tvha"],
      ["ဂြ\tgra", "ဏ္ဏ\tṇṇa", "နှ\tnha", "သ္ထ\tsta"],
      ["င်္က\tṅka", "ဏှ\tṇha", "ပ္ပ\tppa", "သ္တြ\tstra"],
      ["င်္ခ\tṅkha", "တ္တ\ttta", "ပ္ဖ\tppha", "သ္န\tsna"],
      ["င်္ဂ\tṅga", "ထ္ထ\tttha", "ပျ\tpya", "သျ\tsya"],
      ["င်္ဃ\tṅgha", "တွ\ttva", "ဗ္ဗ\tbba", "ဿ\tssa"],
      ["စ္စ\tcca", "တျ\ttya", "ဗ္ဘ\tbbha", "သ္မ\tsma"],
      ["စ္ဆ\tccha", "တြ\ttra", "ဗ္ဘ\tbbha", "သွ\tsva"],
      ["ဇ္ဇ\tjja", "ဒ္ဒ\tdda", "ဗျ\tbya", "ဟ္မ\thma"],
      ["ဇ္ဈ\tjjha", "ဒ္ဓ\tddha", "ဗြ\tbra", "ဟွ\thva"],
      ["ည\tñña", "ဒျ\tdya", "မ္ပ\tmpa", "ဠ\tḷha"],
      ["ဥှ\tñha", "ဒြ\tdra", "မ္ဖ\tmpha", ""]
    ];
    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: SizedBox(
        height: 1100,
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
              TableSpan(extent: FixedTableSpanExtent(110)),
          rowBuilder: (index) => TableSpan(extent: FixedTableSpanExtent(50)),
        ),
      ),
    );
  }
}
