import 'package:flutter/cupertino.dart';
import 'package:whatHome/model/food_model.dart';

class BookmarkBloc extends ChangeNotifier {
  int _count = 0;
  List<FoodModel> items = [];

  void addCount() {
    _count++;
    notifyListeners();
  }

  void addFood(FoodModel data) {
    items.add(data);
    notifyListeners();
  }

  int get count {
    return _count;
  }

  List<FoodModel> get foodList {
    return items;
  }
}
