import 'package:flutter/material.dart';
import 'package:timelines/timelines.dart';

class TransactionStatus extends StatefulWidget {
  const TransactionStatus({Key? key}) : super(key: key);

  @override
  State<TransactionStatus> createState() => _TransactionStatusState();
}

class _TransactionStatusState extends State<TransactionStatus>{
  Color accentColor = const Color.fromARGB(255, 199, 176, 121);
  Color accentColor1 = const Color.fromARGB(255, 199, 255, 121);
  Color accentColor2 = const Color.fromARGB(255, 255, 176, 121);

  List<IconData> iconList = [Icons.phone_iphone, Icons.laptop_mac, Icons.tablet_mac_outlined];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ListView.builder(
            itemCount: 3,
            itemBuilder: (BuildContext context, int idx) {
              return Card(
                shape: RoundedRectangleBorder(  //모서리를 둥글게 하기 위해 사용
                  borderRadius: BorderRadius.circular(16.0),
                ),
                elevation: 4.0, //그림자 깊이
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Icon(
                      iconList[idx],
                      color: Colors.grey,
                      size: 100,
                    ),
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text("$idx"),
                          const SizedBox(height: 20,),
                          ClipRRect(
                            borderRadius: const BorderRadius.all(
                              Radius.circular(10),
                            ),
                            child: Timeline.tileBuilder(
                              builder: TimelineTileBuilder.fromStyle(
                                contentsAlign: ContentsAlign.alternating,
                                contentsBuilder: (context, index) => Padding(
                                  padding: const EdgeInsets.all(24.0),
                                  child: Text('Timeline Event $index'),
                                ),
                                itemCount: 10,
                              ),
                            ),
                            // Stack(
                            //   children: [LinearProgressIndicator(
                            //     backgroundColor:
                            //     Colors.grey.withOpacity(0.2),
                            //     value: 0.3 * (idx + 1),
                            //     minHeight: 20,
                            //     valueColor:
                            //     AlwaysStoppedAnimation<Color>(
                            //       0.3 * (idx + 1) < 0.31 ? accentColor : 0.3 * (idx + 1) < 0.61 ? accentColor1 : accentColor2,
                            //     ),
                            //   ),
                            //     Align(
                            //       alignment: Alignment.lerp(Alignment.topLeft, Alignment.topRight, 0.3 * (idx + 1)),
                            //       child: Text("xxxxxxxxxxxxxxxxa"),
                            //     ),
                            //   ],
                            // ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            }
        ),
      ),
    );
  }
}
