import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:live_easy_assignment/SelectProfileScreen.dart';
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
        border: Border.all(color: Color(0xFF93D2F3)),
        borderRadius: BorderRadius.circular(0),
      ),
    );

    //outer square box outline - selected
    // final focusedPinTheme = defaultPinTheme.copyDecorationWith(
    //   border: Border.all(color:  Color(0xFF93D2F3)),
    //   borderRadius: BorderRadius.circular(0),
    // );

    final focusedPinTheme = defaultPinTheme.copyWith(
      decoration: defaultPinTheme.decoration?.copyWith(
        color: Color(0xFF93D2F3),
      ),
    );

    //box inside color
    final submittedPinTheme = defaultPinTheme.copyWith(
      decoration: defaultPinTheme.decoration?.copyWith(
        color: Color(0xFF93D2F3),
      ),
    );

    final followingPinTheme = defaultPinTheme.copyWith(
      decoration: defaultPinTheme.decoration?.copyWith(
        color: Color(0xFF93D2F3),
      ),
    );

    final errorPinTheme = defaultPinTheme.copyWith(
      decoration: defaultPinTheme.decoration?.copyWith(
        color: Color(0xFF93D2F3),
      ),
    );

    var mySMSCode = '';

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
                  "Verify Phone",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 11.23),
                Text.rich(
                  TextSpan(
                    text: 'Code is sent to $mobileNumber',
                    style:
                        const TextStyle(fontSize: 14, color: Color(0xff6a6c7b)),
                  ),
                  textAlign: TextAlign.center,
                ),

                // Padding(
                //   padding: const EdgeInsets.only(left: 16, right: 16, top: 32, bottom: 24),
                //   child: IntlPhoneField(
                //     showDropdownIcon: false,
                //     disableLengthCheck: true,
                //     decoration: const InputDecoration(
                //       labelText: '\t-\t\tMobile Number',
                //       border: OutlineInputBorder(
                //         borderSide: BorderSide(),
                //       ),
                //     ),
                //     initialCountryCode: 'IN',
                //     onChanged: (phone) {
                //       print(phone.completeNumber);
                //     },
                //   ),
                // ),

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
                    style: TextStyle(fontSize: 14, color: Color(0xff6a6c7b)),
                    children: <TextSpan>[
                      TextSpan(
                        text: '\tRequest Again',
                        style: TextStyle(
                            fontSize: 14,
                            color: Color(0xff6a6c7b),
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  textAlign: TextAlign.center,
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 24.25),
                  child: FractionallySizedBox(
                    widthFactor: 1.0,
                    child: ElevatedButton(
                        onPressed: () async {
                          try{
                             // Create a PhoneAuthCredential with the code
                          PhoneAuthCredential credential =
                              PhoneAuthProvider.credential(
                                  verificationId: verifyId, smsCode: mySMSCode);
                          
                          // Sign the user in (or link) with the credential
                          await auth.signInWithCredential(credential);
                           
                           // ignore: use_build_context_synchronously
                           Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => SelectProfileScreen(),
                                ),
                              );
                          }catch(e){
                              print("wrong otp");
                          }
                         
                        },
                        style: ButtonStyle(
                          minimumSize: MaterialStatePropertyAll(
                              Size(double.infinity, 48)),
                          backgroundColor:
                              MaterialStatePropertyAll(Color(0xff2E3B62)),
                          shape: MaterialStatePropertyAll(
                            RoundedRectangleBorder(
                                borderRadius: BorderRadius.zero),
                          ),
                        ),
                        child: Padding(
                          padding: EdgeInsets.all(18.0),
                          child: Text(
                            "VERIFY AND CONTINUE",
                            style: TextStyle(color: Colors.white, fontSize: 18),
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
