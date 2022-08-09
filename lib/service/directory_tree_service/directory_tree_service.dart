import 'dart:convert';

import 'package:imap_cache/imap_cache.dart';
import 'package:snotes/model/tree_item_model/tree_item_model.dart';
import 'package:snotes/service/cache_service.dart';
import 'package:snotes/utils/hook_event/hook_event.dart';

class ActiveTreeItem {
  TreeItemModel treeItemModel;
  bool isInput;

  ActiveTreeItem({required this.treeItemModel, required this.isInput});
}

class DirectoryTreeService {
  static String key = 'path';
  static Hook<ActiveTreeItem?> activeTreeItemHook = HookEvent.builder(null);
  static Hook<List<TreeItemModel>> treeHook = HookEvent.builder([]);

  static Future<void> init() async {
    ImapCache cacheService = CacheService.getImapCache();
    if (!await cacheService.has(key: key)) {
      await cacheService.set(key: key, value: '{}');
    }
    Map<String, dynamic> jsonMapData = jsonDecode(
      await cacheService.get(key: key),
    );
    Map<String, TreeItemModel> localIdMapTreeItem = {};
    jsonMapData.forEach((key, value) {
      localIdMapTreeItem[key] = TreeItemModel.fromJson(value as Map<String, dynamic>);
    });
    final localTree = idMapTreeItemConvertToTree(localIdMapTreeItem);
    treeHook.set(localTree);
  }

  static List<TreeItemModel> idMapTreeItemConvertToTree(Map<String, TreeItemModel> pidMapTreeItem) {
    Map<int, TreeItemModel> idMapTreeItem = {};
    List<TreeItemModel> result = [];
    pidMapTreeItem.forEach(
      (key, value) {
        if (!value.isDelete) {
          idMapTreeItem[value.id] = value;
          if (value.pid == 0) {
            result.add(idMapTreeItem[value.id]!);
          } else {
            idMapTreeItem[value.pid]!.children.add(value);
          }
        }
      },
    );

    return result;
  }

  static create({
    required int pid,
    required int sortId,
    required String title,
  }) async {
    // final now = DateTime.now();
    // final int id = now.microsecondsSinceEpoch;
    // idMapTreeItem[id.toString()] = TreeItem(
    //   count: 1,
    //   children: [],
    //   isDelete: false,
    //   title: title,
    //   sortId: sortId,
    //   updatedAt: now.toString(),
    //   pid: pid,
    //   id: id,
    // );
    // final String res = json.encode(idMapTreeItem);
    // await CacheService.getImapCache().set(key: key, value: res);
    // print(res);
  }
}
