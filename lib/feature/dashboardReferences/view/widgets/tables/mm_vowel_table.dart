import 'package:flutter/material.dart';
import 'package:name_checker_app/core/theme/app_pallete.dart';
import 'package:two_dimensional_scrollables/two_dimensional_scrollables.dart';

class MmVowelTable extends StatelessWidget {
  const MmVowelTable({super.key});

  @override
  Widget build(BuildContext context) {
    final List<List<String>> data = [
      [
        "စဉ်",
        "မြန်မာသရ",
        "အသံထွက်သင်္ကေတ (မြန်-လိပ် ၂၀၁၉)",
        "အင်္ဂလိပ်အက္ခရာ ဖလှယ်နည်းစနစ် (MLLIP)",
        "အမည် သာဓက",
        "အင်္ဂလိပ်အက္ခရာ ဖလှယ်နည်း သာဓက"
      ],
      ["၁", "အ", "/a/", "a", "အချစ်", "A Chit"],
      ["၂", "အာ", "/a/", "ar", "အာကာမျိုး", "Ar Kar Myoe"],
      ["၃", "အ", "/a./", "ah", "မောင်အ", "Mg Ah"],
      ["၄", "အား", "/a:/", "arr", "ဦးဖိုးကျား", "U Phoe Kyarr"],
      [
        "၅",
        "အီ / ဤ / အည်",
        "/i/",
        "e/i",
        "ရီရီမြင့်/စည်သူဝင်း",
        "Ye Ye Myint/Sithuu Winn"
      ],
      [
        "၆",
        "အိ / ဣ / ၏ / အည့်",
        "/i./",
        "ei",
        "အိအိချွန်/ ဖူးပြည့်ခိုင်/ အိနန္ဒာကျော့",
        "Ei Ei Chun/ Phoo Pyei Khaing/ Ei Nandar Kyawt"
      ],
      ["၇", "အီး / အည်း", "/i:/", "ee", "နတ်သမီး", "Nat Tha Mee"],
      [
        "၈",
        "အူ / ဦ",
        "/u/",
        "uu",
        "သူဇာ/မူမူခိုင်",
        "Thuu Zar/ Muu Muu Khaing"
      ],
      ["၉", "အု / ဥ", "/u./", "ou/u", "ရွှေဥ/ယုယု", "Shway Ou/Yu Yu"],
      [
        "၁၀",
        "အူး / ဦး",
        "/u:/",
        "oo/U/ue",
        "ဦးမြဦး/ ဖူးဖူး/ မှူးမှူး",
        "U Mya Oo/ Phoo Phoo/ Hmue Hmue"
      ],
      ["၁၁", "အေ / ဧ", "/ei/", "ay", "ဖေမြင့်", "Phay Myint"],
      [
        "၁၂",
        "အေ့",
        "/ei./",
        "ae",
        "ချမ်းမြေ့မောင်ချို",
        "Chamm Myae Maung Cho"
      ],
      ["၁၃", "အေး", "/ei:/", "aye", "ဒေါ်အေးအေးမြင့်", "Daw Aye Aye Myint"],
      ["၁၄", "အယ်", "/e/", "el", "မိုးမြင့်ကြယ်", "Moe Myint Kyel"],
      ["၁၅", "အဲ့ / အယ့်", "/e./", "elt", "လဲ့လဲ့ဝင်း", "Lelt Lelt Winn"],
      ["၁၆", "အဲ", "/e:/", "ell", "စောခူဆဲ", "Saww Khuu Hsell"],
      [
        "၁၇",
        "အော် / ‌ဪ",
        "/o/",
        "aw",
        "ဦးပေါ်ဦး/ ကျော်ကျော်",
        "U Paw Oo/ Kyaw Kyaw"
      ],
      [
        "၁၈",
        "အော့",
        "/o./",
        "awt",
        "ပန်းတမော့/အိကျော့",
        "Pann Ta Mawt/ Ei Kyawt"
      ],
      ["၁၉", "အော / ဩ", "/o:/", "aww", "စောတောနော်", "Saww Taww Naw"],
      ["၂၀", "အို", "/ou/", "o", "ကိုပြည်", "Ko Pyi"],
      ["၂၁", "အို့", "/ou./", "oh", "မို့မို့ဇော်ဝင်း", "Moh Moh Zaw Winn"],
      [
        "၂၂",
        "အိုး",
        "/ou:/",
        "oe",
        "မောင်သာနိုး/ ပြအိုး",
        "Mg Thar Noe/ Pya Oe"
      ],
      ["၂၃", "အက်", "/e'/", "et", "ခင်ခက်ခက်ခိုင်", "Khin Khet Khet Khaing"],
      ["၂၄", "အောက်", "/au'/", "auk", "မောင်ပေါက်စီ", "Mg Pauk Se"],
      ["၂၅", "အိုက်", "/ai'/", "aik", "ဦးတိုက်စံ", "U Taik Sam"],
      ["၂၆", "အင် / အဉ်", "/in/", "in", "ထူးအိမ်သင်", "Htoo Eim Thin"],
      ["၂၇", "အင့် / အဉ့်", "/in./", "int", "မြင့်သူ", "Myint Thuu"],
      ["၂၈", "အင်း / အဉ်း", "/in:/", "inn", "ခင်ဇော်ဝင်း", "Khin Zaw Winn"],
      [
        "၂၉",
        "အောင်",
        "/aun/",
        "aung/ -g",
        "မောင်မောင်မောင်အောင်",
        "Mg Maung Maung Aung"
      ],
      [
        "၃၀",
        "အောင့်",
        "/aun./",
        "ount",
        "မြို့ထောင့်စေတီ",
        "Myoh Htount Say Te"
      ],
      ["၃၁", "အောင်း", "/aun:/", "oung", "အောင်မောင်း", "Aung Moung"],
      ["၃၂", "အိုင်", "/ain/", "aing", "ဇော်ပိုင်", "Zaw Paing"],
      ["၃၃", "အိုင့်", "/ain./", "aint", "တစ်လုံးချိုင့်", "Tit Lome Chaint"],
      [
        "၃၄",
        "အိုင်း",
        "/ain:/",
        "ai/ine",
        "စိုင်းစိုင်း/ ရှိုင်းဝေအောင်",
        "Sai Sai/Shine Way Aung"
      ],
      ["၃၅", "အစ်", "/I'/", "it", "ကစ်ကစ်", "Kit Kit"],
      [
        "၃၆",
        "အတ် / အပ်",
        "/a'/",
        "at/ap/-ao",
        "မြတ်ကျော်/ ဇလပ်ဖြူ/ စဝ်ခွန်မိန်း",
        "Myat Kyaw/ Za Lap Phyuu/ Sao Khun Meinn"
      ],
      [
        "၃၇",
        "အိတ် / အိပ်",
        "/ei'/",
        "eik/ake",
        "သိဒ္ဓိစိုး/ဆိပ်ခွန်",
        "Theikdei Soe/Hsake Khun"
      ],
      [
        "၃၈",
        "အုတ် / အုပ်",
        "/ou'/",
        "oak/oke",
        "ဦးဗုဒ်/အုပ်စိုးခန့်",
        "U Boak/Oke Soe Khant"
      ],
      [
        "၃၉",
        "အန် / အမ်/ အံ",
        "/an/",
        "an/am",
        "ရန်နိုင်/ဦးယံ",
        "Yan Naing/U Yam"
      ],
      [
        "၄၀",
        "အန့် / အမ့်/အံ့",
        "/an./",
        "ant/amt",
        "ခန့်စည်သူ/အံ့မျိုးထွဋ်",
        "Khant Sithuu/Amt Myoe Htut"
      ],
      [
        "၄၁",
        "အန်း / အမ်း",
        "/an:/",
        "ann/amm",
        "အောင်ဆန်း/စမ်းစမ်း",
        "Aung Hsann/Samm Samm"
      ],
      [
        "၄၂",
        "အိန် / အိမ်",
        "/ein/",
        "ein/ eim",
        "စိန်စိန်/ ထူးအိမ်သင်",
        "Sein Sein/ Htoo Eim Thin"
      ],
      [
        "၄၃",
        "အိန့် / အိမ့်",
        "/ein./",
        "eint/eimt",
        "အိမ့်နေခြည်/ မောင်စိမ့်",
        "Eimt Nay Chi/ Mg Seimt"
      ],
      [
        "၄၄",
        "အိန်း / အိမ်း",
        "/ein:/",
        "einn/eimm",
        "သိန်းသန်းစိုး/ စိမ်းစိမ်းဦး",
        "Theinn Thann Soe/ Seimm Seimm Oo"
      ],
      [
        "၄၅",
        "အုန် / အုမ် / အုံ",
        "/oun/",
        "ohn/ohm/ oun/oum",
        "ပြည်စုန်မင်း/ ဥမ္မာခင်/ ဆီမီးခုံ",
        "Pyi Soun Minn/Ohmmar Khin/Hsi Mee Khoum"
      ],
      [
        "၄၆",
        "အုန့် / အုမ့် / အုံ့",
        "/oun./",
        "ont/omt",
        "ပုံ့ပုံ့",
        "Pomt Pomt"
      ],
      [
        "၄၇",
        "အုန်း / အုမ်း / အုံး",
        "/oun:/",
        "own/owm/one/ome",
        "ဦးအုန်းမောင်/မောင်ဖုန်းနိုင်",
        "U Own Maung/Mg Phone Naing"
      ],
      ["၄၈", "အွတ်/အွပ်", "/u'/", "ut", "ဇော်ဝင်းထွဋ်", "Zaw Winn Htut"],
      [
        "၄၉",
        "အွန်",
        "/un/",
        "un/um/on",
        "ခွန်အောင်နိုင်/မွန်",
        "Khun Aung Naing/ Mon"
      ],
      ["၅၀", "အွန့်", "/un./", "unt/umt", "မျိုးညွန့်", "Myoe Nyunt"],
      [
        "၅၁",
        "အွန်း",
        "/un:/",
        "unn/umm",
        "ခွန်းဆင့်နေခြည်",
        "Khunn Hsint Nay Chi"
      ],

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
