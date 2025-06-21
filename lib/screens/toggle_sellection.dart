import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ToggleSellection extends StatefulWidget {
  const ToggleSellection({super.key});

  @override
  State<ToggleSellection> createState() => _ToggleSellectionState();
}

class _ToggleSellectionState extends State<ToggleSellection>
    with AutomaticKeepAliveClientMixin {
  int followers = 0;
  bool isFollowing = false;

  void toggleFollow() {
    setState(() {
      isFollowing = !isFollowing;
      followers += isFollowing ? 1 : -1;
    });
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 50),
            Center(
              child: Stack(
                clipBehavior: Clip.none,
                children: [
                  const CircleAvatar(
                    backgroundImage: AssetImage("assets/images/profile.jpg"),
                    radius: 160,
                  ),
                  Positioned(
                    bottom: -25,
                    left: 0,
                    right: 0,
                    child: GestureDetector(
                      onTap: toggleFollow,
                      child: CircleAvatar(
                        backgroundColor: Colors.white,
                        radius: 25,
                        child: Icon(
                          isFollowing
                              ? CupertinoIcons.check_mark_circled_solid
                              : CupertinoIcons.add_circled_solid,
                          color: isFollowing ? Colors.green : Colors.red,
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
                  "$followers",
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
              onTap: toggleFollow,
              child: Container(
                decoration: BoxDecoration(
                  color: isFollowing ? Colors.green[400] : Colors.red[400],
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        isFollowing
                            ? CupertinoIcons.check_mark_circled_solid
                            : CupertinoIcons.add_circled_solid,
                        size: 30,
                        color: Colors.black,
                      ),
                      const SizedBox(width: 10),
                      Text(
                        isFollowing ? "Following" : "Follow",
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
        ),
      ),
    );
  }

  bool get wantKeepAlive => true;
}
