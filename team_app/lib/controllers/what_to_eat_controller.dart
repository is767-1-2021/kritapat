import 'dart:async';
import 'package:whatHome/model/what_to_eat_model.dart';
import 'package:whatHome/services/services.dart';

class WhatToEatController {
  final Services services = FirebaseServices();
  List<WhatToEatModel> data = [];

  StreamController<bool> onSyncController = StreamController();
  Stream<bool> get onSync => onSyncController.stream;

  Future<List<WhatToEatModel>> fecthWhatToEatList() async {
    onSyncController.add(true);
    data = await services.whatToEatList();
    onSyncController.add(false);
    return data;
  }
}