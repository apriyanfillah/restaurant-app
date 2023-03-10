import 'package:restaurant_app/common/constant.dart';
import 'package:restaurant_app/common/style.dart';
import 'package:restaurant_app/data/api/api_service.dart';
import 'package:restaurant_app/provider/restaurant_provider.dart';
import 'package:restaurant_app/widgets/detail_restaurant.dart';
import 'package:restaurant_app/widgets/home_screen.dart';
import 'package:restaurant_app/widgets/search_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<RestaurantProvider>(
          create: (context) => RestaurantProvider(
            apiService: ApiService(),
          ),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          textTheme: customTheme,
          colorScheme: Theme.of(context).colorScheme.copyWith(
                primary: primary,
                onPrimary: onPrimary,
                secondary: secondary,
                onSecondary: onSecondary,
              ),
        ),
        debugShowCheckedModeBanner: false,
        initialRoute: HomeScreen.routeName,
        routes: {
          HomeScreen.routeName: (context) => const HomeScreen(),
          DetailRestaurant.routeName: (context) => DetailRestaurant(
              restaurantId:
                  ModalRoute.of(context)?.settings.arguments as String),
          SearchScreen.routeName: (context) => SearchScreen(
              query: ModalRoute.of(context)?.settings.arguments as String),
        },
      ),
    );
  }
}
