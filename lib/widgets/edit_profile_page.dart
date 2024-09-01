import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gathercise/widgets/screens/profile/profile_viewmodel.dart';
import 'package:image_picker/image_picker.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class EditProfilePage extends ConsumerStatefulWidget {
  @override
  _EditProfilePageState createState() => _EditProfilePageState();
}

class _EditProfilePageState extends ConsumerState<EditProfilePage> {
  final picker = ImagePicker();

  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  File? _imageFile;

  @override
  void initState() {
    super.initState();
    _fetchUserProfile();
  }

  void _uploadImage() async {
    try {
      final supabase = Supabase.instance.client;
      final userId = supabase.auth.currentUser!.id;

      final storage = supabase.storage.from('icons');
      final response = await storage.upload('$userId.png', _imageFile!,
          fileOptions: const FileOptions(upsert: true));
    } catch (e) {
      print(e);
    }
  }

  Future<void> _updateProfile() async {
    final supabase = Supabase.instance.client;
    final userId = supabase.auth.currentUser!.id;

    try {
      supabase.functions
          .invoke("profile/$userId", method: HttpMethod.put, body: {
        "id": userId,
        "username": _nameController.text,
      });
    } catch (e) {
      print(e);
    }
  }

  Future<void> _getImageOnCamera() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.camera);
      if (image == null) {
        return;
      }

      setState(() {
        _imageFile = File(image.path);
      });
    } on PlatformException catch (e) {
      print(e);
    }
  }

  Future<void> _getImageOnAlbum() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.gallery);
      if (image == null) {
        return;
      }
      _imageFile = File(image.path);
      print('画像の添付が成功しました');
    } on PlatformException catch (e) {
      print(e);
    }
  }

  Future<void> _fetchUserProfile() async {
    final supabase = Supabase.instance.client;
    final userId = supabase.auth.currentUser!.id;
    final userProfile = ref.read(profileViewModelProvider(userId));
    userProfile.whenData((profile) {
      _nameController.text = profile.userProfile?.name ?? '';
    });
  }

  void _onTapImage() {
    showCupertinoModalPopup(
      context: context,
      builder: (context) => CupertinoActionSheet(
        actions: [
          CupertinoActionSheetAction(
            isDefaultAction: true,
            onPressed: () {
              Navigator.pop(context);
              _getImageOnCamera();
            },
            child: const Text(
              'カメラ',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
          ),
          CupertinoActionSheetAction(
            onPressed: () {
              Navigator.pop(context);
              _getImageOnAlbum();
            },
            child: const Text(
              'アルバム',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
          ),
          CupertinoActionSheetAction(
            isDestructiveAction: true,
            onPressed: () => Navigator.pop(context),
            child: const Text('閉じる'),
          ),
        ],
      ),
    );
  }

  void _onSubmit() async {
    if (!_formKey.currentState!.validate()) return;

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Processing Data')),
    );

    final supabase = Supabase.instance.client;

    if (_imageFile != null) {
      _uploadImage();
    }

    await _updateProfile();
    Navigator.pop(context, true);
  }

  @override
  void dispose() {
    _nameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Profile'),
      ),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: <Widget>[
              GestureDetector(
                onTap: _onTapImage,
                child: CircleAvatar(
                  radius: 50,
                  backgroundImage: _imageFile != null
                      ? FileImage(_imageFile!)
                      : AssetImage('assets/images/select_image.png')
                          as ImageProvider,
                ),
              ),
              TextFormField(
                controller: _nameController,
                decoration: const InputDecoration(labelText: 'Name'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter some text';
                  }
                  return null;
                },
              ),
              ElevatedButton(
                onPressed: _onSubmit,
                child: const Text('更新'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
