
import 'package:cryptop/infrastructure/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';
import 'package:sizer/sizer.dart';

class HomeWidget {
  static Widget orderBookShimmer() {
    return const Text('Loading...');
  }

  static List<Widget> shimmerWidget() => [
        Shimmer.fromColors(
            enabled: true,
            baseColor: Colors.grey.shade300,
            highlightColor: Colors.grey.shade100,
            child: Column(
              children: [
                Padding(
                    padding: EdgeInsets.only(top: 3.5.h, bottom: 3.h),
                    child: shimmerContainer(sizes: [
                      {'height': 5.h, 'width': 40.w},
                    ], showClone: false)),
                Padding(
                    padding: EdgeInsets.only(top: 3.5.h, bottom: .05.h),
                    child: shimmerContainer(sizes: [
                      {'height': 1.5.h, 'width': 15.w},
                      {'height': 3.h, 'width': 30.w},
                    ])),
                Padding(
                    padding: EdgeInsets.only(top: 3.5.h, bottom: .05.h),
                    child: shimmerContainer(sizes: [
                      {'height': 1.5.h, 'width': 15.w},
                      {'height': 3.h, 'width': 30.w},
                    ])),
                Padding(
                    padding: EdgeInsets.only(top: 3.5.h, bottom: .05.h),
                    child: shimmerContainer(sizes: [
                      {'height': 1.5.h, 'width': 15.w},
                      {'height': 3.h, 'width': 30.w},
                    ])),
                Padding(
                    padding: EdgeInsets.only(top: 3.5.h, bottom: .05.h),
                    child: shimmerContainer(sizes: [
                      {'height': 1.5.h, 'width': 15.w},
                      {'height': 3.h, 'width': 30.w},
                    ], showClone: false)),
              ],
            ))
      ];

  static Widget shimmerContainer(
      {required List<Map<String, double>> sizes, bool showClone = true}) {
    container({double? height, double? width}) => Container(
          margin: const EdgeInsets.symmetric(vertical: 2),
          width: width,
          height: height,
          decoration: BoxDecoration(
              color: Colors.black, borderRadius: BorderRadius.circular(10)),
        );
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: sizes
              .map(
                (e) => container(height: e['height'], width: e['width']),
              )
              .toList(),
        ),
        if (showClone)
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: sizes
                .map(
                  (e) => container(height: e['height'], width: e['width']),
                )
                .toList(),
          ),
      ],
    );
  }

  static List<Widget> noData(controller) => [
        Padding(
          key: const ValueKey('no_data_widget'),
          padding: EdgeInsets.fromLTRB(0, 6.h, 0, 3.h),
          child: GestureDetector(
            onLongPress: controller.changeLocale,
            child: Icon(
              Icons.search,
              size: 50.w,
              color: AppColors.iconGrey,
            ),
          ),
        ),
        Text(
          'home_enter_currency_to_load'.tr,
          style: const TextStyle(fontSize: 18),
        ),
      ];

  static Widget itemWidget(
      {required String title, required String body, bool showDollar = true}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title.toUpperCase(),
          style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
        ),
        Text(
          '${showDollar ? '\$ ' : ''}$body',
          style: const TextStyle(fontSize: 22, fontWeight: FontWeight.w500),
        )
      ],
    );
  }
}
