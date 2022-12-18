import 'package:flutter/material.dart';
import 'package:parcel_delivery_app/pages/delivery_methods/delivery_methods_screen.dart';
import 'package:parcel_delivery_app/pages/delivery_methods/widgets/text_field_widget.dart';

import '../../../core/colors.dart';
import '../../../models/delivery_model.dart';

class DeliveryWidget extends StatelessWidget {
  const DeliveryWidget({super.key, required this.method});
  final DeliveryMethodDataModel method;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: method.type == DeliveryMethodType.fromDoorToDoor
          ? dootToDoor(method, context)
          : dootToCenter(method, context),
    );
  }
}

Widget dootToCenter(DeliveryMethodDataModel method, BuildContext context) {
  return Card(
    color: kwhite,
    shadowColor: kgrey,
    elevation: 4,
    child: Container(
      padding: const EdgeInsets.all(20),
      child: Row(
        children: [
          Image(
            image: AssetImage(method.image),
            width: 66,
            height: 99,
          ),
          const SizedBox(width: 30),
          Expanded(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                method.title,
                style: Theme.of(context).textTheme.headlineSmall,
              ),
              const SizedBox(height: 4),
              Text(
                method.time,
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              const SizedBox(height: 8),
            ],
          )),
        ],
      ),
    ),
  );
}

Widget dootToDoor(DeliveryMethodDataModel method, BuildContext context) {
  return Card(
    child: Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(20),
            child: Row(
              children: [
                Image(
                  image: AssetImage(method.image),
                  width: 66,
                  height: 99,
                ),
                const SizedBox(width: 30),
                Expanded(
                    child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      method.title,
                      style: Theme.of(context).textTheme.headlineSmall,
                    ),
                    const SizedBox(height: 4),
                    Text(
                      method.time,
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                    const SizedBox(height: 8),
                  ],
                )),
              ],
            ),
          ),
          const Divider(color: kgrey, thickness: 1.5),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text('Recipient info'),
          ),
          const TextFieldWidget(
            title: 'Name',
            hint: 'Ali Zamzam',
            type: TextInputType.text,
            action: TextInputAction.next,
          ),
          const SizedBox(height: 4),
          const TextFieldWidget(
            title: 'Email',
            hint: 'example@gmail.com',
            type: TextInputType.emailAddress,
            action: TextInputAction.next,
          ),
          const SizedBox(height: 4),
          const TextFieldWidget(
            title: 'Phone number',
            hint: '+964 XXXXXXXXXX',
            type: TextInputType.phone,
            action: TextInputAction.next,
          ),
          const SizedBox(height: 4),
          const TextFieldWidget(
            title: 'Address',
            hint: 'Iraq,Erbil',
            type: TextInputType.streetAddress,
            action: TextInputAction.done,
          ),
        ],
      ),
    ),
  );
}
