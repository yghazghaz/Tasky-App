import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:tasky/features/auth/screen/login_screen.dart';

class OnBordingScreen extends StatefulWidget {
  const OnBordingScreen({super.key});

  @override
  State<OnBordingScreen> createState() => _OnBordingScreenState();
}

class _OnBordingScreenState extends State<OnBordingScreen> {
  List<OnboardingItem> items = itemsOnBording();
  PageController controller = PageController();
  int index = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffFFFFFF),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 260,
              child: PageView.builder(
                controller: controller,

                onPageChanged: (value) {
                  setState(() {
                    index = value;
                  });
                },
                itemBuilder: (context, index) {
                  return Center(child: Image.asset(items[index].image));
                },
                itemCount: items.length,
              ),
            ),
            SizedBox(height: 23),

            SmoothPageIndicator(
              controller: controller,
              count: items.length,
              effect: ExpandingDotsEffect(
                activeDotColor: Color(0xff5F33E1),
                dotColor: Color(0xffC4C4C4),
                dotHeight: 5,
                dotWidth: 10,
                expansionFactor: 3,

                spacing: 8,
                radius: 10,
              ),
            ),
            SizedBox(height: 50),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 40),
              child: Column(
                children: [
                  Text(
                    items[index].title,
                    style: TextStyle(
                      color: Color(0xff404147),
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 42),
                  Text(
                    items[index].description,
                    style: TextStyle(
                      color: Color(0xff716C7E),
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 107),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: MaterialButton(
                      padding: EdgeInsets.symmetric(
                        horizontal: 24,
                        vertical: 12,
                      ),
                      onPressed: () {
                        if (index < items.length - 1) {
                          controller.nextPage(
                            duration: Duration(milliseconds: 500),
                            curve: Curves.easeIn,
                          );
                        } else {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(builder: (context) => Login()),
                          );
                        }
                      },
                      height: 48,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Text(
                        index < items.length - 1 ? "Next" : "Get Started",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      color: Color(0xff5F33E1),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class OnboardingItem {
  final String image;
  final String title;
  final String description;

  OnboardingItem({
    required this.image,
    required this.title,
    required this.description,
  });
}

itemsOnBording() {
  return [
    OnboardingItem(
      image: "assets/images/onboarding_1.png",
      title: "Manage your tasks",
      description:
          "You can easily manage all of your daily tasks in DoMe for free",
    ),
    OnboardingItem(
      image: "assets/images/onboarding_2.png",
      title: "Create daily routine",
      description:
          "In Tasky  you can create your personalized routine to stay productive",
    ),
    OnboardingItem(
      image: "assets/images/onboarding_3.png",
      title: "Organize your tasks",
      description:
          "You can organize your daily tasks by adding your tasks into separate categories",
    ),
  ];
}
