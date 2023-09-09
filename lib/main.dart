import 'dart:ui';

import 'package:ecommerce_store/bloc/authentication/auth_bloc.dart';
import 'package:ecommerce_store/bloc/category/category_bloc.dart';
import 'package:ecommerce_store/constants/colors.dart';
import 'package:ecommerce_store/data/dataSource/authentication_datasource.dart';
import 'package:ecommerce_store/data/repository/authentication_repository.dart';
import 'package:ecommerce_store/di/di.dart';
import 'package:ecommerce_store/screens/cart_screen.dart';
import 'package:ecommerce_store/screens/login_screen.dart';
import 'package:ecommerce_store/screens/product_details_screen.dart';
import 'package:ecommerce_store/screens/product_list_screen.dart';
import 'package:ecommerce_store/screens/category_screen.dart';
import 'package:ecommerce_store/screens/home_screen.dart';
import 'package:ecommerce_store/screens/profile_screen.dart';
import 'package:ecommerce_store/util/auth_manager.dart';
import 'package:ecommerce_store/widgets/myBehavior.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await getItInit();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var selectedBottomNavigationIndex = 0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      scrollBehavior: MyBehavior(),
      theme: ThemeData(),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body:
            // BlocProvider(
            //   create: ((context) => AuthBloc()),
            //   child: LoginScreen(),
            // )
            IndexedStack(
          index: selectedBottomNavigationIndex,
          children: botNavigation(),
        ),
        bottomNavigationBar: ClipRRect(
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 40, sigmaY: 40),
            child: BottomNavigationBar(
              onTap: (int index) {
                setState(() {
                  selectedBottomNavigationIndex = index;
                });
              },
              currentIndex: selectedBottomNavigationIndex,
              type: BottomNavigationBarType.fixed,
              backgroundColor: Colors.transparent,
              elevation: 0,
              unselectedLabelStyle: const TextStyle(
                fontSize: 10,
                fontFamily: 'RB',
                color: Colors.black,
              ),
              selectedLabelStyle: const TextStyle(
                fontSize: 10,
                fontFamily: 'RB',
                color: ConstColor.blue,
              ),
              items: [
                BottomNavigationBarItem(
                    icon: Image.asset('assets/images/icon_profile.png'),
                    activeIcon: Padding(
                      padding: const EdgeInsets.only(bottom: 3),
                      child: Container(
                        child: Image.asset(
                            'assets/images/icon_profile_active.png'),
                        decoration: const BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: ConstColor.blue,
                              blurRadius: 20,
                              spreadRadius: -7,
                              offset: Offset(0.0, 13),
                            ),
                          ],
                        ),
                      ),
                    ),
                    label: "Profile"),
                BottomNavigationBarItem(
                    icon: Image.asset('assets/images/icon_basket.png'),
                    activeIcon: Padding(
                      padding: const EdgeInsets.only(bottom: 3),
                      child: Container(
                        child:
                            Image.asset('assets/images/icon_basket_active.png'),
                        decoration: const BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: ConstColor.blue,
                              blurRadius: 20,
                              spreadRadius: -7,
                              offset: Offset(0.0, 13),
                            ),
                          ],
                        ),
                      ),
                    ),
                    label: "Cart"),
                BottomNavigationBarItem(
                    icon: Image.asset('assets/images/icon_category.png'),
                    activeIcon: Padding(
                      padding: const EdgeInsets.only(bottom: 3),
                      child: Container(
                        child: Image.asset(
                            'assets/images/icon_category_active.png'),
                        decoration: const BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: ConstColor.blue,
                              blurRadius: 20,
                              spreadRadius: -7,
                              offset: Offset(0.0, 13),
                            ),
                          ],
                        ),
                      ),
                    ),
                    label: "Category"),
                BottomNavigationBarItem(
                    icon: Image.asset('assets/images/icon_home.png'),
                    activeIcon: Padding(
                      padding: const EdgeInsets.only(bottom: 3),
                      child: Container(
                        child:
                            Image.asset('assets/images/icon_home_active.png'),
                        decoration: const BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: ConstColor.blue,
                              blurRadius: 20,
                              spreadRadius: -7,
                              offset: Offset(0.0, 13),
                            ),
                          ],
                        ),
                      ),
                    ),
                    label: "home"),
              ],
            ),
          ),
        ),
      ),
    );
  }

  List<Widget> botNavigation() {
    return <Widget>[
      const ProfileScreen(),
      const CartScreen(),
      BlocProvider(create: (context)=> CategoryBloc(), child: CategoryScreen(),),
      const HomeScreen()
    ];
  }
}
