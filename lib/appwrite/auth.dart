
import 'package:amicable/appwrite/appwrite_constants.dart';
import 'package:appwrite/appwrite.dart';
import 'package:appwrite/models.dart';
import 'package:flutter/material.dart';
import 'package:get/get_connect.dart';

import '../shared.dart';

enum AuthStatus {
  uninitialized,
  authenticated,
  unauthenticated,
}

class AuthAPI extends ChangeNotifier {
  Client client = Client();
  late final Account account;
  late final Databases databases;
  late final Storage storage;

  String databaseId = '64876a181ab843913baa';
  String collectionId = '64895bfddf276bd5d24a';

  // Storage? storage;
  // Databases? databases;

  late User _currentUser = currentUser;

  AuthStatus _status = AuthStatus.uninitialized;

  User get currentUser => _currentUser;
  AuthStatus get status => _status;
  String? get name => _currentUser.name;
  String? get email => _currentUser.email;
  String get userID => _currentUser.$id;

  AuthAPI(){
    init();
    loadUser();
  }

  //initiallize the appwrite client
  init() {
    client
          .setEndpoint(endpoint)
          .setProject(projectID)
          .setSelfSigned();
    account = Account(client);
    databases = Databases(client);
    storage = Storage(client);
    // databases = Databases(client);
  }

  loadUser() async {
    try{
      final user = await account.get();
      _status = AuthStatus.authenticated;
      _currentUser = user;
    } catch (e) {
      _status = AuthStatus.unauthenticated;
    } finally {
      notifyListeners();
    }
  }
  Future<User> createUser({required String email, required String password, required String userID, required String name}) async {
    try{
      final user = await account.create(userId: userID, email: email, password: password, name: name);
      return user;
    } finally {
      notifyListeners();
    }
  }

  Future<Session> createEmailSession ({required String email, required String password}) async {
    try {
      final session = await  account.createEmailSession(email: email, password: password);
      // await UserSavedData.saveUserID(userID);
      print(name);
      _currentUser = await account.get();
      _status = AuthStatus.authenticated;
      return session;
    }
     finally {
      notifyListeners();
    }
  }

  signInWithProvider({required String provider}) async {
    try {
      final session = await account.createOAuth2Session(provider: provider);
      _currentUser = await account.get();
      _status = AuthStatus.authenticated;
      return session;
    } finally {
      notifyListeners();
    }
  }

  signOut() async {
    try {
      await account.deleteSession(sessionId: 'current');
      _status = AuthStatus.unauthenticated;
    } finally {
      notifyListeners();
    }
  }

  Future uploadFile(InputFile file, List<String> permission) async {
    final res = await storage.createFile(bucketId: '6489d589ad7217b71d23', fileId: ID.unique(), file: file);
    return res;
  }
}