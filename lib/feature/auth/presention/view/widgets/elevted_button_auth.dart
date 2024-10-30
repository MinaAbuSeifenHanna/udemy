import 'package:appwithcleanarch/core/utlis/app_color.dart';
import 'package:appwithcleanarch/core/utlis/app_strings.dart';
import 'package:flutter/material.dart';

class ElevatedButtonAuth extends StatelessWidget {
  ElevatedButtonAuth({super.key , required this.child , required this.tap});
  final String child ;
  final GestureTapCallback tap ;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: tap,
      child: Container(
        width: MediaQuery.sizeOf(context).width,
        height:   70,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: AppColor.myGreen,

        ),
        child: Center(child: Text(child)),
      ),
    );
  }
}
