import 'package:flutter/material.dart';

import '../../../core/colors.dart';
import '../../../core/utils.dart';

class SliverAppBarWidget extends StatelessWidget {
  const SliverAppBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      backgroundColor: kyellow,
      expandedHeight: 400,
      titleSpacing: 0,
      centerTitle: false,
      title: Padding(
        padding: const EdgeInsets.only(left: 24),
        child: Text(
          'Track parcel',
          style: Theme.of(context).textTheme.headlineLarge,
        ),
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 24),
          child: CircleAvatar(
            radius: 20,
            backgroundImage: AssetImage(
              AppUtils.assetsName('app_bar_image', 'images'),
            ),
          ),
        ),
      ],
      flexibleSpace: FlexibleSpaceBar(
        background: Container(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          margin: const EdgeInsets.only(top: 40),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 30),
              //! top Row

              const SizedBox(height: 80),
              Text(
                'Enter parcel number or scan QR code',
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              const SizedBox(height: 7),
              Row(
                children: [
                  Expanded(
                    child: Container(
                      width: 269,
                      height: 49,
                      decoration: BoxDecoration(
                        color: kwhite,
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: TextField(
                        decoration: InputDecoration(
                          contentPadding:
                              const EdgeInsets.symmetric(horizontal: 12),
                          hintText: 'tracking number',
                          hintStyle:
                              Theme.of(context).textTheme.bodyMedium!.copyWith(
                                    color: const Color(0xff333333),
                                  ),
                          enabled: true,
                          border: InputBorder.none,
                          focusedBorder: InputBorder.none,
                          enabledBorder: InputBorder.none,
                          errorBorder: InputBorder.none,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),
                  Container(
                    width: 49,
                    height: 49,
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: kwhite,
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Image(
                      image: AssetImage(
                        AppUtils.assetsName('qr_code', 'icons'),
                      ),
                      width: 24,
                      height: 24,
                      fit: BoxFit.contain,
                    ),
                  )
                ],
              ),
              const SizedBox(height: 40),
              ElevatedButton(
                onPressed: () {},
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(kblack),
                  fixedSize: MaterialStateProperty.all(
                    const Size(double.maxFinite, 48),
                  ),
                ),
                child: const Text('Track parcel'),
              ),
            ],
          ),
        ),
      ),
      shape: const OutlineInputBorder(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(25),
          bottomRight: Radius.circular(25),
        ),
        borderSide: BorderSide.none,
      ),
      //! when scroll down >> appbar appears immediatelly
      floating: true,
      pinned: true,
      automaticallyImplyLeading: false,
      snap: true,
    );
  }
}
