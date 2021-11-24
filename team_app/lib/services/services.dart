import 'package:whatHome/model/shop_model.dart';
import 'package:whatHome/model/todo.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:whatHome/model/what_to_eat_model.dart';
//import 'package:http/http.dart';

abstract class Services {
  Future<List<FoodCard>> getTodos();
  Future<void> updateTodos(int idl, bool completed);
  Future<List<WhatToEatModel>> whatToEatList();
  Future<List<WhatToEatModel>> filterList();
  Future<void> updateWhatToEatList(List<WhatToEatModel> model);
  Future<void> updateFavoriteList(List<WhatToEatModel> model);
  Future<List<ShopsModel>> shopsList();
}

class FirebaseServices extends Services {
  @override
  Future<List<FoodCard>> getTodos() async {
    QuerySnapshot snapshot =
        await FirebaseFirestore.instance.collection('foods').get();

    AllFoodCard foods = AllFoodCard.fromSnapshot(snapshot);
    return foods.foods;
  }

  @override
  Future<void> updateTodos(int _id, bool completed) async {
    CollectionReference _ref =
        await FirebaseFirestore.instance.collection('todos');
    FirebaseFirestore.instance
        .collection('todos')
        .where('id', isEqualTo: _id)
        .get()
        .then((QuerySnapshot querySnapshot) {
      querySnapshot.docs.forEach((doc) {
        _ref
            .doc(doc.id)
            .update({'completed': completed})
            .then((value) => print("Todos Updated"))
            .catchError((error) => print("Failed to update Todos : $error"));
      });
    });
  }

  //ไม่ได้ใช้
  Future<String> getDocumentById(int _id) async {
    String documentId = "";
    FirebaseFirestore.instance
        .collection('foods')
        .where('foodId', isEqualTo: _id)
        .get()
        .then((QuerySnapshot querySnapshot) {
      querySnapshot.docs.forEach((doc) {
        documentId = doc.id;
        //print('doc:${documentId}');
      });
    });
    return documentId;
  }

  @override
  Future<List<WhatToEatModel>> whatToEatList() async {
    // TODO: implement whatToEatList
    QuerySnapshot data =
        await FirebaseFirestore.instance.collection('whattoeat_food').get();
    List<WhatToEatModel> model = [];
    data.docs.forEach((element) {
      WhatToEatModel food = WhatToEatModel(element.data());
      if (food.complete == true) {
        model.add(WhatToEatModel(element.data()));
      }
    });
    return model;
  }

  @override
  Future<List<WhatToEatModel>> filterList() async {
    // TODO: implement filterList
    QuerySnapshot data =
        await FirebaseFirestore.instance.collection('whattoeat_food').get();
    List<WhatToEatModel> list = [];
    data.docs.forEach((element) {
      var model = WhatToEatModel(Map<String, dynamic> ());
      model = WhatToEatModel(element.data());
      model.docId = element.id;
      list.add(model);
      // print(element.id);
    });
    return list;
  }

  @override
  Future<void> updateWhatToEatList(List<WhatToEatModel> model) async {
    // TODO: implement updatewhatToEatList
    var data = await FirebaseFirestore.instance.collection('whattoeat_food');
    model.forEach((element) { 
      data.doc(element.docId).update({'completed': element.complete});
    });
  }

  @override
  Future<void> updateFavoriteList(List<WhatToEatModel> model) async {
    // TODO: implement updateFavoriteList
     var data = await FirebaseFirestore.instance.collection('whattoeat_food');
    model.forEach((element) { 
      data.doc(element.docId).update({'favorite': element.favorite});
    });
  }

  @override
  Future<List<ShopsModel>> shopsList() async {
    // TODO: implement shopsList
    QuerySnapshot data =
        await FirebaseFirestore.instance.collection('shops').get();
    List<ShopsModel> list = [];
    data.docs.forEach((element) {
      var model = ShopsModel(Map<String, dynamic> ());
      model = ShopsModel(element.data());
      model.docId = element.id;
      list.add(model);
      // print(element.id);
    });
    return list;
  }
}

/*class HttpServices extends Services {
  Client client = Client();
  Future<List<FoodCard>> getTodos() async {
    final response = await client
        .get(Uri.parse('https://jsonplaceholder.typicode.com/todos'));
    if (response.statusCode == 200) {
      var all = AllFoodCard.fromJson(
        json.decode(response.body),
      );

      return all.foods;
    }

    throw Exception('Failed to load todos');
  }

  @override
  Future<void> updateTodos(int idl, bool completed) {
    // TODO: implement updateTodos
    throw UnimplementedError();
  }
}*/
