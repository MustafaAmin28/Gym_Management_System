import '../models/pricing_plan_model.dart';

List<PricingPlanModel> pricingPlans = [
  PricingPlanModel(
      planName: 'Basic',
      price: 19,
      features: ['Access to basic exercises videos.', ' One session per day.']),
  PricingPlanModel(planName: 'Premium', price: 29, features: [
    'Access to advanced exercises videos.',
    'Unlimited sessions.',
    'Trainer to guide you.'
  ]),
  PricingPlanModel(planName: 'Pro', price: 39, features: [
    'Access to advanced exercises videos.',
    'Unlimited sessions.',
    'Trainer to guide you.',
    'Discount on products in store.'
  ]),
];
