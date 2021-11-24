import 'dart:async';
import 'package:whatHome/model/what_to_eat_model.dart';
import 'package:whatHome/services/services.dart';

class FilterController {
  Services services = FirebaseServices();
  List<WhatToEatModel> data = [];

  StreamController<bool> onSyncController = StreamController();
  Stream<bool> get onSync => onSyncController.stream;

  Future<List<WhatToEatModel>> fecthfilterList() async {
    onSyncController.add(true);
    data = await services.filterList();
    onSyncController.add(false);
    return data;
  }

  Future<void> updateFoodList( List<WhatToEatModel> model) async {
    onSyncController.add(true);
    await services.updateWhatToEatList(model);
    onSyncController.add(false);
  }

}