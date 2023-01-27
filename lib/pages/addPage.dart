import 'dart:core';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import '../provider/productProvider.dart';

const List<String> categories = [
  '휴대폰',
  '컴퓨터',
];

const List<String> level = [
  '조금 망가짐',
  '보통',
  '많이 망가짐',
];

class AddPage extends StatefulWidget {
  const AddPage({Key? key}) : super(key: key);

  @override
  State<AddPage> createState() => _AddPageState();
}

class _AddPageState extends State<AddPage> {
  final formKey = GlobalKey<FormState>();

  String _title = '';
  String _imagepath = '';
  String _text = '';

  String _whichCategory = '';
  String _whichLevel = '';

  final List<bool> _selectedCategories = <bool>[true, false];
  final List<bool> _selectedLevel = <bool>[false, true, false];

  final _name = TextEditingController();
  final _address = TextEditingController();

  final Product _product = const Product(category: Category.all, name: "", price: 0, url: "", docId: "", text: "");
  File? _image;
  final picker = ImagePicker();

  // 비동기 처리를 통해 카메라와 갤러리에서 이미지를 가져온다.
  Future getImage(ImageSource imageSource) async {
    final image = await picker.pickImage(source: imageSource);

    setState(() {
      _image = File(image!.path) as File?; // 가져온 이미지를 _image에 저장
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
                ? const Text('No image selected.')
                : Image.file(File(_image!.path))));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ADD', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),),
        centerTitle: true,
        backgroundColor: Colors.white,
        leading: Builder( // menu icon
          builder: (context) => IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.black,),
            onPressed: () => Navigator.pop(context), // open drawer
          ),
        ),
        elevation: 0.0,
      ),

      body: ListView(
        children: [
          // const Align(
          //   alignment: AlignmentDirectional.bottomEnd,
          //   child: Padding(
          //     padding: EdgeInsets.only(top: 15, right: 10,),
          //     child: Icon(Icons.camera_alt),
          //   ),
          // ),
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20, top: 18,),
            child: Container(
              height: 150,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(8)),
                color: Color(0xffD9D9D9),
              ),
              child: InkWell(
                child: _image!= null?
                showImage() :
                const Center(
                  child: Text('사진 업로드 사이즈만 바꿔서\n그대로 사용하시면 될 것 같습니다.',
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                onTap: (){
                  getImage(ImageSource.gallery);
                },
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20, top: 30,),
            child: TextField(
              controller: _name,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                label: Text(' 브랜드명을 입력해주세요', style: TextStyle(color: Colors.black),),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20, top: 18,),
            child: TextField(
              controller: _name,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                label: Text(' 제품명을 입력해주세요', style: TextStyle(color: Colors.black),),
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(left: 20, right: 20, top: 28,),
            child: Divider(color: Color(0xffECEFF1), thickness: 1,),
          ),
          const Padding(
            padding: EdgeInsets.only(left: 20, top: 20, bottom: 18,),
            child: Text('상태', style: TextStyle(color: Colors.black, fontSize: 17,),),
          ),
          Container(
            width: 180,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(30),),
            padding: const EdgeInsets.only(left: 20,),
            child: Ink(
              width: 10,
              height: 30,
              color: Colors.white,
              child: Row(children: [
                  OutlinedButton(
                    onPressed: (){
                      setState(() {
                        _selectedLevel[0] = true;
                        _selectedLevel[1] = false;
                        _selectedLevel[2] = false;
                      },);
                    },
                    style: OutlinedButton.styleFrom(
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(50))),
                      backgroundColor: _selectedLevel[0] ? Color(0xffD6EAF8) : Colors.white,
                    ),
                    child: Text(level[0], style: TextStyle(color : _selectedLevel[0]? Colors.black : Colors.white,),),
                  ),
                ],
              ),
            ),
          ),

          const Padding(
            padding: EdgeInsets.only(left: 35, right: 30, top: 20, bottom: 40,),
            child: Text('보내는 상품에 대한 정보를\n적어주세요', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 20,),),
          ),
          const SizedBox(height: 10,),
          Padding(
            padding: const EdgeInsets.only(left: 30, right: 30,),
            child: TextField(
              controller: _name,
              decoration: const InputDecoration(
                helperText: '제품명을 임력해주세요',
                border: OutlineInputBorder(),
                label: Text(' 제품명', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),),
              ),
            ),
          ),
          const SizedBox(height: 20,),
          Padding(
            padding: const EdgeInsets.only(left: 30, right: 30,),
            child: TextField(
              controller: _address,
              decoration: const InputDecoration(
                helperText: '피업할 주소를 입력해주세요',
                border: OutlineInputBorder(),
                label: Text(' 주소', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),),
              ),
            ),
          ),
          const SizedBox(height: 20,),
          const Padding(
            padding: EdgeInsets.only(left: 30, right: 30,),
            child: Divider(color: Colors.black,),
          ),
          const Padding(
            padding: EdgeInsets.only(left: 35, right: 30, top: 20, bottom: 20,),
            child: Text('카테고리', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold,),),
          ),

          Container(
            //decoration: BoxDecoration(borderRadius: BorderRadius.circular(30),),
            padding: EdgeInsets.only(left: 50,right: 50,),
            child: Ink(
              width: 10,
              height: 30,
              color: Colors.white,
              child: GridView.count(
                primary: true,
                crossAxisCount: 2, //set the number of buttons in a row
                crossAxisSpacing: 20, //set the spacing between the buttons
                childAspectRatio: 3.5, //set the width-to-height ratio of the button,
                //>1 is a horizontal rectangle
                children: List.generate(_selectedCategories.length, (index) {
                  //using Inkwell widget to create a button
                  return InkWell(
                    customBorder: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    //splashColor: Colors.blueGrey, //the default splashColor is grey
                    onTap: () {
                      //set the toggle logic
                      setState(() {
                        for (int indexBtn = 0;
                        indexBtn < _selectedCategories.length;
                        indexBtn++) {
                          if (indexBtn == index) {
                            _selectedCategories[indexBtn] = true;
                            _whichCategory = categories[indexBtn];
                          } else {
                            _selectedCategories[indexBtn] = false;
                          }
                        }
                      });
                    },
                      child: Ink(
                        decoration: BoxDecoration(
                          //set the background color of the button when it is selected/ not selected
                          color: _selectedCategories[index] ? Color(0xffD6EAF8) : Colors.white,
                          // here is where we set the rounded corner
                          borderRadius: BorderRadius.circular(30),
                          //don't forget to set the border,
                          //otherwise there will be no rounded corner
                          border: Border.all(color: Colors.black),
                        ),
                        child: Center(
                            child: Text(categories[index], ),
                        ),//set the color of the icon when it is selected/ not selected
                      ),
                    );
                  }),
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.only(left: 40, top: 20,),
              child: _selectedCategories[0]?
                const Text('휴대폰 시세 : 5000원', style: TextStyle(color: Colors.blueGrey, fontSize: 13,),)
                : const Text('컴퓨터 시세 : 10000원', style: TextStyle(color: Colors.blueGrey, fontSize: 13,),),
            ),

          const Padding(
            padding: EdgeInsets.only(left: 35, right: 30, top: 30, bottom: 20,),
            child: Text('상태', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold,),),
          ),

          Container(
            //decoration: BoxDecoration(borderRadius: BorderRadius.circular(30),),
            padding: EdgeInsets.only(left: 50,right: 50,),
            child: Ink(
              width: 10,
              height: 30,
              color: Colors.white,
              child: GridView.count(
                primary: true,
                crossAxisCount: 3, //set the number of buttons in a row
                crossAxisSpacing: 15, //set the spacing between the buttons
                childAspectRatio: 2.5, //set the width-to-height ratio of the button,
                //>1 is a horizontal rectangle
                children: List.generate(_selectedLevel.length, (index) {
                  //using Inkwell widget to create a button
                  return InkWell(
                    customBorder: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    //splashColor: Colors.blueGrey, //the default splashColor is grey
                    onTap: () {
                      //set the toggle logic
                      setState(() {
                        for (int indexBtn = 0;
                        indexBtn < _selectedLevel.length;
                        indexBtn++) {
                          if (indexBtn == index) {
                            _selectedLevel[indexBtn] = true;
                            _whichLevel = level[indexBtn];
                          } else {
                            _selectedLevel[indexBtn] = false;
                          }
                        }
                      });
                    },
                    child: Ink(
                      decoration: BoxDecoration(
                        //set the background color of the button when it is selected/ not selected
                        color: _selectedLevel[index] ? Color(0xffD6EAF8) : Colors.white,
                        // here is where we set the rounded corner
                        borderRadius: BorderRadius.circular(30),
                        //don't forget to set the border,
                        //otherwise there will be no rounded corner
                        border: Border.all(color: Colors.black),
                      ),
                      child: Center(
                        child: Text(level[index], ),
                      ),//set the color of the icon when it is selected/ not selected
                    ),
                  );
                }),
              ),
            ),
          ),

          const Padding(
            padding: EdgeInsets.only(left: 30, right: 30, top: 30, bottom: 20,),
            child: Divider(color: Colors.black, thickness: 0.5,),
          ),

          Padding(
            padding: const EdgeInsets.only(left: 35, right: 30, bottom: 15,),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
                children: const [
                  Text('사진', style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,),
                  ),
                  SizedBox(width: 10,),
                  Text('미리 사진을 찍어서 올려주세요', style: TextStyle(
                    color: Colors.grey,
                    fontWeight: FontWeight.bold,
                    fontSize: 11,
                  ),
                  ),
                ],
            ),
          ),

          const Padding(
            padding: EdgeInsets.only(left: 30, right: 30, top: 20, ),
            child: Divider(color: Colors.black,),
          ),

            Padding(
              padding: EdgeInsets.only(right: 130, left: 130, bottom: 40, top: 20,),
              child: InkWell(
                child: Container(
                  width: 30,
                  height: 50,
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(40), color: Colors.blue,),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Text('보내기', style: TextStyle(
                          color: Colors.white,
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(width: 8,),
                      Icon(Icons.send, color: Colors.white,),
                    ],
                  ),
                ),
                onTap: (){
                  print(_whichCategory);
                  print(_whichLevel);
                  print(_name.text);
                  print(_address.text);
                },
              ),
            ),
        ],
      ),






      // body: SingleChildScrollView(
      //   child: Center(
      //     child: Form(child: Column(
      //       children: [
      //         TextFormField(
      //           autovalidateMode: AutovalidateMode.always,
      //           onSaved: (value){
      //             setState(() {
      //               _title = value as String;
      //             });
      //           },
      //           validator: (value){
      //             if (value == null || value.isEmpty){
      //               return "제목은 필수";
      //             }
      //             return null;
      //           },
      //         ),
      //         TextFormField(
      //           autovalidateMode: AutovalidateMode.always,
      //           onSaved: (value){
      //             setState(() {
      //               _text = value as String;
      //             });
      //           },
      //           validator: (value){
      //             if (value == null || value.isEmpty){
      //               return "필수";
      //             }
      //             return null;
      //           },
      //         ),
      //         // 카메라 촬영 버튼
      //           child: Icon(Icons.add_a_photo),
      //           tooltip: 'pick Iamge',
      //           onPressed: () {
      //             getImage(ImageSource.camera);
      //           },
      //         ),
      //
      //         // 갤러리에서 이미지를 가져오는 버튼
      //         FloatingActionButton(
      //           child: Icon(Icons.wallpaper),
      //           tooltip: 'pick Iamge',
      //           onPressed: () {
      //             getImage(ImageSource.gallery);
      //           },
      //         ),
      //         ElevatedButton(onPressed: (){
      //           if(formKey.currentState!.validate()){
      //             formKey.currentState!.save();
      //
      //             //context.read<ProductProvider>().addProduct(_image, _product);
      //           }
      //         }, child: const Text("Add")),
      //
      //       ],
      //     )),
      //   ),
      // ),
    );
  }
}
