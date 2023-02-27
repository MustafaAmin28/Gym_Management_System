import 'package:flutter/material.dart';
import '../constants.dart';
import 'custom_elevated_button.dart';

class PricingPlanCard extends StatelessWidget {
  PricingPlanCard(
      {required this.planName, required this.price, required this.features});
  final String planName;
  final double price;
  List<String> features = [];
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(bottom: 10),
      margin: const EdgeInsets.symmetric(horizontal: 4, vertical: 12),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.8),
        borderRadius: BorderRadius.circular(16),
      ),
      width: double.infinity,
      height: 300,
      child: Column(
        children: [
          Container(
            decoration: const BoxDecoration(
              color: kPrimaryColor,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(16), topRight: Radius.circular(16)),
            ),
            padding: const EdgeInsets.symmetric(vertical: 8),
            width: double.infinity,
            height: 80,
            child: Column(
              children: [
                Text(
                  planName,
                  style: const TextStyle(
                      color: Colors.white,
                      fontSize: 22,
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  '$price\$ /Month',
                  style: const TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: features.length,
              itemBuilder: (context, index) {
                return Text(
                  '- ${features[index]}',
                  style: const TextStyle(color: Colors.black, fontSize: 18),
                );
              },
            ),
          ),
          const Spacer(flex: 1),
          CustomElevatedButton(
              buttonText: 'Subscribe Now',
              height: 45,
              width: 80,
              buttonColor: kPrimaryColor,
              onTap: () {})
        ],
      ),
    );
  }
}
