import 'package:flutter/material.dart';
import 'package:flutterHiveExample/providers/userDataProvider.dart';
import 'package:provider/provider.dart';

class DetailScreen extends StatefulWidget {
  @override
  _DetailScreenState createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  @override
  Widget build(BuildContext context) {
    var userDataProvider = Provider.of<UserDataProvider>(context);

    return Scaffold(
      body: SafeArea(
        child: Container(
          width: double.infinity,
          child: Column(
            children: [
              SizedBox(height: 20.0),
              Text(userDataProvider.userData.userName),
              SizedBox(height: 20.0),
              Text(userDataProvider.userData.userBudget.toString()),
              SizedBox(height: 20.0),
              Text(userDataProvider.userData.userGoal.toString()),
              SizedBox(height: 20.0),
            ],
          ),
        ),
      ),
    );
  }
}
