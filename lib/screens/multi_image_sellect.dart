// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

class MultiImageSellect extends StatefulWidget {
  MultiImageSellect({super.key});

  @override
  State<MultiImageSellect> createState() => _MultiImageSellectState();
}

class _MultiImageSellectState extends State<MultiImageSellect> {
  List<Map> laptops = [
    {"name": "Mac Book", "image": "assets/images/laptop/labtop1.png"},
    {"name": "HUAWEI", "image": "assets/images/laptop/labtop2.png"},
    {"name": "Hp", "image": "assets/images/laptop/labtop3.png"},
    {"name": "Microsoft", "image": "assets/images/laptop/labtop4.png"},
  ];

  int? sellectionIndex;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xcbfdee00),
      //
      //
      body: Expanded(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 300,
              width: double.infinity,
              child:
                  sellectionIndex == null
                      ? SizedBox.shrink(
                        child: Center(
                          child: Text(
                            "Please, Sellect your favourite laptop",
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w700,
                              color: Colors.black54,
                            ),
                          ),
                        ),
                      )
                      : Image.asset(
                        laptops[sellectionIndex!]["image"],
                        fit: BoxFit.cover,
                      ),
            ),
            SizedBox(height: 20),
            sellectionIndex != null
                ? Text(
                  laptops[sellectionIndex!]["name"],
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.w700,
                    color: Colors.black54,
                  ),
                )
                : SizedBox.shrink(),
            SizedBox(height: 20),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: List.generate(laptops.length, (index) {
                  return Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: InkWell(
                      onTap: () {
                        setState(() {
                          sellectionIndex = index;
                        });
                      },
                      child: AnimatedContainer(
                        duration: Duration(microseconds: 1),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.white),
                          color:
                              sellectionIndex == index
                                  ? Colors.green[400]
                                  : Colors.transparent,
                        ),
                        width: 200,
                        height: 200,
                        child: Image.asset(
                          laptops[index]["image"],
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  );
                }),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
