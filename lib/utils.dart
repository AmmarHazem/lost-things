
String truncateText(String text, [int length = 70]) {
  if (text.length <= length) {
    return text;
  }
  return text.substring(0, length) + '...';
}
