import 'dart:async';
import 'package:whatHome/model/shop_model.dart';
import 'package:whatHome/model/what_to_eat_model.dart';
import 'package:whatHome/services/services.dart';

class ShopsController {
  Services services = FirebaseServices();
  List<ShopsModel> data = [];

  StreamController<bool> onSyncController = StreamController();
  Stream<bool> get onSync => onSyncController.stream;

  Future<List<ShopsModel>> fecthShopsList() async {
    onSyncController.add(true);
    data = await services.shopsList();
    onSyncController.add(false);
    return data;
  }
}