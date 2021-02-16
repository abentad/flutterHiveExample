import 'package:flutter/material.dart';
import 'package:flutterHiveExample/providers/userDataProvider.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  TextEditingController _userNameController = TextEditingController();
  TextEditingController _userBudgetController = TextEditingController();
  TextEditingController _userGoalController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    UserDataProvider _userDataProvider = Provider.of<UserDataProvider>(context);

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 20.0),
                Text(
                  'Welcome',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 30.0,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      SizedBox(height: 20.0),
                      myCustomTextFormField(
                        hintText: "Enter Name",
                        controller: _userNameController,
                      ),
                      SizedBox(height: 20.0),
                      myCustomTextFormField(
                        keyboardType: TextInputType.number,
                        hintText: "Enter Budget",
                        controller: _userBudgetController,
                      ),
                      SizedBox(height: 20.0),
                      myCustomTextFormField(
                        keyboardType: TextInputType.number,
                        hintText: "Enter Goal",
                        controller: _userGoalController,
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20.0),
                MaterialButton(
                  onPressed: () {
                    if (_formKey.currentState.validate()) {
                      //will create a new user object based on the user input
                      _userDataProvider.setUserData(
                        _userNameController.text,
                        int.parse(_userBudgetController.text),
                        int.parse(_userGoalController.text),
                      );
                      _userDataProvider.saveUserData();
                    }
                  },
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50.0),
                  ),
                  child: Text(
                    'Continue',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20.0,
                    ),
                  ),
                  color: Colors.teal,
                  minWidth: double.infinity,
                  height: 60.0,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  TextFormField myCustomTextFormField({
    String hintText,
    TextEditingController controller,
    TextInputType keyboardType,
  }) {
    return TextFormField(
      keyboardType: keyboardType,
      style: TextStyle(fontSize: 20.0),
      controller: controller,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 20.0),
        hintText: hintText,
        hintStyle: TextStyle(color: Colors.grey, fontSize: 16.0),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(50),
        ),
      ),
      validator: (value) {
        if (value.isEmpty) {
          return 'Please enter some text';
        }
        return null;
      },
    );
  }
}
