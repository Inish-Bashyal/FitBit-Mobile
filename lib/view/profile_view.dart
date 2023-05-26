import 'package:flutter/material.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({super.key});

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  var gap = const SizedBox(
    height: 20,
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Stack(
              clipBehavior: Clip.none,
              children: [
                SizedBox(
                  width: double.infinity,
                  height: 300,
                  child: Image.network(
                    'https://assets.xfinity.com/assets/dotcom/learn/Images/Hub/Articles/house-dragon.jpeg',
                    fit: BoxFit.fitHeight,
                  ),
                ),
                const Positioned(
                  left: 0,
                  bottom: -70,
                  child: SizedBox(
                    width: 200,
                    height: 200,
                    child: CircleAvatar(
                      radius: 200,
                      backgroundImage: NetworkImage(
                          'https://www.cnet.com/a/img/resize/ed39b854b33cee2a83301c229c702dae6fd314a9/hub/2019/05/06/1adfd325-7ab6-41dc-8e8d-755b50cec10d/game-of-thrones-season-8-episode-4-dany-after-missandei.jpg?auto=webp&fit=crop&height=675&width=1200'),
                    ),
                  ),
                ),
              ],
            ),
            gap,
            gap,
            gap,
            gap,
            gap,
            Container(
                alignment: Alignment.bottomLeft,
                child: const Text(
                  'Full Name',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 26,
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
