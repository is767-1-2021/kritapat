import 'dart:async';
import 'package:final_app/model/history.dart';
import 'package:final_app/services/services.dart';

class HistoryController {
  final Services service;
  List<HistoryModel> history = List.empty();

  StreamController<bool> onSyncController = StreamController();
  Stream<bool> get onSync => onSyncController.stream;

  HistoryController(this.service);

  Future<List<HistoryModel>> fetchHistory() async {
    onSyncController.add(true);
    history = await service.getHistory();
    onSyncController.add(false);
    return history;
  }
}
