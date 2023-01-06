import 'package:bloc/bloc.dart';
import 'package:chef_ruler/chef/authentication/view_model/auth_state.dart';
import 'package:firebase_auth/firebase_auth.dart';

class PhoneAuthCubit extends Cubit<PhoneAuthState> {
  late String verificationId;
  final auth = FirebaseAuth.instance;

  PhoneAuthCubit() : super(AuthenticateInitial());

  Future<void> submitPhoneNumber(String phoneNumber) async {
    emit(Loading());

    await auth.verifyPhoneNumber(
      phoneNumber: '+20$phoneNumber',
      timeout: const Duration(seconds: 14),
      verificationCompleted: verificationCompleted,
      verificationFailed: verificationFailed,
      codeSent: codeSent,
      codeAutoRetrievalTimeout: codeAutoRetrievalTimeout,
    );
  }

  void verificationCompleted(PhoneAuthCredential credential) async {
    print('verificationCompleted');
    await signIn(credential);
  }

  void verificationFailed(FirebaseAuthException error) {
    print('verificationFailed ${error.toString()}');
    emit(ErrorOcure('حدث خطأ يرجي المحاوله لاحقا'));
  }

  codeSent(String verificationId, int? resendingToken) {
    print('codeSent successfully');
    this.verificationId = verificationId;
    emit(PhoneNumberSubmitted());
  }

  void codeAutoRetrievalTimeout(String verificationId) {
    print('codeAutoRetrievalTimeout');
  }

  Future<void> submitOtp(String otpCode) async {
    PhoneAuthCredential credential = PhoneAuthProvider.credential(
        verificationId: this.verificationId, smsCode: otpCode);

    await signIn(credential);
  }
  Future<void> signIn(PhoneAuthCredential credential) async {
    try {
      await auth.signInWithCredential(credential);
      emit(PhoneOtpVerified());
    } catch (error) {
      emit(ErrorOcure('لقد حاولت الدخول من نفس الرقم عده مرات'));
    }
  }

  Future<void> logOut() async => await auth.signOut();

  User getLoggedInUser() => auth.currentUser!;
}
