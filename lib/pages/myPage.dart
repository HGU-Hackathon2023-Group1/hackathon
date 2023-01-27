import 'package:flutter/material.dart';

class MyPage extends StatefulWidget {
  const MyPage({Key? key}) : super(key: key);

  @override
  _MyPageState createState() => _MyPageState();
}

class _MyPageState extends State<MyPage> with TickerProviderStateMixin {
  final Color _beginColor = Colors.transparent;
  final Color _endColor = Colors.white;

  final Color _beginIconColor = Colors.black;
  final Color _endIconColor = Colors.black;

  final Color _beginTextColor = Colors.transparent;
  final Color _endTextColor = Colors.black;

  final Color _textColor = const Color(0xFF263238);

  final double _animationSpeed = 130;

  late AnimationController _colorAnimationController;
  late Animation _colorTween, _iconColorTween, _textColorTween;

  Widget productCard(
      IconData _icon, String _name, String _brand, String _price, int _state) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      shape: RoundedRectangleBorder(
        //모서리를 둥글게 하기 위해 사용
        borderRadius: BorderRadius.circular(16.0),
      ),
      elevation: 1.0, //그림자 깊이
      child: Column(
        children: [
          const SizedBox(
            height: 10,
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "23.01.23",
                  style: TextStyle(
                      color: _textColor,
                      fontSize: 14,
                      fontWeight: FontWeight.w700),
                ),
                Container(
                    child: Row(
                  children: [
                    Text(
                      "거래상세",
                      style: TextStyle(
                          color: _textColor,
                          fontSize: 12,
                          fontWeight: FontWeight.w500),
                    ),
                    const Icon(
                      Icons.arrow_forward_ios,
                      size: 10,
                      color: Color(0xFFCFD8DC),
                    )
                  ],
                )),
              ],
            ),
          ),
          const Divider(),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Icon(
                  _icon,
                  color: Colors.grey,
                  size: 50,
                ),
                const SizedBox(
                  width: 10,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      _brand,
                      style: TextStyle(fontSize: 12, color: Color(0xFFB0BEC5)),
                    ),
                    Text(
                      _name,
                      style: TextStyle(fontSize: 14, color: Color(0xFF263238)),
                    ),
                    Text(
                      "${_price}원",
                      style: TextStyle(fontSize: 16, color: Color(0xFF263238)),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Center(
            child: Container(
              padding: const EdgeInsets.only(right: 5, left: 5, bottom: 10),
              child: progressBar(_state),
            ),
          )
        ],
      ),
    );
  }

  Widget tick(bool isChecked) {
    return isChecked
        ? Center(
          child: Stack(
            alignment: Alignment.center,
              children: const [
              Icon(
                Icons.circle,
                color: Color(0xFFE8BDC7),
                size: 12,
              ),
              Icon(
                Icons.circle,
                color: Color(0xFFBF5B6C),
                size: 7,
              ),
            ]),
        )
        : const Icon(
            Icons.circle,
            color: Color(0xFFB0BEC5),
            size: 7,
          );
  }

  Widget tick1(int _ticks) {
    return _ticks == 0 ? tick(true) : tick(false);
  }

  Widget tick2(int _ticks) {
    return _ticks == 1 ? tick(true) : tick(false);
  }

  Widget tick3(int _ticks) {
    return _ticks == 2 ? tick(true) : tick(false);
  }

  Widget line() {
    return Container(
      color: const Color(0xFFB0BEC5),
      height: 2.0,
      width: 123.0,
    );
  }

  Widget progressBar(int _ticks) {
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(height: 5,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              tick1(_ticks),
              line(),
              tick2(_ticks),
              line(),
              tick3(_ticks),
            ],
          ),
          const SizedBox(height: 5,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text("   접수", style: _ticks == 0 ? const TextStyle(color: Color(0xFFBF5B6C), fontSize: 12) : const TextStyle(color: Color(0xFF90A4AE), fontSize: 12),),
              Text("회수대기중", style: _ticks == 1 ? const TextStyle(color: Color(0xFFBF5B6C), fontSize: 12) : const TextStyle(color: Color(0xFF90A4AE), fontSize: 12),),
              Text("거래완료", style: _ticks == 2 ? const TextStyle(color: Color(0xFFBF5B6C), fontSize: 12) : const TextStyle(color: Color(0xFF90A4AE), fontSize: 12),),
            ],
          ),
        ],
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    _colorAnimationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 0));
    _colorTween = ColorTween(begin: _beginColor, end: _endColor)
        .animate(_colorAnimationController);
    _iconColorTween = ColorTween(begin: _beginIconColor, end: _endIconColor)
        .animate(_colorAnimationController);
    _textColorTween = ColorTween(begin: _beginTextColor, end: _endTextColor)
        .animate(_colorAnimationController);
  }

  bool _scrollListener(ScrollNotification scrollInfo) {
    if (scrollInfo.metrics.axis == Axis.vertical) {
      _colorAnimationController
          .animateTo(scrollInfo.metrics.pixels / _animationSpeed);
      return true;
    }
    return false;
  }

  @override
  Widget build(BuildContext context) {
    final double statusBarHeight = MediaQuery.of(context).padding.top;

    return Scaffold(
        backgroundColor: Colors.white,
        body: NotificationListener<ScrollNotification>(
          onNotification: _scrollListener,
          child: Container(
            height: double.infinity,
            child: Stack(children: [
              SingleChildScrollView(
                child: Column(
                  children: [

                    Container(
                      padding: const EdgeInsets.all(20.0),
                      color: Colors.white,
                      height: 300,
                      child: Column(
                        children: [
                          const SizedBox(
                            height: kToolbarHeight,
                          ),
                          Row(
                            children: [
                              Container(
                                height: 30,
                                width: 30,
                                decoration: const BoxDecoration(
                                    shape: BoxShape.circle,
                                    image: DecorationImage(
                                      fit: BoxFit.cover,
                                      image: NetworkImage(
                                          'https://picsum.photos/id/421/200/200'),
                                    )),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              const Text(
                                "쇠동구리",
                                style: TextStyle(
                                    fontSize: 20,
                                    color: Color(0xFF263238),
                                    fontWeight: FontWeight.w700),
                              ),
                              Expanded(
                                child: Align(
                                  alignment: Alignment.centerRight,
                                  child: OutlinedButton(
                                    onPressed: () {},
                                    style: OutlinedButton.styleFrom(
                                      side: const BorderSide(
                                          width: 1.0, color: Color(0xFF263238)),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(20),
                                      ),
                                    ),
                                    child: const Text(
                                      "프로필 수정하기",
                                      style: TextStyle(
                                          color: Color(0xFF263238),
                                          fontSize: 12,
                                          fontWeight: FontWeight.w500),
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                          const SizedBox(height: 15,),
                          // Container(
                          //   width: 378,
                          //   height: 123,
                          //   decoration: BoxDecoration(
                          //     //color: Colors.red,
                          //     borderRadius: BorderRadius.circular(8),
                          //     border: Border.all(width: 1),
                          //   ),
                          //   child: Column(
                          //     mainAxisAlignment: MainAxisAlignment.center,
                          //     children: [
                          //       InkWell(
                          //           child: Container(
                          //             height: 68,
                          //             decoration: BoxDecoration(
                          //               //color: Colors.yellow,
                          //               borderRadius: BorderRadius.vertical(
                          //                 top: Radius.circular(8),
                          //               ),
                          //             ),
                          //             child: Row(
                          //               mainAxisAlignment: MainAxisAlignment.center,
                          //               children: [
                          //                 const SizedBox(width: 18),
                          //                 Container(
                          //                   child: Text(
                          //                     '나의 지갑',
                          //                     style: TextStyle(
                          //                       fontWeight: FontWeight.bold,
                          //                       fontSize: 18,
                          //                     ),
                          //                   ),
                          //                 ),
                          //                 Spacer(),
                          //                 Container(
                          //                   child: Icon(
                          //                     Icons.attach_money,
                          //                     size: 25,
                          //                   ),
                          //                 ),
                          //                 Container(
                          //                   width: 10,
                          //                 ),
                          //                 Container(
                          //                   child: Text(
                          //                     '10,000',
                          //                     style: TextStyle(
                          //                       fontWeight: FontWeight.bold,
                          //                       fontSize: 20,
                          //                     ),
                          //                   ),
                          //                 ),
                          //                 Container(
                          //                   width: 21,
                          //                 ),
                          //                 Container(
                          //                   child: Icon(Icons.chevron_right),
                          //                 ),
                          //                 const SizedBox(width: 25),
                          //               ],
                          //             ),
                          //           ),
                          //           onTap: () {
                          //             ScaffoldMessenger.of(context).showSnackBar(
                          //               SnackBar(
                          //                 content: Text('나의 지갑'),
                          //                 duration: Duration(seconds: 3), //올라와있는 시간
                          //               ),
                          //             );
                          //           }),
                          //       const Divider(
                          //         height: 1,
                          //         color: Colors.black,
                          //       ),
                          //       Container(
                          //         decoration: BoxDecoration(
                          //           borderRadius: BorderRadius.vertical(
                          //             bottom: Radius.circular(30),
                          //           ),
                          //         ),
                          //         child: Row(
                          //           mainAxisAlignment: MainAxisAlignment.center,
                          //           crossAxisAlignment: CrossAxisAlignment.center,
                          //           children: [
                          //             InkWell(
                          //               child: Container(
                          //                 decoration: BoxDecoration(
                          //                   //color: Colors.green,
                          //                   borderRadius: BorderRadius.only(
                          //                     bottomLeft: Radius.circular(8),
                          //                   ),
                          //                 ),
                          //                 width: MediaQuery.of(context).size.width*0.43,
                          //                 height: 52,
                          //                 child: Row(
                          //                   mainAxisAlignment: MainAxisAlignment.center,
                          //                   crossAxisAlignment: CrossAxisAlignment.center,
                          //                   children: [
                          //                     Icon(Icons.remove),
                          //                     SizedBox(
                          //                       width: 17,
                          //                     ),
                          //                     Text('인출하기'),
                          //                   ],
                          //                 ),
                          //               ),
                          //               onTap: () {
                          //                 ScaffoldMessenger.of(context).showSnackBar(
                          //                   SnackBar(
                          //                     content: Text('인출이 완료되었습니다!'),
                          //                     duration: Duration(seconds: 3), //올라와있는 시간
                          //                   ),
                          //                 );
                          //               },
                          //             ),
                          //             Container(
                          //               width: 0.25,
                          //               height: 28,
                          //               decoration: BoxDecoration(
                          //                 border: Border.all(width: 0.25),
                          //               ),
                          //             ),
                          //             InkWell(
                          //               child: Container(
                          //                 decoration: BoxDecoration(
                          //                   //color: Colors.blue,
                          //                   borderRadius: BorderRadius.only(
                          //                     bottomRight: Radius.circular(8),
                          //                   ),
                          //                 ),
                          //                 width: MediaQuery.of(context).size.width*0.43,
                          //                 height: 52,
                          //                 child: Row(
                          //                   mainAxisAlignment: MainAxisAlignment.center,
                          //                   crossAxisAlignment: CrossAxisAlignment.center,
                          //                   children: [
                          //                     Icon(Icons.favorite_border),
                          //                     SizedBox(
                          //                       width: 14.5,
                          //                     ),
                          //                     Text('기부하기'),
                          //                   ],
                          //                 ),
                          //               ),
                          //               onTap: () {
                          //                 ScaffoldMessenger.of(context).showSnackBar(
                          //                   SnackBar(
                          //                     content: Text('기부가 완료되었습니다!'),
                          //                     duration: Duration(seconds: 3), //올라와있는 시간
                          //                   ),
                          //                 );
                          //               },
                          //             ),
                          //           ],
                          //         ),
                          //       ),
                          //     ],
                          //   ),
                          // ),
                          Container(
                            height: 130,
                            child: Card(
                              shape: RoundedRectangleBorder(
                                //모서리를 둥글게 하기 위해 사용
                                borderRadius: BorderRadius.circular(16.0),
                              ),
                              elevation: 4.0, //그림자 깊이
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  InkWell(
                                      child: Container(
                                        height: 68,
                                        decoration: BoxDecoration(
                                          //color: Colors.yellow,
                                          borderRadius: BorderRadius.vertical(
                                            top: Radius.circular(8),
                                          ),
                                        ),
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: [
                                            const SizedBox(width: 18),
                                            Container(
                                              child: Text(
                                                '나의 지갑',
                                                style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 18,
                                                ),
                                              ),
                                            ),
                                            Spacer(),
                                            Container(
                                              child: Icon(
                                                Icons.attach_money,
                                                size: 25,
                                              ),
                                            ),
                                            Container(
                                              width: 10,
                                            ),
                                            Container(
                                              child: Text(
                                                '10,000',
                                                style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 20,
                                                ),
                                              ),
                                            ),
                                            Container(
                                              width: 21,
                                            ),
                                            Container(
                                              child: Icon(Icons.chevron_right),
                                            ),
                                            const SizedBox(width: 25),
                                          ],
                                        ),
                                      ),
                                      onTap: () {
                                        ScaffoldMessenger.of(context).showSnackBar(
                                          SnackBar(
                                            content: Text('나의 지갑'),
                                            duration: Duration(seconds: 3), //올라와있는 시간
                                          ),
                                        );
                                      }),
                                  const Divider(
                                    height: 1,
                                    color: Colors.black,
                                  ),
                                  Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.vertical(
                                        bottom: Radius.circular(30),
                                      ),
                                    ),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: [
                                        InkWell(
                                          child: Container(
                                            decoration: BoxDecoration(
                                              //color: Colors.green,
                                              borderRadius: BorderRadius.only(
                                                bottomLeft: Radius.circular(8),
                                              ),
                                            ),
                                            width: MediaQuery.of(context).size.width*0.43,
                                            height: 52,
                                            child: Row(
                                              mainAxisAlignment: MainAxisAlignment.center,
                                              crossAxisAlignment: CrossAxisAlignment.center,
                                              children: [
                                                Icon(Icons.remove),
                                                SizedBox(
                                                  width: 17,
                                                ),
                                                Text('인출하기'),
                                              ],
                                            ),
                                          ),
                                          onTap: () {
                                            ScaffoldMessenger.of(context).showSnackBar(
                                              SnackBar(
                                                content: Text('인출이 완료되었습니다!'),
                                                duration: Duration(seconds: 3), //올라와있는 시간
                                              ),
                                            );
                                          },
                                        ),
                                        Container(
                                          width: 0.25,
                                          height: 28,
                                          decoration: BoxDecoration(
                                            border: Border.all(width: 0.25),
                                          ),
                                        ),
                                        InkWell(
                                          child: Container(
                                            decoration: BoxDecoration(
                                              //color: Colors.blue,
                                              borderRadius: BorderRadius.only(
                                                bottomRight: Radius.circular(8),
                                              ),
                                            ),
                                            width: MediaQuery.of(context).size.width*0.43,
                                            height: 52,
                                            child: Row(
                                              mainAxisAlignment: MainAxisAlignment.center,
                                              crossAxisAlignment: CrossAxisAlignment.center,
                                              children: [
                                                Icon(Icons.favorite_border),
                                                SizedBox(
                                                  width: 14.5,
                                                ),
                                                Text('기부하기'),
                                              ],
                                            ),
                                          ),
                                          onTap: () {
                                            ScaffoldMessenger.of(context).showSnackBar(
                                              SnackBar(
                                                content: Text('기부가 완료되었습니다!'),
                                                duration: Duration(seconds: 3), //올라와있는 시간
                                              ),
                                            );
                                          },
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      height: 8,
                      color: const Color(0xFFF5F5F5),
                    ),
                    const SizedBox(height: 10,),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Container(
                        padding: const EdgeInsets.only(left: 30.0),
                        child: Text(
                          "나의 거래 보기",
                          style: TextStyle(
                              color: _textColor,
                              fontSize: 16,
                              fontWeight: FontWeight.w700),
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Container(
                        padding: const EdgeInsets.only(left: 30.0),
                        child: Text(
                          "총 3개의 상품 거래",
                          style: TextStyle(
                              color: _textColor,
                              fontSize: 12,
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                    ),
                    productCard(Icons.laptop_mac, "MacBook Pro 14", "APPLE",
                        "360,000", 2),
                    productCard(Icons.phone_iphone_outlined, "Iphone 13",
                        "APPLE", "100,000", 1),
                    productCard(
                        Icons.phone_android, "갤럭시 S10", "SAMSUNG", "50,000", 0),
                  ],
                ),
              ),
              Container(
                height: statusBarHeight + kToolbarHeight, // 상단바 + AppBar 높이
                child: AnimatedBuilder(
                  animation: _colorAnimationController,
                  builder: (context, build) => AppBar(
                    shape: Border(
                      bottom:
                          BorderSide(color: Colors.grey.shade300, width: 0.5),
                    ),
                    elevation: 0,
                    scrolledUnderElevation: 5,
                    backgroundColor: Colors.transparent,
                    title: Text(
                      "마이프로필",
                      style: TextStyle(color: _colorTween.value),
                    ),
                    actions: [
                      IconButton(
                          // 우측 액션 버튼
                          onPressed: () {},
                          icon: Icon(Icons.settings_outlined,
                              color: _iconColorTween.value))
                    ],
                  ),
                ),
              ), // 표시할 화면
            ]),
          ),
        ));
  }
}
