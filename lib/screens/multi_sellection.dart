import 'package:flutter/material.dart';

class MultiSellection extends StatefulWidget {
  const MultiSellection({super.key});

  @override
  State<MultiSellection> createState() => _MultiSellectionState();
}

class _MultiSellectionState extends State<MultiSellection>
    with AutomaticKeepAliveClientMixin {
  List<Map> gifts = [
    {"name": "Lion", "imagePath": "assets/images/animals/lion.png"},
    {"name": "cow", "imagePath": "assets/images/animals/cow.png"},
    {"name": "deer", "imagePath": "assets/images/animals/deer.png"},
    {"name": "giraffe", "imagePath": "assets/images/animals/giraffe.png"},
    {"name": "pingeon", "imagePath": "assets/images/animals/pingeon.png"},
    {"name": "rat", "imagePath": "assets/images/animals/rat.png"},
    {"name": "tiger", "imagePath": "assets/images/animals/tiger.png"},
    {
      "name": "white tiger",
      "imagePath": "assets/images/animals/white-tiger.png",
    },
  ];

  int? sellectedIndex;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      backgroundColor: Colors.grey[900],
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.builder(
          itemCount: gifts.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            mainAxisSpacing: 15,
            crossAxisSpacing: 7,
            childAspectRatio: 0.66,
          ),
          itemBuilder: (context, index) {
            final isSelected = sellectedIndex == index;

            return GestureDetector(
              onTap: () {
                setState(() {
                  sellectedIndex = index;
                });
              },
              child: Stack(
                children: [
                  // الخلفية لما تكون مختارة
                  if (isSelected)
                    Container(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [Colors.black38, Colors.black12],
                        ),
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),

                  // المحتوى (الصورة + الاسم)
                  Column(
                    children: [
                      Image.asset(
                        gifts[index]["imagePath"],
                        height: sellectedIndex == index ? 150 : 120,
                        width: double.infinity,
                        fit: isSelected ? BoxFit.cover : BoxFit.scaleDown,
                      ),
                      sellectedIndex == index
                          ? SizedBox.shrink()
                          : Text(
                            gifts[index]["name"].toString().toUpperCase(),
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.grey,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                      SizedBox(height: 10),
                    ],
                  ),

                  // زر الإرسال لو العنصر متعلم عليه
                  if (isSelected)
                    Positioned(
                      bottom: 0,
                      left: 0,
                      right: 0,
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          gradient: LinearGradient(
                            colors: [Colors.red, Colors.red.shade300],
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: Center(
                            child: Text(
                              "Send",
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w700,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
