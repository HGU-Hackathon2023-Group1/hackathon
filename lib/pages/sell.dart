import 'package:flutter/material.dart';
import '../component/buildCategory.dart';

/// 메인 색상
Color primaryColor = const Color.fromARGB(255, 83, 184, 138);

/// 포인트 색상
Color accentColor = const Color.fromARGB(255, 199, 176, 121);

// 첫 번째 페이지
class Sell extends StatefulWidget {
  const Sell({Key? key}) : super(key: key);

  @override
  State<Sell> createState() => _SellState();
}

class _SellState extends State<Sell> {
  // 배경 이미지 URL
  final String backImg =
      "https://i.ibb.co/2Pz33q7/2021-12-16-12-21-42-cleanup.png";

  // Frequency 이미지 URL
  final String frequencyImg = "https://i.ibb.co/QcVn97y/2021-12-16-1-33-11.png";

  // 추천 메뉴
  final List<Map<String, String>> recommendMenu = const [
    {
      "name": "갤럭시 S10",
      "imgUrl": "https://hiphonemarket.com/web/product/medium/202204/d3f296ae9afaa8b8689ee4f59b2d410a.jpg"
    },
    {
      "name": "아이패드 에어2",
      "imgUrl": "https://cdn-pro-web-244-226.cdn-nhncommerce.com/rpm001_godomall_com/data/goods/20/01/04/1000000121/1000000121_magnify_028.jpg",
    },
    {
      "name": " APPLE 2022 맥북프로13 MNEJ3KH/A ",
      "imgUrl": "https://img.danawa.com/prod_img/500000/207/204/img/17204207_1.jpg?shrink=330:330&_v=20221223160346",
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

  // 크리스마스 이벤트 이미지 URL
  final String eventImg = "https://i.ibb.co/Fb0q43T/IMG-F9-BA5-CBCB476-1.jpg";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      /// 우측 하단에 Deliverys 아이콘을 띄위 위해 Stack으로 구현
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 300,
                  width: MediaQuery.of(context).size.width,
                  child: Stack(
                    children: [
                      /// 백그라운드 이미지
                      Positioned.fill(
                        bottom: 60,
                        child: Image.network(
                          backImg,
                          fit: BoxFit.fill,
                        ),
                      ),

                      /// 배경 위 위젯
                      Positioned(
                        left: 24,
                        right: 24,
                        bottom: 60,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(height: 32),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                /// Tip: LinearProgressIndicator가 끝없이 길어지지 않도록 Column의 가로 길이를 Row의 남은 자리만큼만 차지하도록 만들어줌
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "11 ★ until next Reward",
                                        style: TextStyle(
                                          color: accentColor,
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      const SizedBox(height: 16),

                                      /// Tip : LinearProgressIndicator는 각져있는데, 둥글게 보이도록 모서리를 잘라냄
                                      ClipRRect(
                                        borderRadius: const BorderRadius.all(
                                          Radius.circular(10),
                                        ),
                                        child: LinearProgressIndicator(
                                          backgroundColor:
                                          Colors.grey.withOpacity(0.2),
                                          value: 0.083,
                                          minHeight: 10,
                                          valueColor: AlwaysStoppedAnimation<Color>(
                                            accentColor,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(width: 16),
                                RichText(
                                  textAlign: TextAlign.center,
                                  text: TextSpan(
                                    // 공통 스타일
                                    style: const TextStyle(
                                      fontSize: 28,
                                      color: Colors.black, // RichText는 기본이 흰색이라 안보임
                                    ),
                                    children: [
                                      const TextSpan(
                                        text: "1",
                                        style: TextStyle(
                                          fontSize: 38,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      const TextSpan(
                                        text: " / ",
                                        style: TextStyle(
                                          color: Colors.grey,
                                        ),
                                      ),
                                      TextSpan(
                                        text: "12 ★",
                                        style: TextStyle(
                                          color: accentColor,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 20),
                  padding: EdgeInsets.symmetric(horizontal: 8, vertical: 15),
                  width: MediaQuery.of(context).size.width,
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
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text("침수 MacBook Pro 150,000원 거래완료", style: TextStyle(color: primaryColor),),
                      Text("파손 갤럭시 A20 80,000원 거래완료", style: TextStyle(color: primaryColor),),
                      Text("파손 갤럭시 S10 60,000원 거래완료", style: TextStyle(color: primaryColor),),
                    ],
                  ),
                ),
                const SizedBox(height: 32),

                /// 추천 메뉴 Title
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                      // 공통 스타일
                      style: const TextStyle(
                        fontSize: 18,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                      children: [
                        TextSpan(
                          text: "쇠동구리님의 거래",
                          style: TextStyle(
                            color: accentColor,
                          ),
                        ),
                        //const TextSpan(text: "님을 위한 추천 메뉴"),
                      ],
                    ),
                  ),
                ),

                const SizedBox(height: 20),

                /// 추천 메뉴 horizontal list view
                SizedBox(
                  height: 150, // 높이를 가져야 ListView를 Column 안에 넣을 수 있음.
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal, // 횡스크롤
                    itemCount: 100,
                    itemBuilder: (context, index) {
                      final menu =
                          recommendMenu[index % recommendMenu.length];
                      final name = menu["name"] ?? "이름";
                      final imgUrl = menu["imgUrl"] ?? "";
                      return SizedBox(
                        width: 128,
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            CircleAvatar(
                              radius: 52,
                              // circleAvatar 배경에 맞춰서 동그랗게 이미지 넣는 방법
                              backgroundImage: NetworkImage(imgUrl),
                              backgroundColor: Colors.transparent,
                            ),
                            const SizedBox(height: 6),
                            Text(
                              name,
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),

                const SizedBox(
                  height: 20,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}