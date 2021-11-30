import 'package:cloud_firestore/cloud_firestore.dart';

class HistoryModel {
  final String equation;
  final String result;

  HistoryModel(this.equation, this.result);

  factory HistoryModel.fromJson(
    Map<String, dynamic> json,
  ) {
    return HistoryModel(
      json['equation'] as String,
      json['result'] as String,
    );
  }
  factory HistoryModel.fromDs(
    Map<String, Object?> json,
  ) {
    return HistoryModel(
      json['equation'] as String,
      json['result'] as String,
    );
  }
}

class AllHistory {
  final List<HistoryModel> history;
  AllHistory(this.history);

  factory AllHistory.fromJson(List<dynamic> json) {
    List<HistoryModel> history;

    history = json.map((index) => HistoryModel.fromJson(index)).toList();
    return AllHistory(history);
  }

  factory AllHistory.fromsnapshot(QuerySnapshot s) {
    List<HistoryModel> history = s.docs.map((DocumentSnapshot ds) {
      return HistoryModel.fromJson(ds.data() as Map<String, dynamic>);
    }).toList();
    return AllHistory(history);
  }
}
