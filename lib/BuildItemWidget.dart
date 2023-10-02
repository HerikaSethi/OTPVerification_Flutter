import 'package:flutter/material.dart';
import 'package:live_easy_assignment/constants/AppColor.dart';

class BuildItem extends StatelessWidget {
  final int value;
  final String image;
  final String title;
  final String description;
  final int selectedRadio;
  final ValueChanged<int> setSelectedRadio;

  const BuildItem({
    required this.value,
    required this.image,
    required this.title,
    required this.description,
    required this.selectedRadio,
    required this.setSelectedRadio,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 16,right: 16),
      padding: const EdgeInsets.all(20.0),
      decoration: BoxDecoration(
        border: Border.all(color: AppColor.black),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 8),
            child: Radio(
              value: value,
              groupValue: selectedRadio,
              activeColor: AppColor.activeButtonBlue,
              onChanged: (val) {
                setSelectedRadio(val??1);
              },
            ),
          ),
          Image.asset(
            image,
            width: 40,
            height: 40,
          ),
          const SizedBox(width: 16.0),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 18.0,
                ),
              ),
              Text(
                description,
                style: const TextStyle(fontSize: 12.0,
                  fontWeight: FontWeight.w400,
                  color: AppColor.lightgrey),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
