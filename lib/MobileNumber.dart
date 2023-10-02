import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:live_easy_assignment/VerifyNumberScreen.dart';
import 'package:live_easy_assignment/constants/AppColor.dart';

class MobileNumberScreen extends StatefulWidget {
  const MobileNumberScreen({super.key});
  
  @override
  State<MobileNumberScreen> createState() => _MobileNumberScreenState();
}

class _MobileNumberScreenState extends State<MobileNumberScreen> {
  String mobileNum = '';
  String completeNum = '';
  String verificationId = '';
  String smsCode = '';
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                  "Please enter your mobile number",
                  style: TextStyle(
                      color: AppColor.black,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 11.23),
                const Text.rich(
                  TextSpan(
                    text: 'You’ll receive a 4 digit code\n',
                    style: TextStyle(fontSize: 14, color: AppColor.lightgrey),
                    children: <TextSpan>[
                      TextSpan(
                        text: 'to verify next.',
                        style:
                            TextStyle(fontSize: 14, color: AppColor.lightgrey),
                      ),
                    ],
                  ),
                  textAlign: TextAlign.center,
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      left: 16, right: 16, top: 32, bottom: 24),
                  child: IntlPhoneField(
                    showDropdownIcon: false,
                    disableLengthCheck: true,
                    decoration: const InputDecoration(
                      labelText: '\t-\t\tMobile Number',
                      border: OutlineInputBorder(
                        borderSide: BorderSide(),
                      ),
                    ),
                    initialCountryCode: 'IN',
                    onChanged: (phone) {
                      print(phone.completeNumber);
                      mobileNum = phone.number;
                      completeNum = phone.completeNumber;
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 16, vertical: 24.25),
                  child: FractionallySizedBox(
                    widthFactor: 1.0,
                    child: ElevatedButton(
                        onPressed: () async {
                          await FirebaseAuth.instance.verifyPhoneNumber(
                            phoneNumber: completeNum,
                            verificationCompleted:
                                (PhoneAuthCredential credential) {},
                            verificationFailed: (FirebaseAuthException e) {},
                            codeSent:
                                (String verificationId, int? resendToken) {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => VerifyNumberScreen(
                                      mobileNumber: mobileNum, verifyId : verificationId),
                                ),
                              );
                            },
                            codeAutoRetrievalTimeout:
                                (String verificationId) {},
                          );
                        },
                        style: const ButtonStyle(
                          minimumSize: MaterialStatePropertyAll(
                              Size(double.infinity, 48)),
                          backgroundColor:
                              MaterialStatePropertyAll(AppColor.activeButtonBlue),
                          shape: MaterialStatePropertyAll(
                            RoundedRectangleBorder(
                                borderRadius: BorderRadius.zero),
                          ),
                        ),
                        child: const Padding(
                          padding: EdgeInsets.all(18.0),
                          child: Text(
                            "CONTINUE",
                            style: TextStyle(color: AppColor.white, fontSize: 16,letterSpacing: 0.48, fontWeight: FontWeight.w700),
                          ),
                        )),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
