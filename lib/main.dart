import 'package:flutter/material.dart';
import 'package:flutterHiveExample/models/userDataModel.dart';
import 'package:flutterHiveExample/providers/userDataProvider.dart';
import 'package:flutterHiveExample/screens/detail_screen.dart';
import 'package:flutterHiveExample/screens/home_screen.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart' as path_provider;
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

int initScreen;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  //initializing hive at app document directory
  final appDocumentDirectory =
      await path_provider.getApplicationDocumentsDirectory();
  Hive.init(appDocumentDirectory.path);
  //this will use the UserDataModelAdapter that we generated
  Hive.registerAdapter(UserDataModelAdapter());

  //
  SharedPreferences prefs = await SharedPreferences.getInstance();
  initScreen = prefs.getInt("initScreen");
  await prefs.setInt("initScreen", 1);
  print('initScreen $initScreen');
  //
  //this will open the userData hive box
  await Hive.openBox("userData");

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (BuildContext context) => UserDataProvider(),
        ),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    // var userDataProvider = Provider.of<UserDataProvider>(context);
    return MaterialApp(
      title: 'HiveDB Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home:
          initScreen == 0 || initScreen == null ? HomeScreen() : DetailScreen(),
    );
  }
}
