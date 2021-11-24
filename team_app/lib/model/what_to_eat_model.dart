class WhatToEatModel {
  bool complete;
  int foodId;
  String foodName;
  String imageUrl;
  String foodInfo;
  String docId;
  bool favorite;
  bool isLiked = false;
  bool isSwipedOff = false;

  WhatToEatModel(Map<String, dynamic> json) {
    complete = json['completed'];
    foodId = json['foodId'];
    foodName = json['foodName'];
    imageUrl = json['imageURL'];
    foodInfo = json['foodInfo'];
    favorite = json['favorite'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['completed'] = this.complete;
    data['foodId'] = this.foodId;
    data['foodName'] = this.foodName;
    data['imageURL'] = this.imageUrl;
    data['foodInfo'] = this.foodInfo;
    data['favorite'] = this.favorite;
    return data;
  }
}
