import 'dart:io' as io;

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';

class ProductProvider extends ChangeNotifier{

  ProductProvider(){
    init();
  }
  // Get a non-default Storage bucket
  late FirebaseStorage storage;
  late Reference storageRef;
  CollectionReference products = FirebaseFirestore.instance.collection('products');
  void init(){
    storage = FirebaseStorage.instance;
    storageRef = storage.ref().child("image");
  }

  Future<UploadTask?> uploadFile(XFile? file) async {
    if (file == null) {
      return null;
    }

    UploadTask uploadTask;

    // Create a Reference to the file
    Reference ref = FirebaseStorage.instance
        .ref()
        .child('productImage')
        .child('/${file.name}.${file.mimeType}');

    final metadata = SettableMetadata(
      contentType: 'image/${file.mimeType}',
      customMetadata: {'picked-file-path': file.path},
    );

    if (kIsWeb) {
      uploadTask = ref.putData(await file.readAsBytes(), metadata);
    } else {
      uploadTask = ref.putFile(io.File(file.path), metadata);
    }

    return Future.value(uploadTask);
  }

  Future<void> deleteImage(String name) async {
    Reference desertRef = storageRef.child(name);

  // Delete the file
    await desertRef.delete();
  }

  Future<void> addProduct(XFile? file, Product product) async{
    String? fileUrl = "";
    if(file != null){
      UploadTask? uploadTask = await uploadFile(file);
      fileUrl = await uploadTask?.snapshot.ref.getDownloadURL();
    }
    await products.doc(product.docId).set(<String, dynamic>{
      "fileUrl" : fileUrl,
      "name" : product.name,
      "text" : product.text,
      "category" : product.category,
      "uid" : product.docId

    }).then((value){

    }).onError((error, stackTrace) => null);
  }

  Future<void> deleteProduct(String docId) async{
    await products.doc(docId).delete();
  }

  Future<void> editProduct(String filepath, Product product) async {
    await products.doc(product.docId).update({
      "fileUrl" : product.url,
      "name" : product.name,
      "text" : product.text,
      "category" : product.category,
      "docId" : product.docId,
      "price" : product.price,
    });
  }

  Future<void> _downloadFile(Reference ref, BuildContext context) async {
    final io.Directory systemTempDir = io.Directory.systemTemp;
    final io.File tempFile = io.File('${systemTempDir.path}/temp-${ref.name}');
    if (tempFile.existsSync()) await tempFile.delete();

    await ref.writeToFile(tempFile);

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          'Success!\n Downloaded ${ref.name} \n from bucket: ${ref.bucket}\n '
              'at path: ${ref.fullPath} \n'
              'Wrote "${ref.fullPath}" to tmp-${ref.name}',
        ),
      ),
    );
  }

  Future<String> uploadImage(String imageName) async {
    final _firebaseStorage = FirebaseStorage.instance;
    final _imagePicker = ImagePicker();
    PickedFile? image;
    //Check Permissions
    await Permission.photos.request();
    var permissionStatus = await Permission.photos.status;
    if (permissionStatus.isGranted){
      //Select Image
      image = await _imagePicker.getImage(source: ImageSource.gallery);
      if (image != null){
        var file = XFile(image.path);
        //Upload to Firebase
        String url;
        var snapshot = await _firebaseStorage.ref()
            .child('images/$imageName')
            .putFile(io.File(image.path));
        url = await snapshot.ref.getDownloadURL();
        return url;
      } else {
        print('No Image Path Received');
        return "";
      }
    } else {
      print('Permission not granted. Try Again with permission access');
      return "-1";
    }
  }
}

enum Category {
  all,
  accessories,
  clothing,
  home,
}

class Product {
  const Product({
    required this.category,
    required this.name,
    required this.price,
    required this.url,
    required this.docId,
    required this.text,
  });

  final Category category;
  final String name;
  final int price;
  final String url;
  final String docId;
  final String text;
}