import 'package:flutter/material.dart';
import '../components/pricing_plan_card.dart';
import '../constants.dart';
import '../services/pricing_plans.dart';

class PricingScreen extends StatelessWidget {
  const PricingScreen({super.key, required this.className});
  final String className;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kPrimaryColor,
        title: const Text(
          "Fitness class",
          style: TextStyle(color: Colors.white, fontSize: 16),
        ),
      ),
      body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 12),
          child: ListView.builder(
              physics: const BouncingScrollPhysics(),
              itemCount: pricingPlans.length,
              itemBuilder: ((context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 6),
                  child: PricingPlanCard(planName: pricingPlans[index].planName, price: pricingPlans[index].price, features: pricingPlans[index].features),
                );
              }))),
    );
  }
}
