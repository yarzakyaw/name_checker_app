import 'package:flutter/material.dart';
import 'package:name_checker_app/feature/dashboardReferences/view/widgets/tables/mm_cluster_table.dart';
import 'package:name_checker_app/feature/dashboardReferences/view/widgets/tables/mm_consonant_table.dart';
import 'package:name_checker_app/core/widgets/listviews/notes_listview_widget.dart';
import 'package:name_checker_app/feature/dashboardReferences/view/widgets/tables/mm_vowel_table.dart';

class MyanmarReferencesWidget extends StatelessWidget {
  const MyanmarReferencesWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final List<String> consonantNotes = [
      "အသံတူဗျည်းတစ်လုံးစီယူသည့် စနစ်အရ မြန်မာဗျည်းသံ ၃၃ သံ ရှိပါသည်။",
      "\"ကျ၊ ချ၊ ဂျ၊ ငှ၊ ညှ၊ နှ၊ မှ၊ ရှ၊ လှ၊ ဝှ၊ သှ\" တို့သည် သီးခြားဗျည်းသံများဖြစ်သည့်အတွက် သီးခြား ဗျည်းများအဖြစ် သတ်မှတ်ပါသည်။",
      "\"သှ\" မှာ သံပြင်း သ သံကို ညွှန်းခြင်းဖြစ်ပြီး သ အက္ခရာအောက်က အကောက်ကလေး ထည့်ရေးသားခြင်း ဖြစ်ပါသည်။ သှ ကိုလည်း tha ဟု စာလုံးပေါင်းပါသည်။",
    ];

    final List<String> clusterConsonantNotes = [
      "အသံထွက်စနစ်အရ ယပင့် (ျ)၊ ရရစ် (ြ)၊ ဝဆွဲ (ွ) တို့ကို ဗျည်းတွဲအဖြစ် သတ်မှတ်ပါသည်။",
      "ဟထိုး (ှ) တစ်သားတည်းဖြစ်နေသည့် \"ငှ၊ ညှ၊ နှ၊ မှ၊ ရှ၊ လှ၊ ဝှ\" တို့သည် သီးခြားဗျည်းများဖြစ်၍ ဟထိုး (ှ)ကို ဗျည်းတွဲအဖြစ် မသတ်မှတ်ပါ။",
    ];

    final List<String> vowelNotes = [
      "အသံတူသရတစ်လုံးစီယူသည့် စနစ်အရ မြန်မာသရသံ ၅၁ သံ ရှိပါသည်။",
      "အသံထွက်စနစ်အရ အတ်နှင့် အွတ်၊ အန် နှင့် အွန် တို့သည် သီးခြားသရသံများ ဖြစ်ပါသည်။",
      "င-သတ်၊ ဉ-သတ် တို့ကို in ဟု စာလုံးပေါင်းပါသည်။",
      "တ-သတ် ကို t၊ ပ-သတ်ကို p / ke၊ န-သတ်ကို n၊ မ-သတ်နှင့် သေးသေးတင်ကို m တို့ဖြင့် စာလုံးပေါင်းပါသည်။",
      "အမျိုးသားနာမည် အစ စကားလုံး ဦး ကို U၊ မောင် ကို Mg ဟု စာလုံးပေါင်းပါသည်။",
      "ရ၊  ြ  တို့ကို r ဟု သတ်မှတ်ထားသော်လည်း ယ သံ ထွက်သည့် ရ၊  ြ  တို့ကို y ဖြင့် စာလုံးပေါင်းပါသည်။",
      "အများသိ မြို့အမည် ၅၃၀ ကို မူလစာလုံးပေါင်းအတိုင်း ဖော်ပြထားပါသည်။",
      "ပါဠ်အမည်များကို ပါဠိအသံထွက်အတိုင်း တစ်ဆက်တည်း စာလုံးပေါင်းပါသည်။",
      "ကျမ်းကိုး- မြန်မာသဒ္ဒါ (မြန်မာစာအဖွဲ့)၊ နှုတ်ပြောမြန်မာသဒ္ဒါ (မောင်ခင်မင်- ဓနုဖြူ)၊ မြန်မာ-အင်္ဂလိပ်အဘိဓာန် (၂၀၁၉)၊ The Pali Alphabet in Myanmar and Roman Characters (ပဋ္ဌာနပါဠိ- ပဋ္ဌမတွဲ)၊ Let's Write English Sentences (စိုးသစ်)။",
    ];
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "မြန်မာအညွှန်း",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            MmConsonantTable(),
            NotesListviewWidget(notes: consonantNotes),
            MmClusterTable(),
            NotesListviewWidget(
              notes: clusterConsonantNotes,
              height: 150,
            ),
            MmVowelTable(),
            NotesListviewWidget(
              notes: vowelNotes,
              height: 600,
            ),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
