import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:live_easy_assignment/BuildItemWidget.dart';

class SelectProfileScreen extends StatefulWidget {
  const SelectProfileScreen({super.key});

  @override
  State<SelectProfileScreen> createState() => _SelectProfileScreenState();
}

class _SelectProfileScreenState extends State<SelectProfileScreen> {
  int selectedRadio = -1;

  setSelectedRadio(int value) {
    setState(() {
      selectedRadio = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Column(
            children: [
              const SizedBox(
                height: 88.0,
              ),
              const Text(
                "Please select your profile",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 26,
              ),
              BuildItem(
                value: 1,
                image: 'assets/images/ic_shipper.png',
                title: 'Shipper',
                description:
                    'Lorem ipsum dolor sit amet,\nconsectetur adipiscing',
                selectedRadio: selectedRadio,
                setSelectedRadio: setSelectedRadio,
              ),
              const SizedBox(
                height: 24,
              ),
              BuildItem(
                value: 2,
                image: 'assets/images/ic_transporter.png',
                title: 'Transporter',
                description:
                    'Lorem ipsum dolor sit amet,\nconsectetur adipiscing',
                selectedRadio: selectedRadio,
                setSelectedRadio: setSelectedRadio,
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
                child: FractionallySizedBox(
                  widthFactor: 1.0,
                  child: ElevatedButton(
                      onPressed: () {
                        Fluttertoast.showToast(msg: "Verification Completed Successfully!");
                        //navigate to next screen
                      },
                      style: const ButtonStyle(
                        minimumSize:
                            MaterialStatePropertyAll(Size(double.infinity, 48)),
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
                          style: TextStyle(color: Colors.white, fontSize: 16,letterSpacing: 0.48,fontWeight: FontWeight.w700),
                        ),
                      )),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
