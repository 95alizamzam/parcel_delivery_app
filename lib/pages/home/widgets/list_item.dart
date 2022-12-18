import 'package:flutter/material.dart';
import 'package:parcel_delivery_app/core/colors.dart';
import 'package:parcel_delivery_app/pages/home/widgets/my_parcel_details_screen.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

import '../../../core/utils.dart';
import '../../../models/my_parcels_data_model.dart';

class ListItemWidget extends StatelessWidget {
  const ListItemWidget({super.key, required this.item});
  final MyparcelsDataModel item;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shadowColor: kgrey,
      margin: const EdgeInsets.all(16),
      shape: OutlineInputBorder(
        borderSide: BorderSide.none,
        borderRadius: BorderRadius.circular(5),
      ),
      child: Container(
        padding: const EdgeInsets.all(10),
        width: 327,
        height: 190,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  item.id.toString(),
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                const Spacer(),
                Image(
                  image: AssetImage(item.brandImage),
                  width: 80,
                  fit: BoxFit.cover,
                )
              ],
            ),
            const SizedBox(height: 20),
            Text(
              item.status.toString(),
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            const SizedBox(height: 3),
            Text(
              'Last update: ${item.lastUpdate}',
              style:
                  Theme.of(context).textTheme.bodySmall!.copyWith(color: kgrey),
            ),
            const SizedBox(height: 10),
            if (item.progressValue != 1)
              LinearPercentIndicator(
                lineHeight: 6.0,
                percent: item.progressValue,
                backgroundColor: kSuperlightGrey,
                progressColor: kyellow,
                barRadius: const Radius.circular(15),
                padding: EdgeInsets.zero,
              ),
            if (item.progressValue != 1) const SizedBox(height: 20),
            GestureDetector(
              onTap: (){
                AppUtils.navigate(MyParcelDetailsScreen(
                  item: item
                ), context);
              },
              child: Container(
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
                          'Details',
                          style: Theme.of(context).textTheme.bodyLarge!,
                        ),
                        const SizedBox(width: 4),
                        Image(
                          image: AssetImage(
                            AppUtils.assetsName('arrow_right', 'icons'),
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
            ),
          ],
        ),
      ),
    );
  }
}
