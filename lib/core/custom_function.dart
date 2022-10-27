import 'package:html/parser.dart';

class CustomFunction {
  static String removeTag({htmlString}) {
    var document = parse(htmlString);
    String parsedString = parse(document.body!.text).documentElement!.text;
    return parsedString.toString();
  }
}
