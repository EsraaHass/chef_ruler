import 'package:chef_ruler/chef/BottomNaveBar.dart';
import 'package:chef_ruler/chef/authentication/view/password_page.dart';
import 'package:chef_ruler/chef/authentication/view/personal_details.dart';
import 'package:chef_ruler/chef/authentication/view/sign_up_user.dart';
import 'package:chef_ruler/chef/main/views/home.dart';
import 'package:chef_ruler/chef/main/views/more_show_products.dart';
import 'package:chef_ruler/chef/main/views/select_product.dart';
import 'package:chef_ruler/chef/onBoarding_screen/onboarding.dart';
import 'package:chef_ruler/core/utils/contant/const.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'chef/authentication/view/otp_screen.dart';
import 'chef/authentication/view/rules.dart';
import 'chef/authentication/view_model/auth_cubit.dart';

class AppRouter {
  PhoneAuthCubit? phoneAuthCubit;

  AppRouter() {
    phoneAuthCubit = PhoneAuthCubit();
  }

  Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case signUp:
        return MaterialPageRoute(
          builder: (_) => BlocProvider<PhoneAuthCubit>.value(
            value: phoneAuthCubit!,
            child: SignUp(),
          ),
        );
      case mainScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider<PhoneAuthCubit>.value(
            value: phoneAuthCubit!,
            child: const MainPage(),
          ),
        );
      case more_products:
        return MaterialPageRoute(builder: (_) => const MoreShowProducts());

      case paswordScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider<PhoneAuthCubit>.value(
            value: phoneAuthCubit!,
            child: PasswordPage(),
          ),
        );
      case conditionAndRules:
        return MaterialPageRoute(
          builder: (_) => BlocProvider<PhoneAuthCubit>.value(
            value: phoneAuthCubit!,
            child: Rules(),
          ),
        );
      case onboardingScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider<PhoneAuthCubit>.value(
            value: phoneAuthCubit!,
            child: OnBoardingPage(),
          ),
        );

      case otpScreen:
        final phoneNumber = settings.arguments;
        return MaterialPageRoute(
          builder: (_) => BlocProvider<PhoneAuthCubit>.value(
            value: phoneAuthCubit!,
            child: OtpScreen(phoneNumber: phoneNumber),
          ),
        );

      case personalScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider<PhoneAuthCubit>.value(
            value: phoneAuthCubit!,
            child: PersonalDetails(),
          ),
        );
      case navigate_bar:
        return MaterialPageRoute(builder: (_) => BottomNaveBar());
      case select_product:
        return MaterialPageRoute(builder: (_) => SelsctProduct());
    }
  }
}
