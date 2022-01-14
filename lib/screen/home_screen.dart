import 'package:cart/screen/cart__screen.dart';
import 'package:cart/data/ListData.dart';
import 'package:cart/screen/dessert_listing_screen.dart';
import 'package:cart/widgets/NamedIcon.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'main_course_listing.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
        length: 2,
        child: Scaffold(

          backgroundColor:  Color.fromRGBO(247, 246, 242, 1),
            appBar: AppBar(
              bottom: const TabBar(

                tabs: [
                  Tab(text: "Main Course",),
                  Tab(text: "Dessert",),
                ],
              ),
              title: const Text("Item List"),
              actions: [
                NamedIcon(
                  text: '',
                  iconData: Icons.shopping_cart,
                  notificationCount: Provider.of<ListData>(context).cartItemCount,
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const CartScreen()));

                  },
                ),
              ],
              centerTitle: true,
            ),
            body: const TabBarView(
              children: [
                MainCourseListingScreen(),
                DessertListingScreen()
              ],
            ),),
      ),
    );
  }
}
