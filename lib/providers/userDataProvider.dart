import 'package:flutter/cupertino.dart';
import 'package:flutterHiveExample/models/userDataModel.dart';
import 'package:hive/hive.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserDataProvider with ChangeNotifier {
  UserDataModel _userData;
  //hive variable for the box
  final userDataBox = Hive.box("userData");

  //
  bool _isSignedUp = false;

  //constructor
  UserDataProvider() {
    loadPrefs();
    loadUserData();
  }

  //getter
  UserDataModel get userData => _userData;
  bool get isSignedUp => _isSignedUp;

  //setter
  void setUserData(String name, int budget, int goal) {
    _userData =
        UserDataModel(userName: name, userBudget: budget, userGoal: goal);
    notifyListeners();
    //will save the newly created user object to the hive database
    saveUserData();
  }

  void setisSignedUp(bool value) {
    _isSignedUp = value;
    notifyListeners();
    savePrefs();
  }
  //

  //sharedprefs stuff
  void savePrefs() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool("isSignedUp", _isSignedUp);
  }

  void loadPrefs() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool isSignedUp = prefs.getBool("isSignedUP");
    if (isSignedUp != null) setisSignedUp(isSignedUp);
  }
  //

  //hive stuff
  void saveUserData() {
    userDataBox.add(_userData);
    print('successfully Saved');
  }

  void loadUserData() {
    _userData = userDataBox.get(0) as UserDataModel;

    print("loaded successfully");
    // print("signedUp: $_isSignedUp");
    // print(
    //     "${_userData.userName}\n${_userData.userBudget}\n${_userData.userGoal}\n");
  }

  //closes all boxes of hive
  void closeHiveBox() {
    Hive.close();
  }
  //
}
