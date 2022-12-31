abstract class PhoneAuthState {}

class AuthenticateInitial extends PhoneAuthState {}

class Loading extends PhoneAuthState {}

class ErrorOcure extends PhoneAuthState {
  final String errorMessage;

  ErrorOcure(this.errorMessage);
}

class PhoneNumberSubmitted extends PhoneAuthState {}

class PhoneOtpVerified extends PhoneAuthState {}
