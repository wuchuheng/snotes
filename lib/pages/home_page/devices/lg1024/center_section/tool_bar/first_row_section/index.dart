import 'package:flutter/cupertino.dart';
import 'package:snotes/utils/logger.dart';

class FirstRowSection extends StatefulWidget {
  const FirstRowSection({Key? key}) : super(key: key);

  @override
  State<FirstRowSection> createState() => _FirstRowSectionState();
}

class _FirstRowSectionState extends State<FirstRowSection> {
  @override
  Widget build(BuildContext context) {
    Logger.info(message: 'Build widget FirstRowSection', symbol: 'build');
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: const [
        Text('1'),
        Text('2'),
        Text('3'),
      ],
    );
  }
}
