import 'package:flutter/material.dart';

class SummaryWidget extends StatelessWidget {
  final String text;
  const SummaryWidget({
    Key? key,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (text.isEmpty) {
      return Text(
        'No summary available.',
        style: Theme.of(context).textTheme.bodyText1,
        textAlign: TextAlign.justify,
      );
    }

    return Text(
      _removeHtmlTags(text),
      style:
          Theme.of(context).textTheme.bodyText1!.copyWith(color: Colors.white),
      textAlign: TextAlign.justify,
    );
  }

  String _removeHtmlTags(String htmlText) {
    RegExp exp = RegExp(r"<[^>]*>", multiLine: true, caseSensitive: true);

    return htmlText.replaceAll(exp, '');
  }
}
