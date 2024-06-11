import 'package:flutter/material.dart';
import 'package:track_app/pages/navpages/main_page.dart';
import 'package:track_app/widgets/app_large_text.dart';
import 'package:track_app/widgets/app_text.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  List images = [
    "OIP.jpg",
    "R.jpg",
    "a.jpg",
  ];
  List text = [
    'Welcome !',
    '',
    "",
  ];

  List text2 = [
    'To my tracing GPS APK',
    'Avantages of \n tracking apk',
    "How to use the \n application?",
  ];

  List text3 = [
    '',
    'Real-Time Location Sharing: Users can share their location in real-time with their friends, which can be useful for meetups or events. Safety: Parents can use the application to track the location of their children and ensure they arrive safely at their destination!',
    'You just need to specify a place where you want to go',
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: 4,
          itemBuilder: (_, index) {
            if (index == 3) {
              return MainPage();
            } else {
              return Container(
                width: double.maxFinite,
                height: double.maxFinite,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: (AssetImage(
                      "img/" + images[index],
                    )),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Container(
                  margin: const EdgeInsets.only(
                    top: 150,
                    right: 20,
                    left: 20,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          AppLargeText(
                            text: text[index],
                          ),
                          AppText(
                            text: text2[index],
                            size: 30,
                          ),
                          Container(
                            width: 250,
                            child: AppText(
                              text: text3[index],
                              color: Colors.white70,
                            ),
                          ),
                        ],
                      ),
                      Column(
                        children: List.generate(3, (indexDots) {
                          return Container(
                            margin: const EdgeInsets.only(bottom: 2),
                            width: 8,
                            height: index == indexDots ? 25 : 8,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              color: Colors.black,
                            ),
                          );
                        }),
                      ),
                    ],
                  ),
                ),
              );
            }
            ;
          }),
    );
  }
}
