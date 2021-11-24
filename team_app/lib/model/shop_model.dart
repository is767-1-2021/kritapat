class ShopsModel {
  String shopName;
  String image;
  int id;
  String location;
  String docId;
  List<MenuShopModel> menu;

  ShopsModel(Map<String, dynamic> json) {
    shopName = json['shopName'];
    image = json['image'];
    id = json['id'];
    location = json['location'];
    if(json['menu'] != null){
      menu = [];
      json['menu'].forEach((v){
        menu.add(MenuShopModel(v));
      });
    }
    
  }
}

class MenuShopModel {
  String name;
  int price;
  MenuShopModel(Map<String, dynamic> json){
    name = json['name'];
    price = json['price'];
  }
}
