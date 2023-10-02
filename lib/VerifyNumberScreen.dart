import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:live_easy_assignment/SelectProfileScreen.dart';
import 'package:live_easy_assignment/constants/AppColor.dart';
import 'package:pinput/pinput.dart';

class VerifyNumberScreen extends StatelessWidget {
  final String mobileNumber;
  final String verifyId;

  VerifyNumberScreen(
      {super.key, required this.mobileNumber, required this.verifyId});

  final FirebaseAuth auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    // Pinput

    //outer square box outline - not selected
    final defaultPinTheme = PinTheme(
      width: 56,
      height: 56,
      textStyle: const TextStyle(
          fontSize: 20,
          color: Color.fromRGBO(30, 60, 87, 1),
          fontWeight: FontWeight.w600),
      decoration: BoxDecoration(
        border: Border.all(color: AppColor.pinBlue),
        borderRadius: BorderRadius.circular(0),
      ),
    );

    final focusedPinTheme = defaultPinTheme.copyWith(
      decoration: defaultPinTheme.decoration?.copyWith(
        color: AppColor.pinBlue,
      ),
    );

    //box inside color
    final submittedPinTheme = defaultPinTheme.copyWith(
      decoration: defaultPinTheme.decoration?.copyWith(
        color: AppColor.pinBlue,
      ),
    );

    final followingPinTheme = defaultPinTheme.copyWith(
      decoration: defaultPinTheme.decoration?.copyWith(
        color: AppColor.pinBlue,
      ),
    );

    final errorPinTheme = defaultPinTheme.copyWith(
      decoration: defaultPinTheme.decoration?.copyWith(
        color: AppColor.pinBlue,
      ),
    );

    var mySMSCode = '';

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(),
        body: SingleChildScrollView(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(height: 80),
                  const Text(
                    "Verify Phone",
                    style: TextStyle(
                        color: AppColor.black,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 11.23),
                  Text.rich(
                    TextSpan(
                      text: 'Code is sent to $mobileNumber',
                      style: const TextStyle(
                          fontSize: 14, color: AppColor.lightgrey),
                    ),
                    textAlign: TextAlign.center,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 11, right: 19, top: 24, bottom: 16),
                    child: Pinput(
                      defaultPinTheme: defaultPinTheme,
                      focusedPinTheme: focusedPinTheme,
                      submittedPinTheme: submittedPinTheme,
                      followingPinTheme: followingPinTheme,
                      errorPinTheme: errorPinTheme,
                      length: 6,
                      onChanged: (value) {
                        mySMSCode = value;
                      },
                      // validator: (s) {
                      //   return s == '222277' ? null : 'Pin is incorrect';
                      // },
                      pinputAutovalidateMode: PinputAutovalidateMode.onSubmit,
                      showCursor: true,
                      onCompleted: (pin) => print(pin),
                    ),
                  ),
                  const Text.rich(
                    TextSpan(
                      text: 'Didnot receive the code?',
                      style: TextStyle(fontSize: 14, color: AppColor.lightgrey),
                      children: <TextSpan>[
                        TextSpan(
                          text: '\tRequest Again',
                          style: TextStyle(
                              fontSize: 14,
                              color: AppColor.lightgrey,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    textAlign: TextAlign.center,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16, vertical: 24.25),
                    child: FractionallySizedBox(
                      widthFactor: 1.0,
                      child: ElevatedButton(
                          onPressed: () async {
                            try {
                              // Create a PhoneAuthCredential with the code
                              PhoneAuthCredential credential =
                                  PhoneAuthProvider.credential(
                                      verificationId: verifyId,
                                      smsCode: mySMSCode);

                              // Sign the user in (or link) with the credential
                              await auth.signInWithCredential(credential);

                              // Navigating to the next screen and clear the previous stack
                              // ignore: use_build_context_synchronously
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      const SelectProfileScreen(), 
                                ),
                              );
                            } catch (e) {
                              print("Wrong otp");
                            }
                          },
                          style: const ButtonStyle(
                            minimumSize: MaterialStatePropertyAll(
                                Size(double.infinity, 48)),
                            backgroundColor: MaterialStatePropertyAll(
                                AppColor.activeButtonBlue),
                            shape: MaterialStatePropertyAll(
                              RoundedRectangleBorder(
                                  borderRadius: BorderRadius.zero),
                            ),
                          ),
                          child: const Padding(
                            padding: EdgeInsets.all(18.0),
                            child: Text(
                              "VERIFY AND CONTINUE",
                              style: TextStyle(
                                  color: AppColor.white, fontSize: 18),
                            ),
                          )),
                    ),
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
