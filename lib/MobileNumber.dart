import 'package:flutter/material.dart';

class MyWidget extends StatelessWidget {
  const MyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: SingleChildScrollView(
      child: Scaffold(
        appBar: AppBar(),
        body: SingleChildScrollView(
          child: Center(
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
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 11.23),
                  const Text.rich(
                    TextSpan(
                      text: 'You can change the language\n',
                      style: TextStyle(fontSize: 14, color: Color(0xff6a6c7b)),
                      children: <TextSpan>[
                        TextSpan(
                          text: 'at any time',
                          style:
                              TextStyle(fontSize: 14, color: Color(0xff6a6c7b)),
                        ),
                      ],
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 24.51),
                  // Include the dropdown here
                  // LanguageDropdown(
                  //   onLanguageChanged: (String selectedLanguage) {
                  //     // Handle the language change here
                  //     print('Selected Language: $selectedLanguage');
                  //     // Update the app's language or perform other actions as needed
                  //   },
                  // ),
                  const Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 72, vertical: 24.25),
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
                              "NEXT",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 18),
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
                            // First overlapping image
                            FittedBox(
                              fit: BoxFit.cover,
                              child: Positioned(
                                bottom: 0,
                                child: Image.asset(
                                    'assets/images/ic_transparent_blue_overlap.png'),
                              ),
                            ),
                            // Second overlapping image
                            FittedBox(
                              fit: BoxFit.contain,
                              child: Positioned(
                                bottom: 0,
                                left: 0,
                                right: 0,
                                child: Image.asset(
                                    'assets/images/ic_light_blue_overlap.png'),
                              ),
                            ),
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
      ),
    ));
  }
}
