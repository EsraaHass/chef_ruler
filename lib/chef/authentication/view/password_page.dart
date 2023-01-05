import 'package:chef_ruler/core/utils/contant/const.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PasswordPage extends StatefulWidget {
  const PasswordPage({Key? key}) : super(key: key);

  @override
  State<PasswordPage> createState() => _PasswordPageState();
}

class _PasswordPageState extends State<PasswordPage> {
  bool passwordIcon = true;
  bool confirmPasswordIcon = true;
  FocusNode passwordFocusNode = FocusNode();
  FocusNode confirmpasswordFocusNode = FocusNode();
  final GlobalKey<FormState> _formKey = GlobalKey();
  TextEditingController pass = TextEditingController();
  TextEditingController confirmpass = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: SizedBox(
          width: double.infinity,
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      SizedBox(
                        height: size * 0.02,
                      ),
                      const Icon(CupertinoIcons.forward),
                      SizedBox(
                        height: size * 0.02,
                      ),
                      Text(
                        'كلمه المرور',
                        style: GoogleFonts.poppins(
                          fontSize: 23,
                          fontWeight: FontWeight.w700,
                          letterSpacing: 0.15,
                        ),
                      ),
                      SizedBox(
                        height: size * 0.02,
                      ),
                      Text(
                        'يفضل أن تحتوي علي حروف كبيرة وصغيرة وأرقام',
                        style: GoogleFonts.poppins(
                            fontSize: 18,
                            letterSpacing: 0.15,
                            color: Colors.grey.shade700),
                      ),
                      SizedBox(
                        height: size * 0.02,
                      ),
                      Directionality(
                        textDirection: TextDirection.rtl,
                        child: TextFormField(
                          focusNode: passwordFocusNode,
                          controller: pass,
                          autofocus: true,
                          obscureText: passwordIcon,
                          textAlign: TextAlign.right,
                          style: const TextStyle(
                            fontSize: 18,
                            letterSpacing: 2.0,
                          ),
                          decoration: InputDecoration(
                            suffixIcon: InkWell(
                                onTap: () {
                                  setState(() {
                                    passwordIcon = !passwordIcon;
                                  });
                                },
                                child: Icon(
                                  CupertinoIcons.eye_slash,
                                  color: passwordIcon
                                      ? Colors.black
                                      : Colors.redAccent,
                                )),
                            labelText: 'كلمه المرور',
                            labelStyle: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 19,
                                color: passwordFocusNode.hasFocus
                                    ? Colors.redAccent
                                    : Colors.black54),
                            focusedBorder: const OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.grey, width: 1),
                            ),
                            enabledBorder: const OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.grey,
                                width: 1.0,
                              ),
                            ),
                            border: const OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.grey, width: 1),
                            ),
                            focusedErrorBorder: const OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.red, width: 1),
                            ),
                            disabledBorder: const OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.grey, width: 1),
                            ),
                            errorBorder: const OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.red,
                                width: 1.0,
                              ),
                            ),
                          ),
                          cursorColor: Colors.black,
                          keyboardType: TextInputType.name,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'مطلوب';
                            }
                            if (value.length < 8)
                              return 'يجب أن لا تقل كلمه المرور عن 8 أحرف';
                            return null;
                          },
                        ),
                      ),
                      SizedBox(
                        height: size * 0.02,
                      ),
                      Directionality(
                        textDirection: TextDirection.rtl,
                        child: TextFormField(
                            focusNode: confirmpasswordFocusNode,
                            controller: confirmpass,
                            obscureText: confirmPasswordIcon,
                            autofocus: true,
                            textAlign: TextAlign.right,
                            style: const TextStyle(
                              fontSize: 18,
                              letterSpacing: 2.0,
                            ),
                            decoration: InputDecoration(
                              suffixIcon: InkWell(
                                  onTap: () {
                                    setState(() {
                                      confirmPasswordIcon =
                                          !confirmPasswordIcon;
                                    });
                                  },
                                  child: Icon(
                                    CupertinoIcons.eye_slash,
                                    color: confirmPasswordIcon
                                        ? Colors.black
                                        : Colors.redAccent,
                                  )),
                              labelText: 'تأكيد كلمه المرور',
                              labelStyle: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 19,
                                  color: confirmpasswordFocusNode.hasFocus
                                      ? Colors.redAccent
                                      : Colors.black54),
                              focusedBorder: const OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.grey, width: 1),
                              ),
                              border: const OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.grey, width: 1),
                              ),
                              focusedErrorBorder: const OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.red, width: 1),
                              ),
                              disabledBorder: const OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.grey, width: 1),
                              ),
                              enabledBorder: const OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.grey,
                                  width: 1.0,
                                ),
                              ),
                              errorBorder: const OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.red,
                                  width: 1.0,
                                ),
                              ),
                            ),
                            cursorColor: Colors.black,
                            keyboardType: TextInputType.name,
                            validator: (val) {
                              if (val!.isEmpty) return 'مطلوب';
                              if (val != pass.text)
                                return 'كلمه المرور غير متطابقه';

                              if (val.length < 8)
                                return 'يجب أن لا تقل كلمه المرور عن 8 أحرف';
                              return null;
                            }),
                      ),
                    ],
                  ),
                ),
                Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        InkWell(
                          onTap: () {
                            Navigator.pushNamed(context, conditionAndRules);
                          },
                          child: Text(
                            'الشروط والأحكام',
                            style: GoogleFonts.poppins(
                              fontSize: 17,
                              color: Colors.redAccent,
                              fontWeight: FontWeight.w700,
                              letterSpacing: 0.15,
                            ),
                          ),
                        ),
                        Text(
                          'باستمرارك تكون قد وافقت علي ',
                          style: GoogleFonts.poppins(
                            fontSize: 17,
                            color: Colors.grey,
                            fontWeight: FontWeight.w500,
                            letterSpacing: 0.15,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: size * 0.01,
                    ),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: SizedBox(
                        width: double.infinity,
                        height: 55,
                        child: ElevatedButton(
                          onPressed: confirm,
                          style: ElevatedButton.styleFrom(
                            primary: Colors.red,
                          ),
                          child: const Text(
                            'تأكيد',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.w600),
                          ),
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  void confirm() {
    if (_formKey.currentState!.validate() == false) return null;

    Navigator.pushNamed(context, mainScreen);
  }
}
