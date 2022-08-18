import 'package:flutter/material.dart';
import 'package:snotes/utils/logger.dart';

import '../../../../../../../config/config.dart';

class CountSection extends StatelessWidget {
  final int count;
  final bool isActive;
  const CountSection({Key? key, required this.count, required this.isActive}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Logger.info(message: 'Build widget CountSection', symbol: 'build');
    return Text(
      '$count',
      style: TextStyle(
        color: isActive ? Colors.white : Config.textGrey,
      ),
    );
  }
}
