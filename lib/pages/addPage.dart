import 'dart:core';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';


import '../provider/productProvider.dart';class AddPage extends StatefulWidget {
  const AddPage({Key? key}) : super(key: key);

  @override
  State<AddPage> createState() => _AddPageState();
}

class _AddPageState extends State<AddPage> {
  final formKey = GlobalKey<FormState>();
  String _title = '';
  String _imagepath = '';
  String _text = '';
  final Product _product = const Product(category: Category.all, name: "", price: 0, url: "", docId: "", text: "");
  XFile? _image;
  final picker = ImagePicker();

  // 비동기 처리를 통해 카메라와 갤러리에서 이미지를 가져온다.
  Future getImage(ImageSource imageSource) async {
    final image = await picker.pickImage(source: imageSource);

    setState(() {
      _image = File(image!.path) as XFile?; // 가져온 이미지를 _image에 저장
    });
  }

  // 이미지를 보여주는 위젯
  Widget showImage() {
    return Container(
        color: const Color(0xffd0cece),
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.width,
        child: Center(
            child: _image == null
                ? Text('No image selected.')
                : Image.file(File(_image!.path))));
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Form(child: Column(
            children: [
              TextFormField(
                autovalidateMode: AutovalidateMode.always,
                onSaved: (value){
                  setState(() {
                    _title = value as String;
                  });
                },
                validator: (value){
                  if (value == null || value.isEmpty){
                    return "제목은 필수";
                  }
                  return null;
                },
              ),
              TextFormField(
                autovalidateMode: AutovalidateMode.always,
                onSaved: (value){
                  setState(() {
                    _text = value as String;
                  });
                },
                validator: (value){
                  if (value == null || value.isEmpty){
                    return "필수";
                  }
                  return null;
                },
              ),
              // 카메라 촬영 버튼
              FloatingActionButton(
                child: Icon(Icons.add_a_photo),
                tooltip: 'pick Iamge',
                onPressed: () {
                  getImage(ImageSource.camera);
                },
              ),

              // 갤러리에서 이미지를 가져오는 버튼
              FloatingActionButton(
                child: Icon(Icons.wallpaper),
                tooltip: 'pick Iamge',
                onPressed: () {
                  getImage(ImageSource.gallery);
                },
              ),
              ElevatedButton(onPressed: (){
                if(formKey.currentState!.validate()){
                  formKey.currentState!.save();

                  context.read<ProductProvider>().addProduct(_image, _product);
                }
              }, child: const Text("Add")),

            ],
          )),
        ),
      ),
    );
  }
}
