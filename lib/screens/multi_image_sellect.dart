import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:multi_functional_app/provider/image_sellestion_provider.dart';
import 'package:provider/provider.dart';

class MultiImageSellect extends StatefulWidget {
  const MultiImageSellect({super.key});

  @override
  State<MultiImageSellect> createState() => _MultiImageSellectState();
}

class _MultiImageSellectState extends State<MultiImageSellect>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return ChangeNotifierProvider(
      create: (context) => ImageSellestionProvider(),
      child: Scaffold(
        backgroundColor: Color(0xcbfdee00),
        body: Consumer<ImageSellestionProvider>(
          builder: (context, multiImageSellection, child) {
            final selectedIndex = multiImageSellection.sellectionIndex;

            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 300,
                  width: double.infinity,
                  child:
                      selectedIndex == null
                          ? Center(
                            child: AutoSizeText(
                              "Please, Select your favourite laptop",
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w700,
                                color: Colors.black54,
                              ),
                              maxLines: 1,
                            ),
                          )
                          : InteractiveViewer(
                            panEnabled: true,
                            scaleEnabled: true,
                            minScale: 1,
                            maxScale: 4,
                            child: Image.asset(
                              multiImageSellection
                                  .laptops[selectedIndex]["image"],
                              fit: BoxFit.cover,
                            ),
                          ),
                ),
                SizedBox(height: 20),
                selectedIndex != null
                    ? Text(
                      multiImageSellection.laptops[selectedIndex]["name"],
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
                    children: List.generate(
                      multiImageSellection.laptops.length,
                      (index) {
                        return Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: InkWell(
                            onTap: () {
                              multiImageSellection.sellectedItem(index);
                            },
                            child: AnimatedContainer(
                              duration: Duration(milliseconds: 200),
                              decoration: BoxDecoration(
                                border: Border.all(color: Colors.white),
                                color:
                                    multiImageSellection.isSellected(index)
                                        ? Colors.green[400]
                                        : Colors.transparent,
                              ),
                              width: 200,
                              height: 200,
                              child: Image.asset(
                                multiImageSellection.laptops[index]["image"],
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
