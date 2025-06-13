import 'package:flutter/material.dart';

import 'order.dart';

class DetailPage extends StatefulWidget {
  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  String selectedSize = 'M';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: Icon(Icons.arrow_back, color: Colors.black),
        centerTitle: true,
        title: Text("Detail", style: TextStyle(color: Colors.black)),
        actions: [
          IconButton(
            icon: Icon(Icons.favorite_border, color: Colors.black),
            onPressed: () {},
          ),
        ],
      ),
      body: ListView(
        padding: EdgeInsets.all(16),
        children: [
          // Image
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Image.asset(
              'assets/images/mocha.png',
              height: 200,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(height: 16),

          // Title and Icons
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Caffe Mocha",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    Text("Ice/Hot", style: TextStyle(color: Colors.grey)),
                    SizedBox(height: 8),
                    Row(
                      children: [
                        Icon(Icons.star, color: Colors.amber, size: 18),
                        SizedBox(width: 4),
                        Text("4.8", style: TextStyle(fontWeight: FontWeight.bold)),
                        Text(" (230)", style: TextStyle(color: Colors.grey)),
                      ],
                    ),
                  ],
                ),
              ),
              Row(
                children: [
                  _iconBox(Icons.delivery_dining),
                  _iconBox(Icons.coffee),
                  _iconBox(Icons.local_drink),
                ],
              )
            ],
          ),
          Divider(height: 30),

          // Description
          Text(
            "Description",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
              color: Colors.black,
            ),
          ),

          SizedBox(height: 8),
          RichText(
            text: TextSpan(
              style: TextStyle(color: Colors.grey),
              children: [
                TextSpan(text: "A cappuccino is an approximately 150 ml (5 oz) beverage, with 25 ml of espresso coffee and 85ml of fresh milk the fo.. "),
                TextSpan(
                  text: "Read More",
                  style: TextStyle(color: Color(0xFFD17D4B), fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          SizedBox(height: 20),

          // Size Selection
          Text(
            "Size",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
              color: Colors.black,
            ),
          ),
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: ['S', 'M', 'L'].map((size) {
              return _sizeOption(size);
            }).toList(),
          ),
          SizedBox(height: 30),

          // Price and Buy Now Button
          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Price", style: TextStyle(color: Colors.grey)),
                    Text("\$ 4.53", style: TextStyle(fontSize: 20, color: Color(0xFFD17D4B), fontWeight: FontWeight.bold)),
                  ],
                ),
              ),
              Expanded(
                flex: 2,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFFD17D4B),
                    padding: EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => OrderPageApp()),
                    );
                  },
                  child: Text(
                    "Buy Now",
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.white, // Set text color to white
                    ),
                  ),
                ),
              ),

            ],
          ),
        ],
      ),
    );
  }

  Widget _iconBox(IconData icon) {
    return Container(
      margin: EdgeInsets.only(left: 8),
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Color(0xFFF9F5F1),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Icon(icon, color: Color(0xFFD17D4B), size: 20),
    );
  }

  Widget _sizeOption(String size) {
    final isSelected = selectedSize == size;
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedSize = size;
        });
      },
      child: Container(
        width: 70,
        padding: EdgeInsets.symmetric(vertical: 10),
        decoration: BoxDecoration(
          color: isSelected ? Color(0xFFF9F5F1) : Colors.white,
          border: Border.all(color: Color(0xFFD17D4B)),
          borderRadius: BorderRadius.circular(12),
        ),
        alignment: Alignment.center,
        child: Text(
          size,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: isSelected ? Color(0xFFD17D4B) : Colors.black,
          ),
        ),
      ),
    );
  }
}
