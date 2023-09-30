import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:live_easy_assignment/VerifyNumberScreen.dart';

class MobileNumberScreen extends StatefulWidget {
  const MobileNumberScreen({super.key});

  @override
  State<MobileNumberScreen> createState() => _MobileNumberScreenState();
}

class _MobileNumberScreenState extends State<MobileNumberScreen> {
  String mobileNum = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: EdgeInsets.only(top: 8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 80),
                const Text(
                  "Please enter your mobile number",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 11.23),
                const Text.rich(
                  TextSpan(
                    text: 'You’ll receive a 4 digit code\n',
                    style: TextStyle(fontSize: 14, color: Color(0xff6a6c7b)),
                    children: <TextSpan>[
                      TextSpan(
                        text: 'to verify next.',
                        style:
                            TextStyle(fontSize: 14, color: Color(0xff6a6c7b)),
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
                    },
                  ),
                ),
                Padding(
                  padding:
                  const EdgeInsets.symmetric(horizontal: 16, vertical: 24.25),
                  child: FractionallySizedBox(
                    widthFactor: 1.0,
                    child: ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  VerifyNumberScreen(mobileNumber: mobileNum),
                            ),
                          );
                        },
                        style: const ButtonStyle(
                          minimumSize: MaterialStatePropertyAll(
                              Size(double.infinity, 48)),
                          backgroundColor:
                              MaterialStatePropertyAll(Color(0xff2E3B62)),
                          shape: MaterialStatePropertyAll(
                            RoundedRectangleBorder(
                                borderRadius: BorderRadius.zero),
                          ),
                        ),
                        child: const Padding(
                          padding: EdgeInsets.all(18.0),
                          child: Text(
                            "CONTINUE",
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
