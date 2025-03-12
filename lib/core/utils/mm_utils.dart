import 'package:flutter/material.dart';
import 'package:name_checker_app/core/mm_transcriptor.dart';
import 'package:name_checker_app/core/utils/utils.dart';

/* Future<List<String>> loadJsonList() async {
  String jsonString = await rootBundle.loadString('assets/mm_prefix_list.json');
  List<dynamic> jsonList = jsonDecode(jsonString);
  return List<String>.from(jsonList);
} */

final List<String> allPrefixes = [
  "ဆရာတော်",
  "ဆရာမ",
  "ဆရာ",
  "သုဓမ္မ",
  "အဂ္ဂ",
  "မဟာ",
  "ဇောတိကဓဇ",
  "သဒ္ဓမ္မဇောတိကဓဇ",
  "မဏိဇောတဓရ",
  "သတိုး",
  "သရေ",
  "စည်သူ",
  "သီဟသူရ",
  "သူရ",
  "သီရိပျံချီ",
  "သီရိ",
  "ဇေယျကျော်ထင်",
  "အလင်္ကာကျော်စွာ",
  "သိပ္ပကျော်စွာ",
  "ပြည်ထောင်စု",
  "တံခွန်",
  "ဇာနည်",
  "လမ်းစဉ်ဇာနည်",
  "ပညာဗလ",
  "တပ်သားသစ်",
  "တပ်သား",
  "ဒုတိယတပ်ကြပ်",
  "ဒုတပ်ကြပ်",
  "တပ်ကြပ်ကြီးစာရေး",
  "တပ်ကြပ်ကြီး",
  "တပ်ကြပ်",
  "အုပ်ခွဲတပ်ကြပ်ကြီး",
  "တပ်ခွဲတပ်ကြပ်ကြီး",
  "ဒုတိယအရာခံဗိုလ်",
  "ဒုအရာခံဗိုလ်",
  "အရာခံဗိုလ်",
  "ဒုတိယဗိုလ်",
  "ဒုဗိုလ်",
  "ဗိုလ်ကြီး",
  "ဗိုလ်မှူး",
  "ဒုတိယဗိုလ်မှူးကြီး",
  "ဒုဗိုလ်မှူးကြီး",
  "ဗိုလ်မှူးကြီး",
  "ဗိုလ်မှူးချုပ်",
  "ဗိုလ်ချုပ်",
  "ဒုဗိုလ်ချုပ်ကြီး",
  "ဒုတိယဗိုလ်ချုပ်ကြီး",
  "ဗိုလ်ချုပ်ကြီး",
  "ဒုတိယဗိုလ်ချုပ်မှူးကြီး",
  "ဗိုလ်ချုပ်မှူးကြီး",
  "ဒေါ်",
];

String preprocess(String text) {
  // return text.replaceAll("ဿ", "သ္သ").replaceAll("ည", "ဉ္ဉ");
  return text
      .replaceAll("ဿ", "သ္သ")
      .replaceAll("\u1026\u1038", "အူး")
      .replaceAll("ဥူး", "အူး")
      .replaceAll("\u1026", "အူ")
      .replaceAll("ဥူ", "အူ")
      .replaceAll("ဥု", "အူ")
      .replaceAll("ဥ", "အု")
      .replaceAll("န်ုပ်", "န်နုပ်")
      .replaceAll("ဪ", "အော်")
      .replaceAll("ဩ", "အော")
      .replaceAll("ဤ", "အီ")
      .replaceAll("၏", "အိ")
      .replaceAll("ဧ", "အေ")
      .replaceAll("ဣိ", "အိ")
      .replaceAll("ဣီ", "အီ")
      .replaceAll("ဣူ", "အူ")
      .replaceAll("ဣု", "အု")
      .replaceAll("ဣ", "အိ")
      .replaceAll("၍", "ရွေ့")
      .replaceAll("၎င်း", "လည်းကောင်း")
      .replaceAll("၌", "နှိုက်")
      .replaceAll("ွှံ့", "ွှန့်")
      .replaceAll("ွံ့", "ွန့်")
      .replaceAll("ျွှံ့", "ျွှန့်")
      .replaceAll("ြွှံ့", "ြွှန့်")
      .replaceAll(RegExp(r'[\u200B\u200C]'), '');
}

String flattenStack(String text) {
  final List<RegExp> stackPatterns = [
    RegExp(r"([\u1000-\u1020])\u1039", unicode: true),
    RegExp(r"([\u1000-\u1020\u1004\u103A])\u1039", unicode: true),
  ];

  for (int index = 0; index < stackPatterns.length; index++) {
    RegExp pattern = stackPatterns[index];
    while (pattern.hasMatch(text)) {
      if (index == 0) {
        text = text.replaceAllMapped(pattern, (match) {
          // Convert to consonant + Virama (်)
          String top = '${match.group(1)!}\u103A';
          return top;
        });
      } else {
        text = text.replaceAllMapped(pattern, (match) {
          // Flatten stack: convert to consonant + Virama (်)
          String top = '${match.group(1)!}\u1038';
          return top;
        });
      }
    }
  }
  return text;
}

String getMMMapping(String label) {
  String myanGlish;
  MmTranscriptor transcriptor = MmTranscriptor();
  myanGlish = transcriptor.transcript(label);
  return myanGlish;
}

String getIntermediateMap(
    String mergedLabel, Map<String, String> wordDict, int index) {
  String mappedWord;
  if (mergedLabel == "အူး" && index == 0) {
    mappedWord = "u";
  } else if ((mergedLabel == "မောင်") && index == 0) {
    mappedWord = "mg";
  } else if (mergedLabel == "ဗိုလ်ကြီး" && index == 0) {
    mappedWord = "captain";
  } else if (mergedLabel == "ဗိုလ်" && index == 0) {
    mappedWord = "lieutenant";
  } else if (wordDict.containsKey(mergedLabel) && wordDict[mergedLabel] != "") {
    mappedWord = wordDict[mergedLabel]!.capitalize();
  } else {
    String flattenedText = flattenStack(mergedLabel);
    List<String> finalSyllableList = syllableSplit(flattenedText);
    mappedWord = finalSyllableList
        .asMap()
        .entries
        .map((entry) => getMMMapping(entry.value))
        .join('');
  }
  return mappedWord.capitalize();
}

String getPrefixSpilittedMap(String text, Map<String, String> wordDict) {
  String mappedWord;

  if (wordDict.containsKey(text) && wordDict[text] != "") {
    mappedWord = wordDict[text]!.capitalize();
  } else if (wordDict.containsKey(text) && wordDict[text] == "") {
    // Step 2: Flatten the stacked characters
    String flattenedText = flattenStack(text);

    List<String> syllableList = syllableSplit(flattenedText);
    mappedWord = syllableList
        .asMap()
        .entries
        .map((entry) => getMMMapping(entry.value))
        .join('');
  } else {
    List<String> syllableList = syllableSplit(text);
    List<String> mergeList = mergeConsecutive(syllableList, wordDict);
    debugPrint('mergeList: $mergeList');
    mappedWord = mergeList
        .asMap()
        .entries
        .map((entry) => getIntermediateMap(entry.value, wordDict, entry.key))
        .join(' ');
  }

  return mappedWord.capitalize();
}

String getMap(String text, Map<String, String> wordDict) {
  String mappedWord;
  List<String> prefixSpilttedString = [];

  String remaining = text;

  int index = 0;
  while (index < text.length) {
    String splittedText = splitPrefixName(remaining, allPrefixes);
    prefixSpilttedString.add(splittedText);
    remaining = remaining.substring(splittedText.length);
    index += splittedText.length;
  }

  mappedWord = prefixSpilttedString
      .asMap()
      .entries
      .map((entry) => getPrefixSpilittedMap(entry.value, wordDict))
      .join(' ');

  return mappedWord;
}

extension StringExtension on String {
  String capitalize() {
    return isEmpty ? this : this[0].toUpperCase() + substring(1);
  }
}
