import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:multi_functional_app/provider/toggle_sellection_provider.dart';
import 'package:provider/provider.dart';

class ToggleSellection extends StatefulWidget {
  const ToggleSellection({super.key});

  @override
  State<ToggleSellection> createState() => _ToggleSellectionState();
}

class _ToggleSellectionState extends State<ToggleSellection>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return ChangeNotifierProvider(
      create: (context) => ToggleSellectionProvider(),
      child: Scaffold(
        backgroundColor: Colors.black,
        body: SafeArea(
          child: Consumer<ToggleSellectionProvider>(
            builder: (context, toggleprovider, child) {
              return Column(
                children: [
                  const SizedBox(height: 50),
                  Center(
                    child: Stack(
                      clipBehavior: Clip.none,
                      children: [
                        const CircleAvatar(
                          backgroundImage: AssetImage(
                            "assets/images/profile.jpg",
                          ),
                          radius: 160,
                        ),
                        Positioned(
                          bottom: -25,
                          left: 0,
                          right: 0,
                          child: GestureDetector(
                            onTap: toggleprovider.toggleFollow,
                            child: CircleAvatar(
                              backgroundColor: Colors.white,
                              radius: 25,
                              child: Icon(
                                toggleprovider.isFollowing
                                    ? CupertinoIcons.check_mark_circled_solid
                                    : CupertinoIcons.add_circled_solid,
                                color:
                                    toggleprovider.isFollowing
                                        ? Colors.green
                                        : Colors.red,
                                size: 35,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 55),
                  const AutoSizeText(
                    "Kero George",
                    style: TextStyle(
                      fontSize: 23,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 30),
                  Column(
                    children: [
                      const Text(
                        "Followers",
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      SizedBox(height: 5),
                      Text(
                        "${toggleprovider.followers}",
                        style: const TextStyle(
                          fontSize: 25,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 30),
                  GestureDetector(
                    onTap: toggleprovider.toggleFollow,
                    child: Container(
                      decoration: BoxDecoration(
                        color:
                            toggleprovider.isFollowing
                                ? Colors.green[400]
                                : Colors.red[400],
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(
                              toggleprovider.isFollowing
                                  ? CupertinoIcons.check_mark_circled_solid
                                  : CupertinoIcons.add_circled_solid,
                              size: 30,
                              color: Colors.black,
                            ),
                            const SizedBox(width: 10),
                            Text(
                              toggleprovider.isFollowing
                                  ? "Following"
                                  : "Follow",
                              style: const TextStyle(
                                fontSize: 20,
                                color: Colors.black,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }

  bool get wantKeepAlive => true;
}
