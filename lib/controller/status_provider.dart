import 'package:amicable/appwrite/appwrite_constants.dart';
import 'package:amicable/shared.dart';
import 'package:appwrite/appwrite.dart';
import 'package:appwrite/models.dart';
import 'package:flutter/material.dart';

import '../appwrite/auth.dart';

class StatusProvider extends ChangeNotifier{
  String databaseID = '64876a181ab843913baa';
  String collectionID = '64876a2ba3828ab77ada';

  late final Databases databases;
  Client client = Client();

  StatusProvider() {
    init();
    readStatus();
  }

 init() {
    client
          .setEndpoint(endpoint)
          .setProject(projectID)
          .setSelfSigned();
    databases = Databases(client);
  }

  List<Document> _status = [];

  List<Document> get status => _status;

  List<Document> _userData = [];

  List<Document> get userData => _userData;

  Future readStatus () async{
    try {
      final data = await databases.listDocuments(databaseId: databaseID, collectionId: collectionID);
      _status = data.documents;
      notifyListeners(); 
    }
    catch(e) {
      print(e);
    }
  }

  //CREATE NEW STATUS
  Future createStatus(String Content, int Likes, String Name) async {
    final email = UserSavedData.getEmail;
    final name = UserSavedData.getName;
    print(name);
    final data = databases.createDocument(databaseId: databaseID, collectionId: collectionID, documentId: ID.unique(), data: {
      "Content" : Content,
      "Name" : Name,
      "Likes" : Likes,
      "createdBy" : email,
    });
    print('created!');
    readStatus();
    notifyListeners();
  }

  Future readUserData() async {
    try{
      final email = UserSavedData.getEmail;
      final data = await databases.listDocuments(databaseId: databaseID, collectionId: collectionID, queries: [
        Query.equal('createdBy', email)
      ]);
      _userData = data.documents;
      notifyListeners();
    }
    catch(e) {
      print(e);
    }
  }

}