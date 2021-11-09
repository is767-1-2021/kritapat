import 'package:cloud_firestore/cloud_firestore.dart';

class FoodCard {
  final int foodId;
  final String foodName;
  bool completed;

  FoodCard(this.foodId, this.foodName, this.completed);

  factory FoodCard.fromJson(
    Map<String, dynamic> json,
  ) {
    return FoodCard(
      json['foodId'] as int,
      json['foodName'] as String,
      json['completed'] as bool,
    );
  }
  factory FoodCard.fromDs(
    Map<String, Object> json,
  ) {
    return FoodCard(
      json['foodId'] as int,
      json['foodName'] as String,
      json['completed'] as bool,
    );
  }
}

class AllFoodCard {
  final List<FoodCard> foods;
  AllFoodCard(this.foods);

  factory AllFoodCard.fromJson(List<dynamic> json) {
    List<FoodCard> foods;

    foods = json.map((index) => FoodCard.fromJson(index)).toList();

    return AllFoodCard(foods);
  }

  factory AllFoodCard.fromSnapshot(QuerySnapshot s) {
    List<FoodCard> todos = s.docs.map((DocumentSnapshot ds) {
      return FoodCard.fromDs(ds.data() as Map<String, dynamic>);
    }).toList();
    return AllFoodCard(todos);
  }
}
