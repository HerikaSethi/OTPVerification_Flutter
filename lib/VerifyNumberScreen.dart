import 'package:flutter/material.dart';

class VerifyNumberScreen extends StatelessWidget {
  final String mobileNumber;

  const VerifyNumberScreen({super.key, required this.mobileNumber});

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
                    style: const TextStyle(fontSize: 14, color: Color(0xff6a6c7b)),
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

                   const Text.rich(
                  TextSpan(
                    text: 'Didnot receive the code?',
                    style: TextStyle(fontSize: 14, color: Color(0xff6a6c7b)),
                    children: <TextSpan>[
                      TextSpan(
                        text: ' Request Again',
                        style:
                            TextStyle(fontSize: 14, color: Color(0xff6a6c7b), fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  textAlign: TextAlign.center,
                ),
                const Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 16, vertical: 24.25),
                  child: FractionallySizedBox(
                    widthFactor: 1.0,
                    child: ElevatedButton(
                        onPressed: (null),
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