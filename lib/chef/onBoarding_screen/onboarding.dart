import 'package:chef_ruler/core/utils/contant/const.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:introduction_screen/introduction_screen.dart';

class OnBoardingPage extends StatelessWidget {
  const OnBoardingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Padding(
          padding: const EdgeInsets.only(top: 40),
          child: IntroductionScreen(
            pages: [
              PageViewModel(
                  title: 'شيف رولر',
                  body:
                      'يجمع شيف رولر بين أفضل الوجبات وأفضل الطهاه الذين لديهم قوائم طعام من مطابخ عالميه مختلفه',
                  image: buildImage(
                      context: context,
                      logoPath: 'asset/logo.png',
                      backPath: 'asset/onboarding1.jpg'),
                  decoration: pageDecoration()),
              PageViewModel(
                  title: 'أطلب وجباتك',
                  body:
                  'يمكنك اختيار نوع الطلب من أي طاهي من الطهاه المحترفين واختيار قوائم الطعام من المفضلين لديك',
                  image: buildImage(
                      context: context,
                      logoPath: 'asset/logo.png',
                      backPath: 'asset/onboarding2.jpg'),
                  decoration: pageDecoration()),
              PageViewModel(
                  title: 'طهاه لحفلاتك',
                  image: buildImage(
                      context: context,
                      logoPath: 'asset/logo.png',
                      backPath: 'asset/onboarding3.jpg'),
                  body:
                      ' يمكنك اختيار طاهي لعمل وجبات لحفله, زواج, عقيقه أو أي مناسبه أخري وستجدون طرق دفع مختلفه',
                  decoration: pageDecoration()),
            ],
            done: Container(
              decoration: const BoxDecoration(
                color: Colors.redAccent,
              ),
              child: Text(
                'انضم الان',
                style: GoogleFonts.atma(
                    fontSize: 17,
                    backgroundColor: Colors.redAccent,
                    fontWeight: FontWeight.w500,
                    letterSpacing: 3,
                    color: Colors.white),
              ),
            ),

            onDone: () => Navigator.pushNamed(context, signUp),
            showNextButton: false,
            showDoneButton: true,
            // skip: Text('skip'),
            // next: Icon(Icons.arrow_forward),
            dotsDecorator: getDotDecoration(),
            // freeze: true,
          ),
        ),
      ),
    );
  }
}

DotsDecorator getDotDecoration() => DotsDecorator(
    color: Colors.grey,
    activeColor: Colors.redAccent,
    size: Size(10, 10),
    activeSize: Size(22, 10),
    activeShape:
    RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)));

PageDecoration pageDecoration() {
  return PageDecoration(
    pageColor: Colors.white,
    titleTextStyle: const TextStyle(
        fontSize: 28, fontWeight: FontWeight.bold, color: Colors.redAccent),
    bodyTextStyle: GoogleFonts.aguafinaScript(
        fontSize: 20,
        fontWeight: FontWeight.w500,
        letterSpacing: 0.15,
        color: Colors.grey.shade600),
  );
}

Widget buildImage(
    {required String logoPath,
    required String backPath,
    required BuildContext context}) {
  var size = MediaQuery.of(context).size.height;
  return Column(
    children: [
      Align(
          alignment: Alignment.topCenter,
          child: Image.asset(
            logoPath,
            width: 120,
            height: 120,
          )),
      SizedBox(
        height: size * 0.03,
      ),
      Align(
          alignment: Alignment.bottomCenter,
          child: Image.asset(
            backPath,
            width: 200,
            height: 200,
            fit: BoxFit.fitHeight,
          )),
    ],
  );
}
