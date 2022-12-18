import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:parcel_delivery_app/core/utils.dart';
import 'package:parcel_delivery_app/pages/home/widgets/bottom_navbar.dart';
import 'package:parcel_delivery_app/pages/home/widgets/list_item.dart';

import '../../core/colors.dart';
import '../../models/my_parcels_data_model.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<MyparcelsDataModel> myParcel = [
    MyparcelsDataModel(
      00359007738060313786,
      'In transit',
      '3 hours ago',
      .75,
      AppUtils.assetsName('amazon', 'brands'),
    ),
    MyparcelsDataModel(
      00806031378690077312,
      'Left the parcel center',
      '21 hours ago',
      .25,
      AppUtils.assetsName('ali_express', 'brands'),
    ),
    MyparcelsDataModel(
      00690077312806031378,
      'Delivered',
      '2 days ago',
      1,
      AppUtils.assetsName('zalado', 'brands'),
    ),
    //! test
    MyparcelsDataModel(
      00690077312806031378,
      'Delivered',
      '2 days ago',
      1,
      AppUtils.assetsName('zalado', 'brands'),
    ),
    MyparcelsDataModel(
      00690077312806031378,
      'Delivered',
      '2 days ago',
      1,
      AppUtils.assetsName('zalado', 'brands'),
    ),
    MyparcelsDataModel(
      00690077312806031378,
      'Delivered',
      '2 days ago',
      1,
      AppUtils.assetsName('zalado', 'brands'),
    ),
  ];
  final ScrollController sc = ScrollController();

  double borderRadius = 15;
  bool showDropDownArrow = false;
  @override
  void initState() {
    super.initState();
    sc.addListener(() {
      if (sc.offset == sc.position.maxScrollExtent) {
        showDropDownArrow = true;
      } else {
        showDropDownArrow = false;
      }
      setState(() {});
    });

    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: kyellow,
        statusBarBrightness: Brightness.light,
        statusBarIconBrightness: Brightness.dark,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: CustomScrollView(
          controller: sc,
          slivers: [
            SliverAppBar(
              backgroundColor: kyellow,
              expandedHeight: 350,
              collapsedHeight: 100,
              toolbarHeight: 100,
              titleSpacing: 0,
              elevation: 0,
              centerTitle: false,
              title: Padding(
                padding: const EdgeInsets.only(left: 24, top: 20),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'Track parcel',
                      style: Theme.of(context).textTheme.headlineLarge,
                    ),
                    const SizedBox(width: 14),
                    if (showDropDownArrow)
                      Image(
                        image: AssetImage(
                          AppUtils.assetsName('drop_down_arrow', 'icons'),
                        ),
                        width: 18,
                        height: 18,
                      ),
                  ],
                ),
              ),
              actions: [
                Padding(
                  padding: const EdgeInsets.only(right: 24, top: 20),
                  child: ClipOval(
                    child: Image(
                      image: AssetImage(
                        AppUtils.assetsName('app_bar_image', 'images'),
                      ),
                      width: 45,
                      height: 45,
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
                                keyboardType: TextInputType.phone,
                                decoration: InputDecoration(
                                  contentPadding: const EdgeInsets.symmetric(
                                    horizontal: 12,
                                  ),
                                  hintText: 'tracking number',
                                  hintStyle: Theme.of(context)
                                      .textTheme
                                      .bodyMedium!
                                      .copyWith(
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
                        child: Text(
                          'Track parcel',
                          style: Theme.of(context)
                              .textTheme
                              .headlineSmall!
                              .copyWith(color: kwhite),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              shape: OutlineInputBorder(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(borderRadius),
                  bottomRight: Radius.circular(borderRadius),
                ),
                borderSide: BorderSide.none,
              ),
              //! when scroll down >> appbar appears immediatelly
              floating: true,
              pinned: true,
              automaticallyImplyLeading: false,
              // snap: true,
            ),
            SliverPadding(
              padding: const EdgeInsets.only(top: 32, left: 24),
              sliver: SliverToBoxAdapter(
                child: Text(
                  'My parcels',
                  style: Theme.of(context).textTheme.headlineLarge,
                ),
              ),
            ),
            SliverList(
              delegate: SliverChildListDelegate(
                myParcel.map((e) {
                  return ListItemWidget(item: e);
                }).toList(),
              ),
            ),
          ],
        ),
        bottomNavigationBar: const BottomNavBarWidget(passedIndex: 0),
      ),
    );
  }
}
