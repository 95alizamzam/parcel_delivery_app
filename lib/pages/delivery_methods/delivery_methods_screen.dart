import 'package:flutter/material.dart';
import 'package:parcel_delivery_app/core/utils.dart';
import 'package:parcel_delivery_app/pages/checkout_screen/checkout_screen.dart';
import 'package:parcel_delivery_app/pages/delivery_methods/widgets/delivery_widget.dart';

import '../../core/colors.dart';
import '../../models/delivery_model.dart';
import '../home/widgets/bottom_navbar.dart';

class DeliveryMethodsScreen extends StatelessWidget {
  DeliveryMethodsScreen({super.key});

  final List<DeliveryMethodDataModel> deliveryMethods = [
    DeliveryMethodDataModel(
      AppUtils.assetsName('delivery_method1', 'icons'),
      'From door to parcel center',
      '1 - 2 days',
      DeliveryMethodType.fromDoorToParcelCenter,
    ),
    DeliveryMethodDataModel(
      AppUtils.assetsName('delivery_method2', 'icons'),
      'From door to door	',
      '2 - 3 days',
      DeliveryMethodType.fromDoorToDoor,
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        leading: null,
        leadingWidth: 16,
        title: Text(
          'Send parcel',
          style: Theme.of(context).textTheme.headlineLarge,
        ),
        elevation: 0,
        backgroundColor: kwhite,
        titleSpacing: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Delivery method',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            Expanded(
              child: ListView.separated(
                shrinkWrap: true,
                physics: const BouncingScrollPhysics(),
                padding: const EdgeInsets.only(bottom: 10),
                itemBuilder: (context, index) =>
                    DeliveryWidget(method: deliveryMethods[index]),
                separatorBuilder: (context, index) =>
                    const SizedBox(height: 16),
                itemCount: deliveryMethods.length,
              ),
            ),
            ElevatedButton(
              onPressed: () {
                AppUtils.navigate(const CheckoutScreen(), context);
              },
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(kblack),
                fixedSize: MaterialStateProperty.all(
                  const Size.fromWidth(double.maxFinite),
                ),
              ),
              child: const Text('CheckOut'),
            ),
          ],
        ),
      ),
      bottomNavigationBar: const BottomNavBarWidget(passedIndex: 1),
    );
  }
}

enum DeliveryMethodType { fromDoorToParcelCenter, fromDoorToDoor }
