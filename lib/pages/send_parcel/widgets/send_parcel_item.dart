import 'package:flutter/material.dart';
import 'package:parcel_delivery_app/pages/delivery_methods/delivery_methods_screen.dart';

import '../../../core/colors.dart';
import '../../../core/utils.dart';
import '../../../models/parcel_size_data_model.dart';

class SendParcelItemWidget extends StatelessWidget {
  const SendParcelItemWidget({super.key, required this.model});
  final ParcelSizeDataModle model;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        AppUtils.navigate(DeliveryMethodsScreen(), context);
      },
      child: Card(
        color: kwhite,
        shadowColor: kgrey,
        elevation: 4,
        child: Container(
          padding: const EdgeInsets.all(20),
          child: Row(
            children: [
              Image(
                image: AssetImage(model.imageUrl),
                width: 66,
                height: 99,
              ),
              const SizedBox(width: 30),
              Expanded(
                  child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    model.size,
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
                  const SizedBox(height: 4),
                  Text(
                    model.dimenstions,
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    model.description,
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          color: kgrey,
                          fontSize: 14,
                        ),
                  ),
                ],
              )),
            ],
          ),
        ),
      ),
    );
  }
}
