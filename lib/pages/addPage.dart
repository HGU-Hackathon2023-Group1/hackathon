import 'dart:core';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import '../provider/productProvider.dart';
import '../provider/userProvider.dart';

const List<String> categories = [
  '휴대폰',
  '컴퓨터',
];

const List<String> level = [
  '액정 파손',
  '침수',
  '기타',
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
  final _detail = TextEditingController();
  final _proName = TextEditingController();

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
              controller: _proName,
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
            padding: EdgeInsets.only(left: 20,),
            child: Row(
              children: [
                Container(
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(30),),
                  child: Row(children: [
                    OutlinedButton(
                      onPressed: (){
                        setState(() {
                          _selectedLevel[0] = true;
                          _selectedLevel[1] = false;
                          _selectedLevel[2] = false;
                          _whichLevel = level[0];
                        },);
                      },
                      style: OutlinedButton.styleFrom(
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(50))),
                        backgroundColor: _selectedLevel[0] ? Color(0xff263238) : Colors.white,
                      ),
                      child: Text(level[0], style: TextStyle(color : _selectedLevel[0]? Colors.white : Colors.black,),),
                    ),
                    const SizedBox(width: 12,),
                    OutlinedButton(
                      onPressed: (){
                        setState(() {
                          _selectedLevel[1] = true;
                          _selectedLevel[0] = false;
                          _selectedLevel[2] = false;
                          _whichLevel = level[1];
                        },);
                      },
                      style: OutlinedButton.styleFrom(
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(50))),
                        backgroundColor: _selectedLevel[1] ? Color(0xff263238) : Colors.white,
                      ),
                      child: Text(level[1], style: TextStyle(color : _selectedLevel[1]? Colors.white : Colors.black,),),
                    ),
                    const SizedBox(width: 12,),
                    OutlinedButton(
                      onPressed: (){
                        setState(() {
                          _selectedLevel[2] = true;
                          _selectedLevel[0] = false;
                          _selectedLevel[1] = false;
                          _whichLevel = level[2];
                        },);
                      },
                      style: OutlinedButton.styleFrom(
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(50))),
                        backgroundColor: _selectedLevel[2] ? Color(0xff263238) : Colors.white,
                      ),
                      child: Text(level[2], style: TextStyle(color : _selectedLevel[2]? Colors.white : Colors.black,),),
                    ),
                  ],


                  ),
                ),
              ],
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(left: 20, right: 20, top: 15,),
            child: Divider(color: Color(0xffECEFF1), thickness: 1,),
          ),
          const Padding(
            padding: EdgeInsets.only(left: 20, top: 20, bottom: 18,),
            child: Text('상품설명', style: TextStyle(color: Colors.black, fontSize: 17,),),
          ),
          Container(
            padding: EdgeInsets.only(left: 20, right: 20,),
            child: TextField(
              controller: _detail,
              keyboardType: TextInputType.multiline,
              maxLines: 4,
              decoration: InputDecoration(
                  hintText: "상품설명을 적어주세요",
                  border: OutlineInputBorder(
                      borderSide: BorderSide(width: 1, color: Colors.redAccent)
                  )
              ),
            ),
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
              onTap: () async{
                String uid = await context.read<UserProvider>().getUid();
                await context.read<ProductProvider>().addProduct(XFile(_image!.path), Product(category: _whichLevel, name: _name.text, productName: _proName.text, url: "", text: _detail.text, address: ""),uid );
                FocusManager.instance.primaryFocus?.unfocus();
                await context.read<ProductProvider>().getProducts(uid);
                context.read<UserProvider>().setIdx(0);
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
