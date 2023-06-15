import 'package:amicable/appwrite/auth.dart';
import 'package:amicable/views/login_screen.dart';
import 'package:appwrite/appwrite.dart';
import 'dart:io';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen>
    with SingleTickerProviderStateMixin {
  late TabController tabController;
  String? username;
  String? name;

  signOut() {
    final AuthAPI appwrite = context.read<AuthAPI>();
    appwrite.signOut();
  }

  initializeUserDetails() async {
    final AuthAPI appwrite = context.read<AuthAPI>();
    username = appwrite.userID;
    name = appwrite.name;
    print(username);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    initializeUserDetails();
    tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  File? _imageFile;
  bool _isUploading = false;
  late String _previewImageUrl;

  Future<void> _pickImage() async {
    final picker = ImagePicker();
    final pickedImage = await picker.pickImage(source: ImageSource.gallery);

    if (pickedImage != null) {
      setState(() {
        _imageFile = File(pickedImage.path);
        _previewImageUrl = '';
      });
    }
  }

  Future<void> _uploadImage() async {
    setState(() {
      _isUploading = true;
    });

    try {
      final AuthAPI appwrite = context.read<AuthAPI>();
      final response = await appwrite.storage.createFile(
        file: await InputFile.fromPath(path: _imageFile!.path),
         bucketId: '6489d589ad7217b71d23', fileId: ID.unique(),
      ) as Map;

      setState(() {
        _isUploading = false;
        _previewImageUrl = response['file']['url'];
      });
    } catch (e) {
      setState(() {
        _isUploading = false;
      });
      print('Error uploading image: $e');
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            SizedBox(
              height: 12,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Icon(
                      EvaIcons.arrowBack,
                      size: 26,
                    )),
                Text(
                  '$username',
                  style: TextStyle(fontSize: 26),
                ),
                GestureDetector(
                    onTap: () {
                      signOut();
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => LoginScreen()));
                    },
                    child: Icon(
                      EvaIcons.logOut,
                      size: 26,
                    )),
              ],
            ),
            SizedBox(
              height: 30,
            ),
            GestureDetector(
              onTap: () {
                _pickImage();
                _imageFile != null ? _uploadImage : null;
              },
              child: CircleAvatar(
                radius: 60,
                backgroundImage: _imageFile !=null ? Image.file(_imageFile!) as ImageProvider : AssetImage('assets/newyork.png'),
                // backgroundImage: _file != null ? FileImage(File(_file!.path)) : null,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              '$name',
              style: TextStyle(fontSize: 20),
            ),
            
          ],
        ),
      ),
    )
        // ],
        // ),
        );
  }
 
}
