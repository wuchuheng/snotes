import 'package:revelation/service/global_service.dart';
import 'package:wuchuheng_hooks/wuchuheng_hooks.dart';
import 'package:wuchuheng_logger/wuchuheng_logger.dart';

class LogService {
  Hook<List<LoggerItem>> logHook = Hook([]);
  int maxLogLength = 0;
  int _calculationLogIndex = 0;
  int limit = 1000;
  final GlobalService _globalService;

  LogService({required GlobalService globalService}) : _globalService = globalService;

  void push(LoggerItem loggerItem) {
    logHook.setCallback((data) {
      data.add(loggerItem);
      return data;
    });
    final value = logHook.value;
    while (_calculationLogIndex != value.length) {
      final log = value[_calculationLogIndex];
      int logLength = log.type.name.length;
      logLength += log.message.length;
      logLength += log.symbol?.length ?? 0;
      logLength += log.file.length;
      if (maxLogLength < logLength) maxLogLength = logLength;
      _calculationLogIndex++;
    }
    if (value.length == limit) {
      logHook.setCallback((data) {
        data.removeAt(0);
        return data;
      });
      _calculationLogIndex--;
    }
  }
}
