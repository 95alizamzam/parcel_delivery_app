import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:parcel_delivery_app/pages/home/widgets/bottom_navbar.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

import '../../core/colors.dart';
import '../../models/parcel_center_data_model.dart';

class ParcelCenterScreen extends StatefulWidget {
  const ParcelCenterScreen({Key? key}) : super(key: key);

  @override
  State<ParcelCenterScreen> createState() => _ParcelCenterScreenState();
}

class _ParcelCenterScreenState extends State<ParcelCenterScreen> {
  @override
  void initState() {
    super.initState();
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(statusBarColor: kwhite),
    );
  }

  final List<ParcelCenterDataModel> items=[
    ParcelCenterDataModel('NY0924', 'Available 24/7', '985 Meadow St.','Staten Island, NY 10306','Fully occupied',1.0),
    ParcelCenterDataModel('NY0812', 'Available 24/7', '54 West Adams Court','Rego Park, NY 11374','Lots of empty space',0.4),

  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        leading: null,
        title: Text(
          'Parcel Centers',
          style: Theme.of(context).textTheme.headlineLarge,
        ),
        elevation: 0,
        backgroundColor: kwhite,
        titleSpacing: 14,
      ),
      body: Container(
        padding: const EdgeInsets.all(14),
        child: Column(
          children: [
            Container(
              width: double.maxFinite,
              height: 221,
              decoration: BoxDecoration(
                border: Border.all(
                  color: kblack,
                ),
              ),
              child: const Center(child: Text('Google map Should be here')),
            ),
            Expanded(
                child: ListView.separated(
              itemBuilder: (context, index) => centerItem(items[index],context),
              separatorBuilder: (context, index) => const SizedBox(height: 6),
              itemCount: items.length,
            )),
          ],
        ),
      ),
      bottomNavigationBar: const BottomNavBarWidget(passedIndex: 2),
    );
  }
}

Widget centerItem(ParcelCenterDataModel item, BuildContext context){
  return Card(
    margin: EdgeInsets.zero,
    elevation: 4,
    shadowColor: kgrey,
    child: Container(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(item.id),
             const Spacer(),
              Text(item.availability,style: Theme.of(context).textTheme.bodySmall!.copyWith(color: kgrey)),
            ],
          ),
          const SizedBox(height: 10),
          Text(item.maiinAddress, style: Theme.of(context).textTheme.bodyLarge),
          const SizedBox(height: 6),
          Text(item.subAdress,style: Theme.of(context).textTheme.bodyMedium),
          const SizedBox(height: 20),
          Text(item.status,style: Theme.of(context).textTheme.bodyMedium),
          const SizedBox(height: 4),
          LinearPercentIndicator(
            lineHeight: 6.0,
            percent: item.progressValue,
            backgroundColor: kSuperlightGrey,
            progressColor: kyellow,
            barRadius: const Radius.circular(15),
            padding: EdgeInsets.zero,
          ),

        ],
      ),
    ),
  );
}