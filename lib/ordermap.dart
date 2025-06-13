import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

class DeliveryTrackingScreen extends StatelessWidget {
  const DeliveryTrackingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // OpenStreetMap background
          FlutterMap(
            options: MapOptions(
              center: LatLng(37.7749, -122.4194), // San Francisco
              zoom: 13,
            ),
            children: [
              TileLayer(
                urlTemplate: 'https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png',
                subdomains: const ['a', 'b', 'c'],
              ),
              MarkerLayer(
                markers: [
                  Marker(
                    width: 60.0,
                    height: 60.0,
                    point: LatLng(37.7749, -122.4194),
                    child: const Icon(
                      Icons.location_pin,
                      size: 40,
                      color: Colors.red,
                    ),
                  ),
                ],
              ),
            ],
          ),

          // Back and location buttons
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CircleAvatar(
                    backgroundColor: Colors.white,
                    child: Icon(Icons.arrow_back, color: Colors.black),
                  ),
                  CircleAvatar(
                    backgroundColor: Colors.white,
                    child: Icon(Icons.my_location, color: Colors.black),
                  ),
                ],
              ),
            ),
          ),

          // Bottom sheet with courier info
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              padding: const EdgeInsets.all(20),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    width: 40,
                    height: 5,
                    decoration: BoxDecoration(
                      color: Colors.grey.shade400,
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  const SizedBox(height: 12),
                  const Text(
                    "10 minutes left",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                      color: Colors.black, // Set text color to black
                    ),
                  ),

                  const Text.rich(
                    TextSpan(
                      text: "Delivery to ",
                      style: TextStyle(color: Colors.grey),
                      children: [
                        TextSpan(
                          text: "Jl. Kpg Sutoyo",
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                  Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: const Color(0xFFF6F6F6),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: const Icon(Icons.delivery_dining, color: Colors.orange),
                      ),
                      const SizedBox(width: 10),
                      const Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Delivered your order",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.black, // Set this text to black
                              ),
                            ),
                            Text(
                              "We will deliver your goods to you in the shortest possible time.",
                              style: TextStyle(color: Colors.grey),
                            ),
                          ],

                        ),
                      ),
                    ],
                  ),
                  const Divider(height: 30),
                  Row(
                    children: const [
                      CircleAvatar(
                        radius: 25,
                        backgroundImage: AssetImage('assets/images/Profile.png'),
                      ),
                      SizedBox(width: 10),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Brooklyn Simmons",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.black, // Set text color to black
                              ),
                            ),
                            Text(
                              "Personal Courier",
                              style: TextStyle(color: Colors.grey),
                            ),
                          ],

                        ),
                      ),
                      CircleAvatar(
                        backgroundColor: Color(0xFFF6F6F6),
                        child: Icon(Icons.call, color: Colors.black),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
