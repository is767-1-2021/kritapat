import 'dart:async';
import 'package:whatHome/model/what_to_eat_model.dart';
import 'package:whatHome/services/services.dart';

class FavoriteController {
  Services services = FirebaseServices();
  List<WhatToEatModel> data = [];

  StreamController<bool> onSyncController = StreamController();
  Stream<bool> get onSync => onSyncController.stream;


  Future<List<WhatToEatModel>> favoriteList() async {
    onSyncController.add(true);
    data = await services.filterList();
    onSyncController.add(false);
    return data;
  }

   Future<void> updatefavoriteList( List<WhatToEatModel> model) async {
    onSyncController.add(true);
    await services.updateFavoriteList(model);
    onSyncController.add(false);
  }
}
