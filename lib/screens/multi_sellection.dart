import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:multi_functional_app/provider/sellection_provider.dart';
import 'package:provider/provider.dart';

class MultiSellection extends StatefulWidget {
  const MultiSellection({super.key});

  @override
  State<MultiSellection> createState() => _MultiSellectionState();
}

class _MultiSellectionState extends State<MultiSellection>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return ChangeNotifierProvider(
      create: (context) => SellectionProvider(),
      child: Scaffold(
        backgroundColor: Colors.grey[900],
        body: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Consumer<SellectionProvider>(
            builder: (context, sellection, child) {
              return Column(
                children: [
                  Expanded(
                    flex: 10,
                    child: GridView.builder(
                      itemCount: sellection.gifts.length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                        mainAxisSpacing: 15,
                        crossAxisSpacing: 7,
                        childAspectRatio: 0.66,
                      ),
                      itemBuilder: (context, index) {
                        final isSelected = sellection.isSelected(index);
                        return GestureDetector(
                          onTap: () {
                            sellection.sellectionItem(index);
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
                                    sellection.gifts[index]["imagePath"],
                                    height:
                                        sellection.isSelected(index)
                                            ? 150
                                            : 120,
                                    width: double.infinity,
                                    fit:
                                        isSelected
                                            ? BoxFit.cover
                                            : BoxFit.scaleDown,
                                  ),
                                  const SizedBox(height: 10),
                                  if (!isSelected)
                                    Text(
                                      sellection.gifts[index]["name"]
                                          .toString()
                                          .toUpperCase(),
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
                                        colors: [
                                          Colors.green,
                                          Colors.green.shade300,
                                        ],
                                      ),
                                    ),
                                    child: Padding(
                                      padding: EdgeInsets.all(4.0),
                                      child: Center(
                                        child: Text(
                                          sellection.gifts[index]["name"]
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
                  sellection.sellectedIndex != null
                      ? Expanded(
                        child: AutoSizeText(
                          "Your sellection is ${sellection.gifts[sellection.sellectedIndex!]["name"].toString().toUpperCase()}",
                          style: TextStyle(color: Colors.white, fontSize: 25),
                          maxLines: 1,
                        ),
                      )
                      : SizedBox.shrink(),
                ],
              );
            },
          ),
        ),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
