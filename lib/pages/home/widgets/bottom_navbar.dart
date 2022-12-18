import 'package:flutter/material.dart';
import 'package:parcel_delivery_app/core/colors.dart';
import 'package:parcel_delivery_app/core/utils.dart';
import 'package:parcel_delivery_app/pages/home/home_screen.dart';
import 'package:parcel_delivery_app/pages/parcel_center/parcel_center_screen.dart';
import 'package:parcel_delivery_app/pages/send_parcel/send_parcel_screen.dart';

class BottomNavBarWidget extends StatefulWidget {
  const BottomNavBarWidget({super.key, required this.passedIndex});
  final int passedIndex;
  @override
  State<BottomNavBarWidget> createState() => _BottomNavBarWidgetState();
}

class _BottomNavBarWidgetState extends State<BottomNavBarWidget> {
  final List<String> navBarTitles = [
    'My parcels',
    'Send parcel',
    'Parcel center'
  ];
  int currentIndex = 0;

  @override
  void initState() {
    super.initState();
    currentIndex = widget.passedIndex;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 375,
      height: 101,
      color: kwhite,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: List.generate(3, (index) {
          return Expanded(
            child: GestureDetector(
              onTap: () {
                setState(() => currentIndex = index);
                if (index != widget.passedIndex) {
                  switch (index) {
                    case 0:
                      AppUtils.navigateWithClear(const HomeScreen(), context);
                      break;
                    case 1:
                      AppUtils.navigateWithClear(
                          const SendParcelScreen(), context);
                      break;
                    case 2:
                      AppUtils.navigateWithClear(
                          const ParcelCenterScreen(), context);
                      break;
                    default:
                  }
                }
              },
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Image(
                    image: AssetImage(
                      AppUtils.assetsName('navbar_icon${index + 1}', 'icons'),
                    ),
                    color: currentIndex == index ? kblack : klightGrey,
                    width: 24,
                    height: 24,
                    fit: BoxFit.contain,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    navBarTitles[index],
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          color: currentIndex == index ? kblack : klightGrey,
                        ),
                  ),
                ],
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}
