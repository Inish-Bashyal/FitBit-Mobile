import 'package:fitbit/view/report_issues_view.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SupportView extends StatefulWidget {
  const SupportView({super.key});

  @override
  State<SupportView> createState() => _SupportViewState();
}

class _SupportViewState extends State<SupportView> {
  var gap = const SizedBox(
    height: 20,
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 112, 110, 110),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            children: [
              gap,
              gap,
              Container(
                alignment: Alignment.topLeft,
                child: const Text(
                  'Help & Support',
                  style: TextStyle(
                    color: Color.fromARGB(255, 112, 110, 110),
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              gap,
              Container(
                alignment: Alignment.topLeft,
                child: const Text(
                  'Customer Support, Feedbacks, FAQs',
                  style: TextStyle(
                    color: Color.fromARGB(255, 112, 110, 110),
                    fontSize: 18,
                  ),
                ),
              ),
              gap,
              Row(
                children: const [
                  Icon(
                    FontAwesomeIcons.facebookMessenger,
                  ),
                  Text('  Facebook Messenger')
                ],
              ),
              gap,
              Row(
                children: const [
                  Icon(
                    FontAwesomeIcons.whatsapp,
                  ),
                  Text('  9810081542'),
                  Text(
                    '  (WhatsApp - Chat Only)',
                    style: TextStyle(
                      color: Color.fromARGB(255, 112, 110, 110),
                    ),
                  ),
                ],
              ),
              gap,
              Row(
                children: const [
                  Icon(
                    FontAwesomeIcons.viber,
                  ),
                  Text('  9863493234'),
                  Text(
                    '  (Viber - Chat Only)',
                    style: TextStyle(
                      color: Color.fromARGB(255, 112, 110, 110),
                    ),
                  ),
                ],
              ),
              gap,
              Row(
                children: const [
                  Icon(
                    Icons.email,
                  ),
                  Text('  inish.bashyal99@gmail.com'),
                  Text(
                    '  (Email Address)',
                    style: TextStyle(
                      color: Color.fromARGB(255, 112, 110, 110),
                    ),
                  )
                ],
              ),
              gap,
              Row(
                children: const [
                  Icon(
                    Icons.phone,
                  ),
                  Text('  9863493234'),
                  Text(
                    '  (Phone Number)',
                    style: TextStyle(
                      color: Color.fromARGB(255, 112, 110, 110),
                    ),
                  )
                ],
              ),
              gap,
              gap,
              const Divider(
                color: Colors.black,
              ),
              gap,
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const ReportIssuesView()),
                  );
                },
                child: Container(
                  alignment: Alignment.center,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          const Icon(
                            Icons.message,
                            size: 35,
                          ),
                          Column(
                            children: const [
                              Text(
                                'Report Issues',
                                style: TextStyle(
                                  fontSize: 21,
                                ),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Text(
                                '        We would love to hear from you',
                                style: TextStyle(
                                  color: Color.fromARGB(255, 112, 110, 110),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      const Icon(
                        Icons.arrow_right_outlined,
                        size: 35,
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
