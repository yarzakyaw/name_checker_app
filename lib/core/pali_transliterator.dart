class PaliTransliterator {
  final Map<String, String> singleton = {
    "က": "k",
    "ခ": "kh",
    "ဂ": "g",
    "ဃ": "gh",
    "င": "\u1e45",
    "စ": "c",
    "ဆ": "ch",
    "ဇ": "j",
    "ဈ": "jh",
    "ဉ": "\u00f1",
    "ဋ": "\u1e6d",
    "ဌ": "\u1e6dh",
    "ဍ": "\u1e0d",
    "ဎ": "\u1e0dh",
    "ဏ": "\u1e47",
    "တ": "t",
    "ထ": "th",
    "ဒ": "d",
    "ဓ": "dh",
    "န": "n",
    "ပ": "p",
    "ဖ": "ph",
    "ဗ": "b",
    "ဘ": "bh",
    "မ": "m",
    "ယ": "y",
    "ရ": "r",
    "လ": "l",
    "ဝ": "v",
    "သ": "s",
    "ဟ": "h",
    "ဠ": "\u1e37",
    "အ": "",
  };

  final Map<String, String> vowelForm = {
    "ာ": "ā",
    "ါ": "ā",
    "ိ": "i",
    "ီ": "ī",
    "ု": "u",
    "ူ": "ū",
    "ေ": "e",
    "ံ": "aṁ",
    "ှ": "h"
  };

  final Map<String, String> specialCharsForm = {
    "အ": "a",
    "၁": "1",
    "၂": "2",
    "၃": "3",
    "၄": "4",
    "၅": "5",
    "၆": "6",
    "၇": "7",
    "၈": "8",
    "၉": "9",
    "၀": "0",
    "၊": ",",
    "။": ".",
  };

  final Map<String, String> asatForm = {"်": "a"};

  final Map<String, String> extendedForm = {
    "ာ့": "a",
    "ါ့": "a",
    "ား": "āā",
    "ါး": "āā",
    "ံ့": "ṃ",
    "ုံ": "uṃ", // ုံ
    "ော": "o",
    "ေါ": "o",
    "ီး": "īī",
    "ု": "u",
    "ူ": "ū",
    "ူး": "u",
    "ိုး": "oee",
    "ို": "oe",
    "ှာ": "ā",
    "ှါ": "ā"
  };

  final Map<String, String> clusterForm = {"ျ": "y", "ြ": "r", "ွ": "v"};

  String transliterate(String text) {
    List<String> output = [];
    int i = 0;

    while (i < text.length) {
      String char = text[i];
      String next = (i + 1 < text.length) ? text[i + 1] : "";
      String afterNext = (i + 2 < text.length) ? text[i + 2] : "";
      String thirdNext = (i + 3 < text.length) ? text[i + 3] : "";
      String theRest = text.substring(1);

      // Rule 5.1: Singleton + Singleton + Asat (Fix Order)
      if (singleton.containsKey(char) &&
          singleton.containsKey(next) &&
          asatForm.containsKey(afterNext)) {
        output.add("${singleton[char]!}a${singleton[next]!}");
        i += 2;
        // debugPrint('rule 5.1: Singleton + Singleton + Asat (Fix Order)');
      }

      // Rule 5.0: Singleton + Cluster + Singleton + Asat
      else if (singleton.containsKey(char) &&
          clusterForm.containsKey(next) &&
          singleton.containsKey(afterNext) &&
          asatForm.containsKey(text[i + 3])) {
        output.add(
            "${singleton[char]!}${clusterForm[next]!}a${singleton[afterNext]!}");
        i += 3;
        // debugPrint('rule 5.0: Singleton + Cluster + Singleton + Asat');
      }

      // Rule 4.2:. Singleton + Extended + Singleton + Asat (Remove Asat in Output)
      else if (singleton.containsKey(char) &&
          vowelForm.containsKey(next) &&
          singleton.containsKey(thirdNext) &&
          asatForm.containsKey(text[i + 4])) {
        String extendedTwo = text.substring(1, 3);
        // debugPrint('ExtendedTwo: $extendedTwo');
        output.add(singleton[char]! +
            extendedForm[extendedTwo]! +
            singleton[thirdNext]!);
        i += 4; // Skip asat
        // debugPrint('rule 4.2: Singleton + Extended + Singleton + Asat');
      }

      // Rule 4.1: Singleton + Vowel + Singleton + Asat (Remove Asat in Output)
      else if (singleton.containsKey(char) &&
          vowelForm.containsKey(next) &&
          singleton.containsKey(afterNext) &&
          asatForm.containsKey(text[i + 3])) {
        output.add(singleton[char]! + vowelForm[next]! + singleton[afterNext]!);
        i += 3; // Skip asat
        // debugPrint('rule 4.1: Asat Singleton + Vowel + Singleton + Asat');
      }

      // Rule 4.0: Asat Form
      else if (asatForm.containsKey(char)) {
        if (output.isNotEmpty) {
          output[output.length - 1] += asatForm[char]!;
        }
        // debugPrint('rule 4.0: Asat Form');
      }

      // Rule 3.0: Singleton + Extended Forms
      else if (singleton.containsKey(char) &&
          extendedForm.containsKey(theRest)) {
        output.add(singleton[char]! + extendedForm[theRest]!);
        i += 3;
        // debugPrint('rule 3.0: Singleton + Extended Forms');
      }

      // Rule 2.1: Singleton + Cluster + Vowel
      else if (singleton.containsKey(char) &&
          clusterForm.containsKey(next) &&
          vowelForm.containsKey(afterNext)) {
        output
            .add(singleton[char]! + clusterForm[next]! + vowelForm[afterNext]!);
        i += 2;
        // debugPrint('rule 2.1: Singleton + Cluster + Vowel');
      }

      // Rule 2.0: Singleton + Cluster
      else if (singleton.containsKey(char) && clusterForm.containsKey(next)) {
        output.add(singleton[char]! + clusterForm[next]!);
        i++;
        // debugPrint('rule 2.0: Singleton + Cluster');
      }

      // Rule 1.1: Singleton အ / ဧ + Vowel
      else if (singleton.containsKey(char) &&
          specialCharsForm.containsKey(char)) {
        if (vowelForm.containsKey(next)) {
          if (next == 'ှ') {
            output.add('${singleton[char]!}${vowelForm[next]!}a');
          } else {
            output.add(vowelForm[next]!);
          }
          i++;
        } else {
          output.add(specialCharsForm[char]!);
        }
        // debugPrint('rule 1.1: Singleton အ / ဧ + Vowel');
      }

      // Rule 1.0: Singleton + Vowel (base)
      else if (singleton.containsKey(char)) {
        if (vowelForm.containsKey(next)) {
          if (next == 'ှ') {
            output.add('${singleton[char]!}${vowelForm[next]!}a');
          } else {
            output.add(singleton[char]! + vowelForm[next]!);
          }
          i++;
        } else {
          output.add("${singleton[char]!}a");
        }
        // debugPrint('rule 1.0: Singleton + Vowel (base)');
      }

      // Rule 0.1: Special Character Form
      else if (specialCharsForm.containsKey(char)) {
        output.add(specialCharsForm[char]!);
        // debugPrint('rule 0.1: Special Character Form');
      }

      // Rule 0.0: Default - just append
      else {
        output.add(char);
        // debugPrint('rule 0.0: Default');
      }
      i++;
    }

    return output.join("");
  }
}
