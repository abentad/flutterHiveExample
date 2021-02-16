import 'package:hive/hive.dart';

//set what the generated code file name is going to be called
part 'userDataModel.g.dart';
//the command to run the generator is
//flutter packages pub run build_runner build

//make the class a hive type or anotate the class as hive type set type id
@HiveType(typeId: 0)
class UserDataModel {
  //set each variable as hive field
  @HiveField(0)
  String userName;
  @HiveField(1)
  int userBudget;
  @HiveField(2)
  int userGoal;

  UserDataModel({this.userName, this.userBudget, this.userGoal});
}
