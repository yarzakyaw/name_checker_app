import 'package:name_checker_app/core/pali_transliterator.dart';
import 'package:name_checker_app/core/utils/utils.dart';

List<String> allPrefixes = [
  "သဒ္ဓမ္မဇောတိကဓဇ",
  "သဒ္ဓမ္မဇောတိက",
  "ဗဟုဇနဟိတဓရ",
  "ဓမ္မဘဏ္ဍာဂါရိက",
  "ကမ္မဋ္ဌာနာစရိယ",
  "တိပိဋကဓရ",
  "ဓမ္မကထိက",
  "ဂန္ထဝါစက",
  "ဒေါက်တာ",
  "ဒောက်တာ",
  "ဆရာလေး",
  "ဆရာတော်",
  "ပဏ္ဍိတ",
  "အဘိဓဇ",
  "ဘဒ္ဒန္တ",
  "အဂ္ဂ",
  "အူး",
  "ဒေါ်",
  "မဟာ",
  "ရှင်မဟာ",
  "ရှင်",
  "အရှင်",
  "အသျှင်",
  "မ",
];

String preprocess(String text) {
  return text
      .replaceAll("ဿ", "သ္သ")
      .replaceAll("ည", "ဉ္ဉ")
      .replaceAll("\u1026\u1038", "အူး")
      .replaceAll("ဥူး", "အူး")
      .replaceAll("\u1026", "အူ")
      .replaceAll("ဥူ", "အူ")
      .replaceAll("ဥုံ", "အုံ")
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
          String top = match.group(1)!;
          return top;
        });
      }
    }
  }
  return text;
}

String getPaliMapping(String label) {
  // Step 3: Transliterate into Romanized Pali
  PaliTransliterator transliterator = PaliTransliterator();
  String romanized = transliterator.transliterate(label);
  return romanized;
}

String getPrefixSpilittedMap(String text, Map<String, String> wordDict) {
  String mappedPrefix;

  if (wordDict.containsKey(text) && wordDict[text] != "") {
    mappedPrefix = wordDict[text]!.capitalize();
  } else {
    // Step 2: Flatten the stacked characters
    String flattenedText = flattenStack(text);
    List<String> syllableList = syllableSplit(flattenedText);

    mappedPrefix = syllableList
        .asMap()
        .entries
        .map((entry) => getPaliMapping(entry.value))
        .join('');
  }
  return mappedPrefix.capitalize();
}

String getMap(String text, Map<String, String> wordDict) {
  String mappedWord;
  List<String> prefixSpilttedString = [];
  String remaining = text;
  int index = 0;

  while (index < text.length) {
    String prefix = splitPrefixName(remaining, allPrefixes);
    prefixSpilttedString.add(prefix);
    remaining = remaining.substring(prefix.length);
    index += prefix.length;
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
