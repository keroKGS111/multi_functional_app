import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class MultiSellection extends StatefulWidget {
  const MultiSellection({super.key});

  @override
  State<MultiSellection> createState() => _MultiSellectionState();
}

class _MultiSellectionState extends State<MultiSellection>
    with AutomaticKeepAliveClientMixin {
  final List<Map> gifts = [
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
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            Expanded(
              flex: 10,
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
                        if (isSelected)
                          Container(
                            decoration: BoxDecoration(
                              gradient: const LinearGradient(
                                colors: [Colors.black38, Colors.black12],
                              ),
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                        Column(
                          children: [
                            Image.asset(
                              gifts[index]["imagePath"],
                              height: sellectedIndex == index ? 150 : 120,
                              width: double.infinity,
                              fit: isSelected ? BoxFit.cover : BoxFit.scaleDown,
                            ),
                            const SizedBox(height: 10),
                            if (!isSelected)
                              Text(
                                gifts[index]["name"].toString().toUpperCase(),
                                style: const TextStyle(
                                  fontSize: 16,
                                  color: Colors.grey,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            const SizedBox(height: 10),
                          ],
                        ),
                        if (isSelected)
                          Positioned(
                            bottom: 0,
                            left: 0,
                            right: 0,
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                gradient: LinearGradient(
                                  colors: [Colors.green, Colors.green.shade300],
                                ),
                              ),
                              child: Padding(
                                padding: EdgeInsets.all(4.0),
                                child: Center(
                                  child: Text(
                                    gifts[index]["name"]
                                        .toString()
                                        .toUpperCase(),
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
            sellectedIndex != null
                ? Expanded(
                  child: AutoSizeText(
                    "Your sellection is ${gifts[sellectedIndex!]["name"].toString().toUpperCase()}",
                    style: TextStyle(color: Colors.white, fontSize: 25),
                    maxLines: 1,
                  ),
                )
                : SizedBox.shrink(),
          ],
        ),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
