import 'package:cloths_app/users/controllers/connectivity_controller.dart';
import 'package:cloths_app/users/fragements/favourite_fragement_screeen.dart';
import 'package:cloths_app/users/fragements/home_fragement_screen.dart';
import 'package:cloths_app/users/fragements/order_fragement_screen.dart';
import 'package:cloths_app/users/fragements/profile_fragement_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
class DashboardOfFragements extends StatefulWidget {
  const DashboardOfFragements({super.key});

  @override
  State<DashboardOfFragements> createState() => _DashboardOfFragementsState();
}

class _DashboardOfFragementsState extends State<DashboardOfFragements> {
  RxInt _indexNumber= 0.obs;
  List<Widget> _fragmentScreens=
  [
    HomeFragementScreen(),
    FavouriteFragementScreen(),
    OrderFragementScreen(),
    ProfileFragementScreen(),

  ];
  List _navigationButtonProperties=[
    {
      "active_icon":Icons.home,
      "non_active_icon":Icons.home_outlined,
      "label":"Home"
    },
    {
      "active_icon":Icons.favorite,
      "non_active_icon":Icons.favorite_border,
      "label":"Favourites"
    },
    {
      "active_icon":Icons.reorder,
      "non_active_icon":Icons.reorder_outlined,
      "label":"Orders"
    },
    {
      "active_icon":Icons.person,
      "non_active_icon":Icons.person_outlined,
      "label":"Profile"
    },
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     // backgroundColor: Colors.w,
      body:SafeArea(child: Obx(()=>

         _fragmentScreens[_indexNumber.value]
      )),
      bottomNavigationBar: Obx(()=>
      BottomNavigationBar(
        currentIndex: _indexNumber.value,
        onTap: (value)=>
        {
          _indexNumber.value= value,
        },
        showSelectedLabels: true,
        showUnselectedLabels: true ,
        unselectedItemColor: Colors.grey,
        selectedItemColor: Colors.white,
        items: List.generate(4, (index)
        {
         var navBtnProperty= _navigationButtonProperties[index];
         return BottomNavigationBarItem(
             backgroundColor: Colors.black,
             activeIcon: Icon(navBtnProperty["active_icon"]),
             label: navBtnProperty["label".tr],
             icon:Icon(navBtnProperty["non_active_icon"]));
        }),



      )),
    );
  }
}
