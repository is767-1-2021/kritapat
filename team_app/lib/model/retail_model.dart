class Model {
  String question;
  String answer;
  bool isExpand;
  double hight;

  Model({this.question, this.answer, this.isExpand, this.hight});
}

class FoodListModel {
  String name;
  String image;
  String image2;
  String location;
  List<MenuModel> menu;

  FoodListModel({this.name, this.image, this.location, this.menu, this.image2});
}

class MenuModel {
  String name;
  double price;
  MenuModel({this.name, this.price});
}
