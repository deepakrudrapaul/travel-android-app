import 'dart:async';
import 'package:rxdart/rxdart.dart';
import 'package:wanderwagon/ui/auth/bloc/validators.dart';

class AuthBloc extends Object with Validators {

  final _phoneController = BehaviorSubject<String>();
  final _passwordController = BehaviorSubject<String>();
  final _confirmPasswordController = BehaviorSubject<String>();
  final _otpController = BehaviorSubject<String>();

  // retrieve data from stream
  Stream<String> get phone => _phoneController.stream.transform(validatePhone);
  Stream<String> get password => _passwordController.stream.transform(validatePassword);
  Stream<String> get confirmPassword => _confirmPasswordController.stream.transform(validateConfirmPassword);
  Stream<String> get otp => _otpController.stream;
  Stream<bool> get submitValid => Observable.combineLatest2(phone, password, (ph, p) => true);


  // add data to stream
 Function(String) get changePhone => _phoneController.sink.add;
 Function(String) get changePassword => _passwordController.sink.add;
 Function(String) get changeConfirmPassword => _confirmPasswordController.sink.add;
 Function(String) get changeOtp => _otpController.sink.add;


 submit() {
   final validPhone = _phoneController.value;
   final validPassword = _passwordController.value;
   print('submit clicked');
   print('$validPhone and $validPassword');
 }


 resetPassword() {
   print('Password reset done !');
 }

 dispose() {
   _phoneController.close();
   _passwordController.close();
   _confirmPasswordController.close();
   _otpController.close();
 }

}