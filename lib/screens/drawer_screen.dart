import 'package:flutter/material.dart';
import 'package:movie_app/widgets/colored_circle.dart';
import 'package:movie_app/widgets/drawer_item.dart';
import 'package:sizer/sizer.dart';
import 'package:movie_app/utils/constants.dart';
import 'package:movie_app/utils/file_manager.dart' as file;

class DrawerScreen extends StatelessWidget {
  final Function(Color) colorChanged;
  DrawerScreen({required this.colorChanged});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: Colors.white,
        child: Padding(
          padding:
          EdgeInsets.only(top: 10.h, left: 6.w, right: 6.w, bottom: 5.h),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              DrawerItem(
                title: kDrawerTitleSecondText,
                desc: kDrawerAboutDescText,
              ),

              SizedBox(
                height: 5.h,
              ),

              DrawerItem(
                title: kDrawerTitleFirstText,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        CircleAvatar(
                          radius: 26,
                          backgroundImage: AssetImage('assets/1.jpg'),
                        ),
                        SizedBox(
                          height: 1.h,
                        ),
                        Text("Jalal")
                      ],
                    ),
                    Column(
                      children: [
                        CircleAvatar(
                          radius: 26,
                          backgroundImage: AssetImage('assets/3.jpg'),
                        ),
                        SizedBox(
                          height: 1.h,
                        ),
                        Text("Ivan")
                      ],
                    ),
                    Column(
                      children: [
                        CircleAvatar(
                          radius: 26,
                          backgroundImage: AssetImage('assets/4.jpg'),
                        ),
                        SizedBox(
                          height: 1.h,
                        ),
                        Text("Irpan")
                      ],
                    ),
                    Column(
                      children: [
                        CircleAvatar(
                          radius: 26,
                          backgroundImage: AssetImage('assets/2.jpg'),
                        ),
                        SizedBox(
                          height: 1.h,
                        ),
                        Text("Aji")
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
