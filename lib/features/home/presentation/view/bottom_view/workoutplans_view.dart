import 'package:fitbit/core/common/widgets/cardview_widget.dart';
import 'package:flutter/material.dart';

class WorkoutPlansView extends StatefulWidget {
  const WorkoutPlansView({super.key});

  @override
  State<WorkoutPlansView> createState() => _WorkoutPlansViewState();
}

class _WorkoutPlansViewState extends State<WorkoutPlansView> {
  var gap = const SizedBox(
    height: 20,
  );

  var sideGap = const SizedBox(
    width: 5,
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Workout Plans'),
      ),
      body: Container(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextFormField(
              decoration: const InputDecoration(
                hintText: 'Search',
                suffixIcon: Icon(
                  Icons.search,
                ),
              ),
            ),
            gap,
            const Text(
              'Our Trainers',
              style: TextStyle(fontSize: 25),
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    for (int i = 1; i <= 5; i++) ...{
                      Column(
                        children: [
                          const CircleAvatar(
                            radius: 50,
                            backgroundImage: NetworkImage(
                                'https://media.licdn.com/dms/image/D5603AQG-BMXz9ds3Kw/profile-displayphoto-shrink_800_800/0/1674663322596?e=2147483647&v=beta&t=-ASZP2s-NHHfPfozLn9l2mmYZh--8RipLD-v_6lENrc'),
                          ),
                          Text('Trainer $i'),
                        ],
                      ),
                      sideGap,
                    }
                  ],
                ),
              ),
            ),
            gap,
            const Text(
              'Workout Plans',
              style: TextStyle(
                fontSize: 25,
              ),
            ),
            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.all(8),
                itemCount: 5,
                itemBuilder: (BuildContext context, int index) {
                  int firstCardIndex = index * 2;
                  int secondCardIndex = index * 2 + 1;

                  return Row(
                    children: [
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: cardView(
                            'assets/images/logo1.png',
                            'Workout ${firstCardIndex + 1}',
                            'Description ${firstCardIndex + 1}',
                            context,
                          ),
                        ),
                      ),
                      const SizedBox(width: 8),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: cardView(
                            'assets/images/logo1.png',
                            'Workout ${secondCardIndex + 1}',
                            'Description ${secondCardIndex + 1}',
                            context,
                          ),
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
