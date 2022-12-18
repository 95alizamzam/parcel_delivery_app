
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:parcel_delivery_app/core/colors.dart';
import 'package:parcel_delivery_app/core/utils.dart';
import 'package:timeline_tile/timeline_tile.dart';

import '../../../models/parcel_order_status_model.dart';

enum ParcelOrderStatus { prepared, handover, inTransit }

class ParcelTimeLineWidget extends StatelessWidget {
  ParcelTimeLineWidget({Key? key}) : super(key: key);

  final List<ParcelOrderStatusModel> orderStatus = [
    ParcelOrderStatusModel(
        'Parcel prepared - not yet handed over to the courier.',
        '20.08.2020 - 18:48',
        AppUtils.assetsName('img3', 'parcel_order_status')),
    ParcelOrderStatusModel(
        'Parcel handed over to the courier.',
        '21.08.2020 - 8:23',
        AppUtils.assetsName('img2', 'parcel_order_status')),
    ParcelOrderStatusModel('Parcel in transit', '21.08.2020 - 16:10',
        AppUtils.assetsName('img1', 'parcel_order_status')),


  ];
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: ListView.separated(
        physics:const NeverScrollableScrollPhysics(),
        reverse: true,
        shrinkWrap: true,
        itemBuilder: (context, index) => SizedBox(
          child: TimelineTile(
            endChild: Container(
              height: 70,
              margin: const EdgeInsets.only(left: 20),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(orderStatus[index].status,
                      style: Theme.of(context).textTheme.headlineSmall),
                  const SizedBox(height: 2),
                  Text(
                    orderStatus[index].time,
                    style: Theme.of(context)
                        .textTheme
                        .bodySmall!
                        .copyWith(color: klightGrey,fontSize: 12),
                  ),
                ],
              ),
            ),
            indicatorStyle: IndicatorStyle(
              color: kyellowDark,
              indicatorXY: 0.0,
              height: 50,
              width: 50,
              indicator: Container(
                decoration: const BoxDecoration(
                  color: kyellowDark,
                  shape: BoxShape.circle,
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Image(
                    image: AssetImage(
                      orderStatus[index].image,
                    ),
                  ),
                ),
              ),
            ),
            hasIndicator: true,
            isFirst: index == 2 || index == 1,
            isLast: index == 0,
            beforeLineStyle: const LineStyle(color: kyellow,thickness:2),
            afterLineStyle: const LineStyle(color: kyellow,thickness: 2),

          ),
        ),
        separatorBuilder: (context, index) => const SizedBox.shrink(),
        itemCount: orderStatus.length,
      ),
    );
  }
}
