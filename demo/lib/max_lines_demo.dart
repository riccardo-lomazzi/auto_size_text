import 'package:flutter_auto_size_text/flutter_auto_size_text.dart';
import 'package:demo/animated_input.dart';
import 'package:demo/text_card.dart';
import 'package:demo/utils.dart';
import 'package:flutter/material.dart';

class MaxlinesDemo extends StatelessWidget {
  final bool richText;

  const MaxlinesDemo(this.richText, {super.key});

  @override
  Widget build(BuildContext context) {
    return AnimatedInput(
      text: 'This String will be automatically resized to fit on two lines.',
      builder: (input) {
        return Row(
          children: <Widget>[
            Expanded(
              child: TextCard(
                title: 'Text',
                child:
                    !richText
                        ? Text(input, style: const TextStyle(fontSize: 30))
                        : Text.rich(
                          spanFromString(input),
                          style: const TextStyle(fontSize: 30),
                        ),
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: TextCard(
                title: 'AutoSizeText',
                child:
                    !richText
                        ? AutoSizeText(
                          input,
                          style: const TextStyle(fontSize: 30),
                          maxLines: 2,
                        )
                        : AutoSizeText.rich(
                          spanFromString(input),
                          style: const TextStyle(fontSize: 30),
                          maxLines: 2,
                        ),
              ),
            ),
          ],
        );
      },
    );
  }
}
