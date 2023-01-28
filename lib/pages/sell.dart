import 'package:flutter/material.dart';
import '../component/buildCategory.dart';

/// 메인 색상
Color primaryColor = const Color.fromARGB(255, 83, 184, 138);

/// 포인트 색상
Color accentColor = const Color.fromARGB(255, 199, 176, 121);

Color _textColor = const Color(0xFF263238);

Color _barColor = const Color(0xFF3D5B74);

// 첫 번째 페이지
class Sell extends StatefulWidget {
  const Sell({Key? key}) : super(key: key);

  @override
  State<Sell> createState() => _SellState();
}

class _SellState extends State<Sell> {
  // 배경 이미지 URL
  final String backImg = "assets/images/mainBackground.png";

  Widget buildCategory(String _title, String _url, int state, String people) {
    return Container(
      height: 220,
      width: MediaQuery.of(context).size.width * 0.41,
      margin: EdgeInsets.all(8),
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.grey,
          width: 1,
        ),
        borderRadius: const BorderRadius.all(
          Radius.circular(10),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          ClipRRect(borderRadius: const BorderRadius.only(topLeft: Radius.circular(8.0), topRight: Radius.circular(8.0)), child: Image.network("https://i.ibb.co/QcVn97y/2021-12-16-1-33-11.png", )),
          const SizedBox(
            height: 10,
          ),
          Container(
            padding:  EdgeInsets.all(10),
            child: Column(
              children: [
                Container(
                  height: 40,
                  child: Text(
                    _title,
                    style: TextStyle(
                      color: _textColor,
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                const SizedBox(
                  height: 12,
                ),
                const ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  child: LinearProgressIndicator(
                    value: 0.7,
                    valueColor:
                        AlwaysStoppedAnimation<Color>(Color(0xFF3D5B74)),
                    backgroundColor: Color(0xffD6D6D6),
                  ),
                ),
                const SizedBox(
                  height: 12,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("${state}%"),
                    Container(
                      child: Row(
                        children: [
                          Text(people),
                          const Icon(
                            Icons.snowshoeing_sharp,
                            color: Colors.blue,
                            size: 20.0,
                          ),
                        ],
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  // 추천 메뉴
  final List<Map<String, String>> recommendMenu = const [
    {
      "name": "갤럭시 S10",
      "imgUrl":
          "https://hiphonemarket.com/web/product/medium/202204/d3f296ae9afaa8b8689ee4f59b2d410a.jpg"
    },
    {
      "name": "아이패드 에어2",
      "imgUrl":
          "https://cdn-pro-web-244-226.cdn-nhncommerce.com/rpm001_godomall_com/data/goods/20/01/04/1000000121/1000000121_magnify_028.jpg",
    },
    {
      "name": " APPLE 2022 맥북프로13 MNEJ3KH/A ",
      "imgUrl":
          "https://img.danawa.com/prod_img/500000/207/204/img/17204207_1.jpg?shrink=330:330&_v=20221223160346",
    },
    {
      "name": "아이스 스노우 민트 초콜릿",
      "imgUrl": "https://i.ibb.co/jyZK4C9/9200000003696-20211118143125337.jpg",
    },
    {
      "name": "스노우 민트 초콜릿 블렌디드",
      "imgUrl": "https://i.ibb.co/DKkV0rw/9200000003699-20211118143249044.jpg",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      /// 우측 하단에 Deliverys 아이콘을 띄위 위해 Stack으로 구현
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.zero,
              padding: EdgeInsets.zero,
              height: 260,
              // width: MediaQuery.of(context).size.width,
              child: Stack(
                children: [
                  Positioned.fill(
                      bottom: 80,
                      child: Image(
                        fit: BoxFit.fill,
                        // width: MediaQuery.of(context).size.width,
                        image: AssetImage(
                          backImg,
                        ),
                      )),
                  Container(
                    padding:
                    const EdgeInsets.only(top: 58, left: 20, right: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Image.asset(
                          "assets/images/logo.png",
                          height: 24,
                        ),
                        const SizedBox(
                          height: 24,
                        ),
                        const Text(
                          "버려지는 전자제품 줄이기 위한\n쇠동구리님의 4,200 발자국",
                          style: TextStyle(
                              color: Color(0xFF263238),
                              fontSize: 20,
                              fontWeight: FontWeight.w700),
                        ),
                        const SizedBox(height: 28),
                        Row(
                          children: [
                            Text(
                              "0",
                              style: TextStyle(
                                  fontSize: 12, color: _textColor),
                            ),
                            const SizedBox(
                              width: 12,
                            ),
                            const Expanded(
                              child: ClipRRect(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(10),
                                ),
                                child: LinearProgressIndicator(
                                  backgroundColor: Colors.white,
                                  value: 0.42,
                                  minHeight: 10,
                                  valueColor: AlwaysStoppedAnimation<Color>(
                                    Color(0xFF3D5B74),
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 12,
                            ),
                            Text(
                              "10,000",
                              style: TextStyle(
                                  fontSize: 12, color: _textColor),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 24,
                        ),
                        Row(
                          children: [
                            Text(
                              "발자국 내역 보러가기",
                              style: TextStyle(
                                  color: _textColor, fontSize: 14),
                            ),
                            const SizedBox(
                              width: 11.5,
                            ),
                            const Icon(
                              Icons.arrow_forward_ios_outlined,
                              size: 12,
                            ),
                          ],
                        )
                      ],
                    ),
                  )
                  // Positioned(
                  //   left: 24,
                  //   right: 24,
                  //   bottom: 60,
                  //   child: Column(
                  //     crossAxisAlignment: CrossAxisAlignment.start,
                  //     children: [
                  //       const SizedBox(height: 32),
                  //       Row(
                  //         crossAxisAlignment: CrossAxisAlignment.end,
                  //         children: [
                  //           /// Tip: LinearProgressIndicator가 끝없이 길어지지 않도록 Column의 가로 길이를 Row의 남은 자리만큼만 차지하도록 만들어줌
                  //           Expanded(
                  //             child: Column(
                  //               crossAxisAlignment: CrossAxisAlignment.start,
                  //               children: [
                  //                 Text(
                  //                   "11 ★ until next Reward",
                  //                   style: TextStyle(
                  //                     color: accentColor,
                  //                     fontSize: 16,
                  //                     fontWeight: FontWeight.bold,
                  //                   ),
                  //                 ),
                  //                 const SizedBox(height: 16),
                  //
                  //                 /// Tip : LinearProgressIndicator는 각져있는데, 둥글게 보이도록 모서리를 잘라냄
                  //                 ClipRRect(
                  //                   borderRadius: const BorderRadius.all(
                  //                     Radius.circular(10),
                  //                   ),
                  //                   child: LinearProgressIndicator(
                  //                     backgroundColor:
                  //                     Colors.grey.withOpacity(0.2),
                  //                     value: 0.083,
                  //                     minHeight: 10,
                  //                     valueColor: AlwaysStoppedAnimation<Color>(
                  //                       accentColor,
                  //                     ),
                  //                   ),
                  //                 ),
                  //               ],
                  //             ),
                  //           ),
                  //           const SizedBox(width: 16),
                  //           RichText(
                  //             textAlign: TextAlign.center,
                  //             text: TextSpan(
                  //               // 공통 스타일
                  //               style: const TextStyle(
                  //                 fontSize: 28,
                  //                 color: Colors.black, // RichText는 기본이 흰색이라 안보임
                  //               ),
                  //               children: [
                  //                 const TextSpan(
                  //                   text: "1",
                  //                   style: TextStyle(
                  //                     fontSize: 38,
                  //                     fontWeight: FontWeight.bold,
                  //                   ),
                  //                 ),
                  //                 const TextSpan(
                  //                   text: " / ",
                  //                   style: TextStyle(
                  //                     color: Colors.grey,
                  //                   ),
                  //                 ),
                  //                 TextSpan(
                  //                   text: "12 ★",
                  //                   style: TextStyle(
                  //                     color: accentColor,
                  //                     fontWeight: FontWeight.bold,
                  //                   ),
                  //                 ),
                  //               ],
                  //             ),
                  //           ),
                  //         ],
                  //       ),
                  //     ],
                  //   ),
                  // ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text("발자국 나누기", style: TextStyle(color: _textColor, fontSize: 16, fontWeight: FontWeight.w700),),
                      Text("더보기", style: TextStyle(color: _textColor, fontSize: 12, fontWeight: FontWeight.w500),),
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      buildCategory("전자제품 소각자 노동자들의 건강을 보호해주세요", "-", 60, "3,993,500"),
                      buildCategory(
                          "전자폐기물 더미에서 일하는 아이들에게 교육을 선물해 주세요", "-", 60, "1,916,200"),
                    ],
                  ),
                ],
              ),
            ),

            const SizedBox(height: 32),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children:  <Widget>[

                  Text("현재 매입 시세", style: TextStyle(color: _textColor, fontSize: 16, fontWeight: FontWeight.w700),),
                  Text("2023.01.28 기준", style: TextStyle(color: _textColor, fontSize: 12 , fontWeight: FontWeight.w500),),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.all(8.0),
              child: ListTile(
                shape: RoundedRectangleBorder(
                  side: BorderSide(width: 0.5),
                  borderRadius: BorderRadius.circular(20),
                ),
                visualDensity: VisualDensity(vertical: 4), // to expand
                leading: const CircleAvatar(
                  backgroundImage : AssetImage("assets/images/macbook.jpg"),
                ),
                title: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 5,
                    ),
                    Text("APPLE", style: TextStyle(color: Color(0xFFB0BEC5), fontSize: 12 ),),
                    SizedBox(
                      height: 3,
                    ),
                    Text("침수 맥북 프로 2020", style: TextStyle(color: _textColor, fontSize: 14 ),),
                    SizedBox(
                      height: 3,
                    ),
                  ],
                ),
                subtitle: Text('360,000원', style: TextStyle(color: _textColor, fontSize: 16, fontWeight: FontWeight.w700 ),),
                trailing: Icon(Icons.more_vert),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(8.0),
              child: ListTile(
                shape: RoundedRectangleBorder(
                  side: BorderSide(width: 0.5),
                  borderRadius: BorderRadius.circular(20),
                ),
                visualDensity: VisualDensity(vertical: 4), // to expand
                leading: const CircleAvatar(
                  backgroundImage : AssetImage("assets/images/iphone.jpg"),
                ),
                title: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 5,
                    ),
                    Text("APPLE", style: TextStyle(color: Color(0xFFB0BEC5), fontSize: 12 ),),
                    SizedBox(
                      height: 3,
                    ),
                    Text("Iphone 13", style: TextStyle(color: _textColor, fontSize: 14 ),),
                    SizedBox(
                      height: 3,
                    ),
                  ],
                ),
                subtitle: Text('100,000원', style: TextStyle(color: _textColor, fontSize: 16, fontWeight: FontWeight.w700 ),),
                trailing: Icon(Icons.more_vert),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
