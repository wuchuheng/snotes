import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:snotes/utils/logger.dart';

import '../../../../../../../common/iconfont.dart';

class FolderIconSection extends StatelessWidget {
  final bool isActive;
  const FolderIconSection({Key? key, required this.isActive}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Logger.info(message: 'Build widget FolderIconSection', symbol: 'build');
    return Icon(
      IconFont.icon_file_directory,
      size: 17.5,
      color: isActive ? Colors.white : Colors.black,
    );
  }
}
