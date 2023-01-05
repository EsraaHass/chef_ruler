import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Text(
              'Main Page',
              style: GoogleFonts.poppins(
                fontSize: 23,
                fontWeight: FontWeight.w900,
                letterSpacing: 0.15,
              ),
            ),
          )
        ],
      ),
    );
  }
}
