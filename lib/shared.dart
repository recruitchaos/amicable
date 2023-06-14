import 'package:shared_preferences/shared_preferences.dart';

class UserSavedData {
 static SharedPreferences? preferences;
 
  

 static Future init() async {
  preferences = await SharedPreferences.getInstance();
  
 } 

  //SAVING MAIL
 static saveEmail(String email) async {
  return await preferences?.setString('email', email);
 }

  static saveName(String name) async {
  return await preferences?.setString('name', name);
 }

 static saveUserID(String userID) async {
  return await preferences?.setString('userId', userID);
 }

 static saveProfilePic(String profilepic) async {
  return await preferences?.setString('profile pic', profilepic);
 }

 static saveProfileUrl(String ProfileUrl) async {
  return await preferences?.setString('ProfileUrl', ProfileUrl);
 }

 //READING MAIL AND NAME
 static String? get getEmail => preferences?.getString('email');
 static String? get getName => preferences?.getString('name');
 static String? get getID => preferences?.getString('userId');
 static String? get getProfilePic => preferences?.getString('profile pic');
 static String? get getProfileUrl => preferences?.getString('ProfileUrl');
}