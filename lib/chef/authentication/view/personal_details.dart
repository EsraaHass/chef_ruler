import 'dart:io';

import 'package:chef_ruler/chef/authentication/repository/auth_repository.dart';
import 'package:chef_ruler/chef/authentication/view_model/auth_view_model.dart';
import 'package:chef_ruler/chef/authentication/view_model/base/base.dart';
import 'package:chef_ruler/core/utils/contant/checkEmailValid.dart';
import 'package:chef_ruler/core/utils/contant/const.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

class PersonalDetails extends StatefulWidget {
  PersonalDetails({Key? key}) : super(key: key);

  @override
  State<PersonalDetails> createState() => _PersonalDetailsState();
}

class _PersonalDetailsState extends BaseState<PersonalDetails, AuthViewModel>
    implements AuthNavigator {
  final GlobalKey<FormState> _formKey = GlobalKey();

  late String name;

  late String city;

  late String email;

  bool isMale = true;

  File? pickedImage;
  final ImagePicker _picker = ImagePicker();
  final _storage = FirebaseStorage.instance;
  String imgUrl = '';

  FocusNode nameFocusNode = FocusNode();

  FocusNode cityFocusNode = FocusNode();

  FocusNode emailFocusNode = FocusNode();

  TextEditingController nameController = TextEditingController();

  TextEditingController cityController = TextEditingController();

  TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size.height;
    return ChangeNotifierProvider(
      create: (_) => viewModel,
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: SizedBox(
            width: double.infinity,
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Form(
                key: _formKey,
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          SizedBox(
                            height: size * 0.02,
                          ),
                          Icon(CupertinoIcons.forward),
                          SizedBox(
                            height: size * 0.05,
                          ),
                          Text(
                            'البيانات الشخصيه',
                            style: GoogleFonts.poppins(
                              fontSize: 23,
                              fontWeight: FontWeight.w900,
                              letterSpacing: 0.15,
                            ),
                          ),
                          SizedBox(
                            height: size * 0.02,
                          ),
                          Text(
                            'قم بادخال بياناتك الشخصيه وبريدك الالكتروني',
                            style: GoogleFonts.poppins(
                                fontSize: 18,
                                letterSpacing: 0.15,
                                color: Colors.grey),
                          ),
                          SizedBox(
                            height: size * 0.02,
                          ),
                          Stack(
                            children: [
                              CircleAvatar(
                                backgroundImage: pickedImage == null
                                    ? null
                                    : FileImage(pickedImage!),
                                radius: 70,
                              ),
                              Positioned(
                                  bottom: 0,
                                  right: 0,
                                  child: IconButton(
                                      onPressed: pickImage,
                                      icon: Icon(
                                        Icons.camera_alt_outlined,
                                        size: 40,
                                        color: Colors.redAccent,
                                      )))
                            ],
                          ),
                          SizedBox(
                            height: size * 0.02,
                          ),
                          Directionality(
                            textDirection: TextDirection.rtl,
                            child: TextFormField(
                              focusNode: nameFocusNode,
                              controller: nameController,
                              autofocus: true,
                              textAlign: TextAlign.right,
                              style: const TextStyle(
                                fontSize: 18,
                                letterSpacing: 2.0,
                              ),
                              decoration: InputDecoration(
                                labelText: 'الاسم بالكامل',
                                labelStyle: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 19,
                                    color: nameFocusNode.hasFocus
                                        ? Colors.redAccent
                                        : Colors.black54),
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
                                return null;
                              },
                              onSaved: (value) {
                                name = value!;
                              },
                            ),
                          ),
                          SizedBox(
                            height: size * 0.02,
                          ),
                          Directionality(
                            textDirection: TextDirection.rtl,
                            child: TextFormField(
                              focusNode: cityFocusNode,
                              controller: cityController,
                              autofocus: true,
                              textAlign: TextAlign.right,
                              style: const TextStyle(
                                fontSize: 18,
                                letterSpacing: 2.0,
                              ),
                              decoration: InputDecoration(
                                labelText: 'المدينه',
                                labelStyle: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 19,
                                    color: cityFocusNode.hasFocus
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
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'مطلوب';
                                }
                                return null;
                              },
                              onSaved: (value) {
                                city = value!;
                              },
                            ),
                          ),
                          SizedBox(
                            height: size * 0.02,
                          ),
                          Directionality(
                            textDirection: TextDirection.rtl,
                            child: TextFormField(
                              focusNode: emailFocusNode,
                              controller: emailController,
                              autofocus: true,
                              textAlign: TextAlign.right,
                              style: const TextStyle(
                                fontSize: 18,
                                letterSpacing: 2.0,
                              ),
                              decoration: InputDecoration(
                                labelText: 'البريد الالكتروني',
                                labelStyle: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 19,
                                    color: emailFocusNode.hasFocus
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
                              validator: (value) {
                                if (value == null || value.trim().isEmpty) {
                                  return 'مطلوب';
                                }
                                if (!Validation.isValidateEmail(value)) {
                                  return 'برجاء ادخال ايميل صالح';
                                }
                                return null;
                              },
                              onSaved: (value) {
                                email = value!;
                              },
                            ),
                          ),
                          SizedBox(
                            height: size * 0.03,
                          ),
                          Text(
                            'النوع',
                            style: GoogleFonts.poppins(
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                              letterSpacing: 0.15,
                            ),
                          ),
                          SizedBox(
                            height: size * 0.03,
                          ),
                          Directionality(
                            textDirection: TextDirection.rtl,
                            child: Row(
                              children: [
                                InkWell(
                                  onTap: () {
                                    setState(() {
                                      isMale = true;
                                    });
                                  },
                                  child: Container(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 8, horizontal: 16),
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(5),
                                        border: Border.all(
                                            color: isMale
                                                ? Colors.redAccent
                                                : Colors.grey)),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Image.network(
                                          'https://cdn1.vectorstock.com/i/1000x1000/77/10/men-faceless-profile-vector-13567710.jpg',
                                          width: 30,
                                          height: 30,
                                        ),
                                        const SizedBox(
                                          width: 5,
                                        ),
                                        const Text('ذكر')
                                      ],
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  width: 16,
                                ),
                                InkWell(
                                  onTap: () {
                                    setState(() {
                                      isMale = false;
                                    });
                                  },
                                  child: Container(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 8, horizontal: 16),
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(5),
                                        border: Border.all(
                                            color: !isMale
                                                ? Colors.redAccent
                                                : Colors.grey)),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Image.network(
                                          'https://tse2.mm.bing.net/th?id=OIP.PDYcGdkYLGK7JNULCKd9jgHaHa&pid=Api&P=0',
                                          width: 30,
                                          height: 30,
                                        ),
                                        const SizedBox(
                                          width: 5,
                                        ),
                                        const Text('أنثي')
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: size * 0.03,
                          ),
                        ],
                      ),
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: SizedBox(
                          width: double.infinity,
                          height: 55,
                          child: ElevatedButton(
                            onPressed: _register,
                            style: ElevatedButton.styleFrom(
                              primary: Colors.red,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5.0),
                              ),
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
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _register() async {
    if (_formKey.currentState!.validate() == false) return null;
    viewModel.creatAccount(emailController.text, cityController.text,
        nameController.text, '', imgUrl);
  }

  @override
  void goToHome() {
    Navigator.pushNamed(context, paswordScreen);
  }

  @override
  AuthViewModel initViewModel() {
    return AuthViewModel(baseAuthRepository: AuthRepository());
  }

  void pickImage() async {
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);

    if (image == null) return;
    setState(() {
      pickedImage = File(image.path);
    });
    var storageImage = _storage.ref().child(pickedImage!.path);
    var task = storageImage.putFile(pickedImage!);
    imgUrl = await (await task).ref.getDownloadURL();
  }
}
