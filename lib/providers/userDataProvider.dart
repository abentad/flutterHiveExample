import 'package:flutter/cupertino.dart';
import 'package:flutterHiveExample/models/userDataModel.dart';
import 'package:hive/hive.dart';

class UserDataProvider with ChangeNotifier {
  UserDataModel _userData;
  //hive variable for the box
  final userDataBox = Hive.box("userData");

  //getter
  UserDataModel get userData => _userData;

  //setter
  void setUserData(String name, int budget, int goal) {
    _userData =
        UserDataModel(userName: name, userBudget: budget, userGoal: goal);
    notifyListeners();
  }

  //hive stuff
  void saveUserData() {
    userDataBox.add(_userData);
    print('successfully Saved');
  }

  //closes all boxes of hive
  void closeHiveBox() {
    Hive.close();
  }
}
