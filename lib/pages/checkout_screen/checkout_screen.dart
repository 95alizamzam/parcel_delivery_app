import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:parcel_delivery_app/core/utils.dart';

import '../../core/colors.dart';

class CheckoutScreen extends StatelessWidget {
  const CheckoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        leading: null,
        leadingWidth: 16,
        title: Text(
          'Checkout',
          style: Theme.of(context).textTheme.headlineLarge,
        ),
        elevation: 0,
        backgroundColor: kwhite,
        titleSpacing: 0,
      ),
      body: Column(
        children: [
          Image(
            image: AssetImage(
              AppUtils.assetsName('master_card', 'images'),
            ),
            height: 240,
            width: double.maxFinite,
            fit: BoxFit.cover,
          ),
          const SizedBox(height: 36),
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: klightGrey.withOpacity(.3),
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(15),
                  topRight: Radius.circular(15),
                ),
              ),
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          'Summary',
                          style: Theme.of(context).textTheme.headlineLarge,
                        ),
                        Spacer(),
                        Container(
                          width: 80,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text(
                                    'Edit',
                                    style:
                                        Theme.of(context).textTheme.bodyLarge!,
                                  ),
                                  const SizedBox(width: 4),
                                  Image(
                                    image: AssetImage(
                                      AppUtils.assetsName(
                                          'arrow_right', 'icons'),
                                    ),
                                    width: 15,
                                    height: 15,
                                    fit: BoxFit.fitHeight,
                                  )
                                ],
                              ),
                              const Divider(
                                thickness: 2,
                                color: kblack,
                                height: 8,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    Text(
                      'Recipient',
                      style: Theme.of(context).textTheme.headlineSmall,
                    ),
                    const SizedBox(height: 10),
                    Text(
                      'Ali Zamzam',
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                    const SizedBox(height: 10),
                    Text(
                      'example@gmail.com',
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                    const SizedBox(height: 10),
                    Text(
                      '+964 xxxxxxxxxx',
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                    const SizedBox(height: 10),
                    Text(
                      'Iraq, Erbil',
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                    const SizedBox(height: 20),
                    Text(
                      'Parcel size',
                      style: Theme.of(context).textTheme.headlineSmall,
                    ),
                    const SizedBox(height: 10),
                    Text(
                      'Medium',
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                    const SizedBox(height: 20),
                    Text(
                      'Delivery method',
                      style: Theme.of(context).textTheme.headlineSmall,
                    ),
                    const SizedBox(height: 10),
                    Text(
                      'From door to door',
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                    const SizedBox(height: 30),
                    ElevatedButton(
                      onPressed: () {},
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(kblack),
                        fixedSize: MaterialStateProperty.all(
                            const Size(double.maxFinite, 50)),
                      ),
                      child: const Text('Pay £3,08'),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
