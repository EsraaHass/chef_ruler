import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class BuildIntroTexts extends StatelessWidget {
  const BuildIntroTexts({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size.height;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Center(
          child: Image.asset(
            'asset/logo.png',
            width: 180,
            height: 180,
            alignment: Alignment.center,
            fit: BoxFit.fitHeight,
          ),
        ),
        SizedBox(
          height: size * 0.06,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Image.asset(
              'asset/hey.jpg',
              height: 30,
              width: 30,
            ),
            const SizedBox(
              width: 10,
            ),
            Text(
              'أهلا بك',
              style: GoogleFonts.poppins(
                fontSize: 23,
                fontWeight: FontWeight.w900,
                letterSpacing: 0.15,
              ),
            ),
          ],
        ),
        Text(
          'في شيف رولر لخدمات الطعام',
          style: GoogleFonts.poppins(
            fontSize: 23,
            fontWeight: FontWeight.w900,
            letterSpacing: 0.15,
          ),
        ),
        const SizedBox(
          height: 14,
        ),
        Text(
          'يرجي ادخال رقم الهاتف الخاص بك',
          style: GoogleFonts.atma(
              fontSize: 19,
              fontWeight: FontWeight.w200,
              letterSpacing: 0.15,
              color: Colors.grey),
        ),
      ],
    );
  }
}
