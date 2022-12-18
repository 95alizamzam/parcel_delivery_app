import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:parcel_delivery_app/pages/home/widgets/parcel_timeline_widget.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

import '../../../core/colors.dart';
import '../../../models/my_parcels_data_model.dart';

class MyParcelDetailsScreen extends StatefulWidget {
  const MyParcelDetailsScreen({Key? key, required  this.item}) : super(key: key);
  final MyparcelsDataModel item;

  @override
  State<MyParcelDetailsScreen> createState() => _MyParcelDetailsScreenState();
}

class _MyParcelDetailsScreenState extends State<MyParcelDetailsScreen> {

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
    );    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        leading: null,
        leadingWidth: 16,
        title: Text(
          'Details',
          style: Theme.of(context).textTheme.headlineLarge,
        ),
        elevation: 0,
        backgroundColor: kwhite,
        titleSpacing: 0,
      ),
      body: Container(
        padding: const EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                    widget.item.id.toString(),
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  const Spacer(),
                  Image(
                    image: AssetImage(widget.item.brandImage),
                    width: 80,
                    fit: BoxFit.cover,
                  )
                ],
              ),
              const SizedBox(height: 20),
              Text(
                widget.item.status.toString(),
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              const SizedBox(height: 3),
              Text(
                'Last update: ${widget.item.lastUpdate}',
                style:
                Theme.of(context).textTheme.bodySmall!.copyWith(color: kgrey),
              ),
              const SizedBox(height: 10),
              if (widget.item.progressValue != 1)
                LinearPercentIndicator(
                  lineHeight: 6.0,
                  percent: widget.item.progressValue,
                  backgroundColor: kSuperlightGrey,
                  progressColor: kyellow,
                  barRadius: const Radius.circular(15),
                  padding: EdgeInsets.zero,
                ),
              if (widget.item.progressValue != 1) const SizedBox(height: 20),
               Container(
                width: double.maxFinite,
                height: 221,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: kgrey,

                  )
                ),
                child:const Center(
                  child: Text('Google Map should be here'),
                ),
              ),
              const SizedBox(height: 20),
               ParcelTimeLineWidget(),
            ],
          ),
        ),
      ),
    );
  }
}
