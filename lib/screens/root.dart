import 'package:flutter/material.dart';
import 'package:multi_functional_app/screens/multi_image_sellect.dart';
import 'package:multi_functional_app/screens/multi_sellection.dart';
import 'package:multi_functional_app/screens/toggle_sellection.dart';

class Root extends StatefulWidget {
  const Root({super.key});

  @override
  State<Root> createState() => _RootState();
}

class _RootState extends State<Root> with AutomaticKeepAliveClientMixin {
  ///
  final PageController controller = PageController(keepPage: true);

  ///
  final List<Widget> screens = const [
    MultiSellection(),
    ToggleSellection(),
    MultiImageSellect(),
  ];

  ///
  int sellectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    super.build(context);

    return Scaffold(
      body: PageView.builder(
        controller: controller,
        itemCount: screens.length,
        onPageChanged: (v) {
          setState(() {
            sellectedIndex = v;
          });
        },
        itemBuilder: (context, index) {
          return screens[index];
        },
      ),

      ///
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            /// زر الرجوع للصفحة السابقة
            GestureDetector(
              onTap: () {
                if (sellectedIndex > 0) {
                  setState(() {
                    sellectedIndex--;
                    controller.jumpToPage(sellectedIndex);
                  });
                }
              },
              child: Container(
                width: 60,
                height: 60,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Icon(
                    Icons.arrow_back_ios_new_outlined,
                    color: Colors.black,
                  ),
                ),
              ),
            ),

            const SizedBox(width: 20),

            /// زر التقدم للصفحة التالية
            GestureDetector(
              onTap: () {
                if (sellectedIndex < screens.length - 1) {
                  setState(() {
                    sellectedIndex++;
                    controller.jumpToPage(sellectedIndex);
                  });
                }
              },
              child: Container(
                width: 150,
                height: 60,
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Next page",
                        style: TextStyle(
                          fontSize: 15,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(width: 10),
                      Icon(
                        Icons.arrow_forward_ios_outlined,
                        color: Colors.white,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
