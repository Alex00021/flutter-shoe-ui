import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../myTheme/colors.dart';
import '../view/cart_page.dart';
import '../view/menu_page.dart';

/// 主页AppBar
getAppBar(context) {
  return AppBar(
    elevation: 0,
    backgroundColor: white,
    title: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        IconButton(
            icon: SvgPicture.asset("assets/images/burger_icon.svg"),
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(fullscreenDialog: true, builder: (_) => const MenuPage()));
            }),
        Row(
          children: <Widget>[
            IconButton(icon: SvgPicture.asset("assets/images/search_icon.svg"), onPressed: () {}),
            IconButton(icon: SvgPicture.asset("assets/images/filter_icon.svg"), onPressed: () {}),
            IconButton(
                icon: Container(
                  child: const Center(
                      child: Icon(
                    Icons.add_shopping_cart_sharp,
                    color: Colors.red,
                  )),
                  decoration: const BoxDecoration(color: grey, shape: BoxShape.circle),
                ),
                onPressed: () {
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => const CartPage()));
                }),
          ],
        )
      ],
    ),
  );
}
