import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Rules extends StatelessWidget {
  const Rules({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        elevation: 0,
        title: Text(
          'الشروط والأحكام',
          style: GoogleFonts.poppins(
            fontSize: 20,
            color: Colors.black,
            fontWeight: FontWeight.w700,
            letterSpacing: 0.15,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              CupertinoIcons.forward,
              size: 30,
              color: Colors.black,
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: SizedBox(
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    'الشروط والأحكام',
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        color: Colors.grey.shade700,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: size * 0.02,
                  ),
                  Text(
                    ' ."Chef Ruler مرحبا بكم في تطبيق "شيف رولر',
                    style: Theme.of(context)
                        .textTheme
                        .bodyLarge
                        ?.copyWith(color: Colors.grey),
                  ),
                  SizedBox(
                    height: size * 0.02,
                  ),
                  Text(
                    ' تقدم مؤسسه شيف رولر بجمهوريه مصر العربيه، تطبيق "شيف رولر Chef Ruler" الذي يعمل كخدمه إلكترونيه وسيطه تتيح التواصل بين المستخدمين في مجال تقديم خدمات الطعام، فتسمح للعملاء بالتواصل مع مقدمي الخدمات (طباخ البيت ، طباخ الحفله) وطلب خدماتهم أونلاين من خلال التطبيق ، وفق الشروط والأحكام الآتيه :',
                    style: Theme.of(context)
                        .textTheme
                        .bodyLarge
                        ?.copyWith(color: Colors.grey),
                    textDirection: TextDirection.rtl,
                  ),
                  SizedBox(
                    height: size * 0.02,
                  ),
                  Text(
                    'اولا : التعريفات',
                    style: Theme.of(context)
                        .textTheme
                        .bodyLarge
                        ?.copyWith(color: Colors.grey),
                    textDirection: TextDirection.rtl,
                  ),
                  SizedBox(
                    height: size * 0.02,
                  ),
                  Text(
                    'ثانيا : النطاق القانوني لخدماتنا',
                    style: Theme.of(context)
                        .textTheme
                        .bodyLarge
                        ?.copyWith(color: Colors.grey),
                    textDirection: TextDirection.rtl,
                  ),
                  SizedBox(
                    height: size * 0.02,
                  ),
                  Text(
                    'ثالثا : الطبيعه القانونيه للأتفاقيه',
                    style: Theme.of(context)
                        .textTheme
                        .bodyLarge
                        ?.copyWith(color: Colors.grey),
                    textDirection: TextDirection.rtl,
                  ),
                  SizedBox(
                    height: size * 0.02,
                  ),
                  Text(
                    'رابعا: توفير الخدمات',
                    style: Theme.of(context)
                        .textTheme
                        .bodyLarge
                        ?.copyWith(color: Colors.grey),
                    textDirection: TextDirection.rtl,
                  ),
                  SizedBox(
                    height: size * 0.02,
                  ),
                  Text(
                    'خامسا : الموافقه والأهليه القانونيه',
                    style: Theme.of(context)
                        .textTheme
                        .bodyLarge
                        ?.copyWith(color: Colors.grey),
                    textDirection: TextDirection.rtl,
                  ),
                  SizedBox(
                    height: size * 0.02,
                  ),
                  Text(
                    'سادسا : التوقيع الرقمي',
                    style: Theme.of(context)
                        .textTheme
                        .bodyLarge
                        ?.copyWith(color: Colors.grey),
                    textDirection: TextDirection.rtl,
                  ),
                  SizedBox(
                    height: size * 0.02,
                  ),
                  Text(
                    'سابعا : شروط استخدام التطبيق',
                    style: Theme.of(context)
                        .textTheme
                        .bodyLarge
                        ?.copyWith(color: Colors.grey),
                    textDirection: TextDirection.rtl,
                  ),
                  SizedBox(
                    height: size * 0.02,
                  ),
                  Text(
                    'ثامنا : شروط وأحكام العملاء',
                    style: Theme.of(context)
                        .textTheme
                        .bodyLarge
                        ?.copyWith(color: Colors.grey),
                    textDirection: TextDirection.rtl,
                  ),
                  SizedBox(
                    height: size * 0.02,
                  ),
                  Text(
                    'تاسعا : شروط وأحكام طباخ البيت / طباخ الحفله / ( مزود خدمه الطعام )',
                    style: Theme.of(context)
                        .textTheme
                        .bodyLarge
                        ?.copyWith(color: Colors.grey),
                    textDirection: TextDirection.rtl,
                  ),
                  SizedBox(
                    height: size * 0.02,
                  ),
                  Text(
                    'عاشرا : سياسه حجز وإلغاء الطعام',
                    style: Theme.of(context)
                        .textTheme
                        .bodyLarge
                        ?.copyWith(color: Colors.grey),
                    textDirection: TextDirection.rtl,
                  ),
                  SizedBox(
                    height: size * 0.02,
                  ),
                  Text(
                    'حادي عشر : سياسه تسليم الطلبات',
                    style: Theme.of(context)
                        .textTheme
                        .bodyLarge
                        ?.copyWith(color: Colors.grey),
                    textDirection: TextDirection.rtl,
                  ),
                  SizedBox(
                    height: size * 0.02,
                  ),
                  Text(
                    'ثاني عشر : سياسه الدفع',
                    style: Theme.of(context)
                        .textTheme
                        .bodyLarge
                        ?.copyWith(color: Colors.grey),
                    textDirection: TextDirection.rtl,
                  ),
                  SizedBox(
                    height: size * 0.02,
                  ),
                  Text(
                    'ثالث عشر : سياسه الشكاوي والإسترجاع',
                    style: Theme.of(context)
                        .textTheme
                        .bodyLarge
                        ?.copyWith(color: Colors.grey),
                    textDirection: TextDirection.rtl,
                  ),
                  SizedBox(
                    height: size * 0.02,
                  ),
                  Text(
                    'رابع عشر : شروط وأحكام التقييمات',
                    style: Theme.of(context)
                        .textTheme
                        .bodyLarge
                        ?.copyWith(color: Colors.grey),
                    textDirection: TextDirection.rtl,
                  ),
                  SizedBox(
                    height: size * 0.02,
                  ),
                  Text(
                    'خامس عشر : حقوق التأليف والنشر',
                    style: Theme.of(context)
                        .textTheme
                        .bodyLarge
                        ?.copyWith(color: Colors.grey),
                    textDirection: TextDirection.rtl,
                  ),
                  SizedBox(
                    height: size * 0.02,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
