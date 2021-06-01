class StringHelper {
  static String getInitials(String text) {
    if (text.isEmpty) return '';
    final words = text.trim().toUpperCase().split(' ');
    if (words.length == 1) {
      return words[0].substring(0, 1);
    } else {
      return '${words.first.substring(0, 1)}${words.last.substring(0, 1)}';
    }
  }

  static String getFirstWord(String text) {
    if (text.isEmpty) return '';
    final words = text.toLowerCase().trim().split(' ');
    final firstLetter = words[0].toUpperCase().substring(0, 1);
    final word = words[0].substring(1, words[0].length);
    return '$firstLetter$word';
  }

  static String getFirstAndLastWord(String text) {
    if (text.isEmpty) return '';
    final words = text.trim().split(' ');
    if (words.isEmpty) return '?';
    if (words.length == 1) return words[0];
    return '${words.first} ${words.last}';
  }

  static bool compare(String a, String b) {
    return a.toLowerCase().contains(b.toLowerCase());
  }

  static bool isNotNullOrEmpty(Object value) {
    if (!(value is String)) return false;
    if (value == 'null') return false;
    return value != '';
  }

  static Object parseNotNullOrEmpty(Object value, [String replace = '--']) {
    if (isNotNullOrEmpty(value)) return value;
    return replace;
  }
}
