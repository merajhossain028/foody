import 'package:flutter/material.dart';
import 'package:foody/models/restaurants_model.dart';

class RestaurantPage extends StatefulWidget {
  final RestaurantsModel? restaurant;

  const RestaurantPage({
    super.key,
    required this.restaurant,
  });

  @override
  State<RestaurantPage> createState() => _RestaurantPageState();
}

class _RestaurantPageState extends State<RestaurantPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          widget.restaurant!.title.toString(),
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
      ),
    );
  }
}
