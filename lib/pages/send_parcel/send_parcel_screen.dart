import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:parcel_delivery_app/core/colors.dart';
import 'package:parcel_delivery_app/core/utils.dart';
import 'package:parcel_delivery_app/pages/home/widgets/bottom_navbar.dart';
import 'package:parcel_delivery_app/pages/send_parcel/widgets/send_parcel_item.dart';

import '../../models/parcel_size_data_model.dart';

class SendParcelScreen extends StatefulWidget {
  const SendParcelScreen({super.key});

  @override
  State<SendParcelScreen> createState() => _SendParcelScreenState();
}

class _SendParcelScreenState extends State<SendParcelScreen> {
  final List<ParcelSizeDataModle> items = [
    ParcelSizeDataModle(
      'Small',
      'Fits in an envelope',
      AppUtils.assetsName('Envelope', 'icons'),
      'Max. 25 kg, 8 x 38 x 64 cm',
    ),
    ParcelSizeDataModle(
      'Medium',
      'Fits in a shoe box',
      AppUtils.assetsName('box', 'icons'),
      'Max. 25 kg, 19 x 38 x 64 cm',
    ),
    ParcelSizeDataModle(
      'Large',
      'Fits in a cardboard box',
      AppUtils.assetsName('card_box', 'icons'),
      'Max. 25 kg, 41 x 38 x 64 cm',
    ),
    ParcelSizeDataModle(
      'Custom',
      'Fits on a skid',
      AppUtils.assetsName('custom_box', 'icons'),
      'Max: 30kg or 300cm',
    ),
  ];
  @override
  void initState() {
    super.initState();
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(statusBarColor: kwhite),
    );
  }

  @override
  void dispose() {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(statusBarColor: kyellow),
    );
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: Text(
          'Send parcel',
          style: Theme.of(context).textTheme.headlineLarge,
        ),
        elevation: 0,
        backgroundColor: kwhite,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Parcel size',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            Expanded(
              child: ListView.separated(
                shrinkWrap: true,
                physics: const BouncingScrollPhysics(),
                padding: const EdgeInsets.only(bottom: 10),
                itemBuilder: (context, index) =>
                    SendParcelItemWidget(model: items[index]),
                separatorBuilder: (context, index) =>
                    const SizedBox(height: 16),
                itemCount: items.length,
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: const BottomNavBarWidget(passedIndex: 1),
    );
  }
}
