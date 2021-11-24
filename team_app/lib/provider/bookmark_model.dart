import 'package:flutter/cupertino.dart';
import 'package:whatHome/controllers/favorite_controller.dart';
import 'package:whatHome/model/food_model.dart';
import 'package:whatHome/model/what_to_eat_model.dart';

class BookmarkBloc extends ChangeNotifier {
  int _count = 0;
  List<WhatToEatModel> items = [];
 

  

  void addCount() {
    _count++;
    notifyListeners();
  }
  void decreaseCount() {
    _count--;
    notifyListeners();
  }


  void addFood(WhatToEatModel data) {
    items.add(data);
    notifyListeners();
  }

  void removeFood(WhatToEatModel data) {
    items.remove(data);
    notifyListeners();
  }

  int get count {
    return _count;
  }
  void initCount(int count){
    _count = count;
    notifyListeners();
  }

  List<WhatToEatModel> get foodList {
    return items;
  }
}
