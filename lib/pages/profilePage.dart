import 'package:flutter/material.dart';

/// 메인 색상
Color primaryColor = const Color.fromARGB(255, 83, 184, 138);

/// 포인트 색상
Color accentColor = const Color.fromARGB(255, 199, 176, 121);

/// 세 번째 페이지
class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  /// 전체 메뉴
  final List<Map<String, String>> menu = const [
    {
      "ko": "추천",
      "en": "Recommend",
      "imgUrl": "https://i.ibb.co/SwGPpzR/9200000003687-20211118142543832.jpg",
    },
    {
      "ko": "리저브 에스프레소",
      "en": "Reserve Espresso",
      "imgUrl": "https://i.ibb.co/JHVXZ72/9200000003690-20211118142702357.jpg",
    },
    {
      "ko": "리저브 드립",
      "en": "Reserve Drip",
      "imgUrl": "https://i.ibb.co/M91G17c/9200000003693-20211118142933650.jpg",
    },
    {
      "ko": "콜드브루",
      "en": "ColdBrew",
      "imgUrl": "https://i.ibb.co/jyZK4C9/9200000003696-20211118143125337.jpg",
    },
  ];

  @override
  Widget build(BuildContext context) {
    /// Tip : TabBar controller를 직접 TabBar에 넣어줄 수도 있고, 아래와 같이 위젯으로 감싸줄 수도 있습니다.
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text(
            "Order",
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
          backgroundColor: Colors.white,
          actions: [
            IconButton(
              icon: const Icon(Icons.search_outlined, color: Colors.grey),
              onPressed: () {
                print("Pay 우측 상단 아이콘 클릭 됨");
              },
            ),
          ],

          /// Tip : AppBar 하단에 TabBar를 만들어 줍니다.
          bottom: TabBar(
            isScrollable: false,
            indicatorColor: primaryColor,
            indicatorWeight: 4,
            labelColor: Colors.black,
            unselectedLabelColor: Colors.grey,
            labelStyle: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
            tabs: const [
              Tab(text: "전체 메뉴"),
              Tab(text: "나만의 메뉴"),
              Tab(text: "🎂 홀케이크"),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            /// 전체 메뉴
            ListView.builder(
              itemCount: 100,
              itemBuilder: (context, index) {
                final item = menu[index % menu.length];
                final ko = item["ko"] ?? "제목";
                final en = item["en"] ?? "title";
                final imgUrl = item["imgUrl"] ?? "";
                return Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 16,
                    horizontal: 21,
                  ),
                  child: Row(
                    children: [
                      CircleAvatar(
                        radius: 52,
                        // Tip : circleAvatar 배경에 맞춰서 동그랗게 이미지 넣는 방법
                        backgroundImage: NetworkImage(imgUrl),
                        backgroundColor: Colors.transparent,
                      ),
                      const SizedBox(width: 16),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            ko,
                            style: const TextStyle(
                              fontSize: 21,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 6),
                          Text(
                            en,
                            style: const TextStyle(
                              fontSize: 16,
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                );
              },
            ),

            /// 나만의 메뉴
            const Center(child: Text("나만의 메뉴")),

            /// 홀케이크 예약
            const Center(child: Text("홀케이크 예약")),
          ],
        ),
      ),
    );
  }
}