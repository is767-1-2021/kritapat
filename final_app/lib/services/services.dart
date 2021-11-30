import 'package:final_app/model/history.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

abstract class Services {
  Future<List<HistoryModel>> getHistory();
  //Future<List<HistoryModel>> historyList();
}

class FirebaseServices extends Services {
  @override
  Future<List<HistoryModel>> getHistory() async {
    QuerySnapshot snapshot =
        await FirebaseFirestore.instance.collection('history').get();

    AllHistory history = AllHistory.fromsnapshot(snapshot);
    return history.history;
  }
}
