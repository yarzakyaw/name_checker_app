import 'package:flutter/material.dart';
import 'package:name_checker_app/core/theme/app_pallete.dart';
import 'package:two_dimensional_scrollables/two_dimensional_scrollables.dart';

class MmConsonantTable extends StatelessWidget {
  const MmConsonantTable({super.key});

  @override
  Widget build(BuildContext context) {
    final List<List<String>> data = [
      [
        "စဉ်",
        "မြန်မာဗျည်း",
        "အသံထွက်သင်္ကေတ (မြန်-လိပ် ၂၀၁၉)",
        "အင်္ဂလိပ်အက္ခရာ ဖလှယ်နည်းစနစ် (MLLIP)",
        "အမည် သာဓက",
        "အင်္ဂလိပ်အက္ခရာ ဖလှယ်နည်း သာဓက"
      ],
      ["၁", "က", "/k/", "ka", "ကရား", "Ka Yarr"],
      ["၂", "ခ", "/kh/", "kha", "ခရေ", "Kha Yay"],
      ["၃", "ဂ/ဃ", "/g/", "ga", "ဂမုန်းပွင့်", "Ga Mone Pwint"],
      ["၄", "င", "/ng/", "nga", "ငပလီ", "Nga Pa Le"],
      ["၅", "စ", "/s/", "sa", "စမုန်မြစ်", "Sa Moun Myit"],
      ["၆", "ဆ", "/hs/", "hsa", "ဆလတ်ရွက်", "Hsa Lat Ywet"],
      ["၇", "ဇ / ဈ", "/z/", "za", "ဇလပ်ဝါ", "Za Lap War"],
      ["၈", "ည/ဉ", "/nj/", "nya", "ဉာဏ်မှူး/မိုးည", "Nyan Hmue/Moe Nya"],
      ["၉", "ဋ / တ", "/t/", "ta", "တမာပင်", "Ta Mar Pin"],
      ["၁၀", "ဌ / ထ", "/ht/", "hta", "ထမနဲ", "Hta Ma Nell"],
      ["၁၁", "ဍ၊ဎ / ဒ၊ဓ", "/d/", "da", "ဒလ", "Dala"],
      ["၁၂", "ဏ / န", "/n/", "na", "နယုန်လ", "Nayoun La"],
      ["၁၃", "ပ", "/p/", "pa", "ပပဝတီ", "Pa Pa Wa Te"],
      ["၁၄", "ဖ", "/hp/", "pha", "ဖရုံသီး", "Pha Youm Thee"],
      ["၁၅", "ဗ / ဘ", "/b/", "ba", "ဘစိုင်းဝဏ္ဏ", "Ba Sai Wunna"],
      ["၁၆", "မ", "/m/", "ma", "မခင်ငွေ", "Ma Khin Ngway"],
      ["၁၇", "ယ", "/j/", "ya", "ယမုန်နာ", "Ya Moun Nar"],
      ["၁၈", "ရ", "/r/", "ya/ra", "ရန်အောင်/သူရ", "Yan Aung/Thuura"],
      ["၁၉", "လ / ဠ", "/l/", "la", "လမင်းအောင်", "La Minn Aung"],
      ["၂၀", "ဝ", "/w/", "wa", "ဝဥ", "Wa Ou"],
      ["၂၁", "သ", "/th/", "tha", "သမင်", "Tha Min"],
      ["၂၂", "ဟ", "/h/", "ha", "ဟဟာဟ", "Ha Har Ha"],
      ["၂၃", "ကျ / ကြ", "/kj/", "kya", "ကျပင်းဆရာဖီး", "Kya Pinn Hsayar Phee"],
      ["၂၄", "ချ / ခြ", "/ch/", "cha", "ချရားပင်", "Cha Yarr Pin"],
      ["၂၅", "ဂျ / ဂြ", "/gj/", "gya", "ဂျလေဘီမုန့်", "Gya Lay Be Mont"],
      ["၂၆", "ငှ", "/hng/", "hnga", "ငှက်ဖျား", "Hnget Phyarr"],
      ["၂၇", "ညှ", "/hnj/", "hnya", "ကြံညှပ်", "Kyam Hnyap"],
      ["၂၈", "နှ", "/hn/", "hna", "နှမ", "Hna Ma"],
      ["၂၉", "မှ", "/hm/", "hma", "မှာတမ်းလွှာ", "Hmar Tamm Hlwar"],
      [
        "၃၀",
        "ရှ",
        "/sh/",
        "sha",
        "ရှောက်ရွှာမိုး/ လျှောက်လွှာ",
        "Shauk Shwar Moe/Shauk Hlwar"
      ],
      ["၃၁", "လှ", "/hl/", "hla", "လှဝင်းမောင်", "Hla Winn Maung"],
      ["၃၂", "ဝှ", "/hw/", "hwa", "လျှို့ဝှက်စာ", "Hlyoh Hwet Sar"],
      ["၃၃", "သှ", "/dh/", "tha", "သတင်းစာ", "Tha Tinn Sar"],

      // Add more rows based on the table in the PDF
    ];
    final List<double> columnWidths = [50, 100, 150, 150, 150, 200];
    return Padding(
      padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
      child: SizedBox(
        height: 500,
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
