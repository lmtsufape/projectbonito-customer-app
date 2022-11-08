import 'package:device_preview/device_preview.dart';
import 'package:ecommercebonito/screens/first/first_screen.dart';
import 'package:ecommercebonito/screens/home/cart.screen.dart';
import 'package:ecommercebonito/screens/home/favorite_screen.dart';
import 'package:ecommercebonito/screens/home/finalize_purchase_screen.dart';
import 'package:ecommercebonito/screens/home/home_screen.dart';
import 'package:ecommercebonito/screens/home/menu_screen.dart';
import 'package:ecommercebonito/screens/home/menu_seller_screen.dart';
import 'package:ecommercebonito/screens/profile/adress_screen.dart';
import 'package:ecommercebonito/screens/profile/card_screen.dart';
import 'package:ecommercebonito/screens/profile/profile_screen.dart';
import 'package:ecommercebonito/screens/profile/select_adress_screen.dart';
import 'package:ecommercebonito/screens/profile/select_card_screen.dart';
import 'package:ecommercebonito/screens/register/register_adress.dart';
import 'package:ecommercebonito/screens/register/register_screen.dart';
import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_wrapper.dart';
import 'package:ecommercebonito/screens/screens_index.dart';
import 'screens/profile/purchases_screen.dart';
import 'screens/signin/sign_in_screen.dart';
import 'screens/splash/splash_screen.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      useInheritedMediaQuery: true,
      locale: DevicePreview.locale(context),
      builder: (context, child) {
        return DevicePreview.appBuilder(
            context,
            ResponsiveWrapper.builder(child,
                minWidth: 640,
                maxWidth: 1980,
                defaultScale: true,
                breakpoints: const [
                  ResponsiveBreakpoint.resize(480, name: MOBILE),
                  ResponsiveBreakpoint.resize(768, name: TABLET),
                  ResponsiveBreakpoint.resize(1024, name: DESKTOP),
                ]));
      },
      debugShowCheckedModeBanner: false,
      home: const SplashScreen(),
      routes: {
        Screens.splash: (BuildContext context) => const SplashScreen(),
        // Screens.carrousel: (BuildContext context) => const CarrouselScreen(),
        Screens.home: (BuildContext context) => const HomeScreen(),
        Screens.signin: (BuildContext context) => const SignInScreen(),
        Screens.register: (BuildContext context) => const RegisterScreen(),
        Screens.registerAdress: (BuildContext context) =>
            const RegisterAdress(),
        Screens.first: (BuildContext context) => const FirstScreen(),
        Screens.profile: (BuildContext context) => const ProfileScreen(),
        Screens.favorite: (BuildContext context) => FavoriteScreen(),
        Screens.purchases: (BuildContext context) => const PurchasesScreen(),
        Screens.adress: (BuildContext context) => const AdressScreen(),
        Screens.payment: (BuildContext context) => const CardScreen(),
        Screens.selectAdress: (BuildContext context) => const SelectAdress(),
        Screens.selectCard: (BuildContext context) => const SelectCard(),
        Screens.menu: (BuildContext context) => const MenuScreen(),
        Screens.menuSeller: (BuildContext context) => const MenuSellerScreen(),
        Screens.cart: (BuildContext context) => const CartScreen(),
        Screens.FinalizePurchase: (BuildContext context) =>
            const FinalizePurchaseScreen(),
      },
    );
  }
}
