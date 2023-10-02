

import 'package:flutter/material.dart';
import 'package:live_easy_assignment/LanguageDropdown.dart';
import 'package:live_easy_assignment/MobileNumber.dart';
import 'package:live_easy_assignment/constants/AppColor.dart';

class SelectLanguageScreen extends StatelessWidget {
  const SelectLanguageScreen({super.key, required String title});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 42),
                const Image(image: AssetImage('assets/images/ic_image.png')),
                const SizedBox(height: 42),
                const Text(
                  "Please select your Language",
                  style: TextStyle(
                      color: AppColor.black,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 11.23),
                const Text.rich(
                  TextSpan(
                    text: 'You can change the language\n',
                    style: TextStyle(fontSize: 14, color: AppColor.lightgrey),
                    children: <TextSpan>[
                      TextSpan(
                        text: 'at any time.',
                        style: TextStyle(fontSize: 14, color: AppColor.lightgrey),
                      ),
                    ],
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 24.51),
                // Include the dropdown here
                LanguageDropdown(
                  onLanguageChanged: (String selectedLanguage) {
                    // Handle the language change here
                    print('Selected Language: $selectedLanguage');
                    // Update the app's language or perform other actions as needed
                  },
                ),
               Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 72, vertical: 24.25),
                  child: FractionallySizedBox(
                    widthFactor: 1.0,
                    child: ElevatedButton(
                        onPressed: () {
                           onClickNext(context);
                        },
                        style: const ButtonStyle(
                          minimumSize:
                              MaterialStatePropertyAll(Size(double.infinity, 48)),
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
                            "NEXT",
                            style: TextStyle(color: AppColor.white, fontSize: 18),
                          ),
                        )),
                  ),
                ),
    
                Expanded(
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                      // color: Colors.amber,
                      // Define the desired height
                      child: Stack(
                        alignment: Alignment.bottomCenter,
                        children: [
                           Positioned(
                            bottom: 0,
                            child: Image.asset(
                                'assets/images/ic_dark_blue.png',
                                 width: MediaQuery.of(context).size.width),
                          ),
                           // First overlapping image
                          // Positioned(
                          //   bottom: 0,
                          //   child: Image.asset(
                          //       'assets/images/ic_transparent_blue_overlap.png',
                          //        width: MediaQuery.of(context).size.width),
                          // ),
                          // // Second overlapping image
                          // Positioned(
                          //   bottom: 0,
                          //   left: 0,
                          //   right: 0,
                          //   child: Image.asset(
                          //       'assets/images/ic_light_blue_overlap.png',
                          //        width: MediaQuery.of(context).size.width),      
                          // ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
  
  void onClickNext(BuildContext context) {
    Navigator.push(context ,MaterialPageRoute(builder: (context) => const MobileNumberScreen()));
  }
}
