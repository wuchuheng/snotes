import 'package:flutter/material.dart';
import 'package:snotes/utils/logger.dart';

class TitleSection extends StatelessWidget {
  final String title;
  final bool isActive;
  const TitleSection({Key? key, required this.title, required this.isActive}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Logger.info(message: 'Build widget TitleSection', symbol: 'build');
    return Text(
      ' $title',
      style: TextStyle(
        color: isActive ? Colors.white : Colors.black,
      ),
    );
  }
}
