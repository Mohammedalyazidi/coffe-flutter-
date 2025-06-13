import 'package:flutter/material.dart';

import 'ordermap.dart';

void main() => runApp(OrderPageApp());

class OrderPageApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Order Page',
      home: OrderPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class OrderPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: Text('Order', style: TextStyle(color: Colors.black)),
        centerTitle: true,
        leading: Icon(Icons.arrow_back, color: Colors.black),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            // Toggle: Deliver / Pick Up
            Row(
              children: [
                Expanded(
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 10),
                    decoration: BoxDecoration(
                      color: Color(0xFFD17D4B),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    alignment: Alignment.center,
                    child: Text(
                      'Deliver',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 10),
                    decoration: BoxDecoration(
                      color: Colors.grey.shade200,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    alignment: Alignment.center,
                    child: Text(
                      'Pick Up',
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),

            // Delivery Address
            Text('Delivery Address', style: TextStyle(fontWeight: FontWeight.bold)),
            SizedBox(height: 5),
            Text('Jl. Kpg Sutoyo', style: TextStyle(fontWeight: FontWeight.w600)),
            Text('Kpg. Sutoyo No. 620, Bilzen, Tanjungbalai.'),
            Row(
              children: [
                OutlinedButton.icon(
                  onPressed: () {},
                  icon: Icon(Icons.edit, size: 16),
                  label: Text('Edit Address'),
                ),
                SizedBox(width: 10),
                OutlinedButton.icon(
                  onPressed: () {},
                  icon: Icon(Icons.note_add_outlined, size: 16),
                  label: Text('Add Note'),
                ),
              ],
            ),
            Divider(),

            // Coffee Item
            Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.asset('assets/images/mocha.png', width: 60, height: 60, fit: BoxFit.cover),
                ),
                SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Caffe Mocha', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                      Text('Deep Foam', style: TextStyle(color: Colors.grey)),
                    ],
                  ),
                ),
                Row(
                  children: [
                    Icon(Icons.remove_circle_outline),
                    SizedBox(width: 8),
                    Text('1'),
                    SizedBox(width: 8),
                    Icon(Icons.add_circle_outline),
                  ],
                ),
              ],
            ),
            Divider(),

            // Discount
            ListTile(
              leading: Icon(Icons.local_offer_outlined, color: Colors.orange),
              title: Text('1 Discount is Applies'),
              trailing: Icon(Icons.arrow_forward_ios, size: 16),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              tileColor: Colors.grey.shade100,
            ),
            SizedBox(height: 20),

            // Payment Summary
            Text('Payment Summary', style: TextStyle(fontWeight: FontWeight.bold)),
            SizedBox(height: 10),
            _summaryRow('Price', '\$4.53'),
            _summaryRow('Delivery Fee', '\$2.0', discounted: true, finalPrice: '\$1.0'),
            SizedBox(height: 20),

            // Wallet
            Container(
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.grey.shade100,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                children: [
                  Icon(Icons.account_balance_wallet_outlined, color: Colors.orange),
                  SizedBox(width: 10),
                  Text('Cash/Wallet', style: TextStyle(fontWeight: FontWeight.bold)),
                  Spacer(),
                  Text('\$5.53', style: TextStyle(color: Colors.orange, fontWeight: FontWeight.bold)),
                ],
              ),
            ),
            SizedBox(height: 20),

            // Order Button
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFFD17D4B),
                padding: EdgeInsets.symmetric(vertical: 14),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => DeliveryTrackingScreen()),
                );
              },
              child: Text(
                'Order',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.white, // Set text color to white
                ),
              ),

            ),

          ],
        ),
      ),
    );
  }

  Widget _summaryRow(String label, String price, {bool discounted = false, String? finalPrice}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(label),
        discounted
            ? Row(
          children: [
            Text(price, style: TextStyle(decoration: TextDecoration.lineThrough, color: Colors.grey)),
            SizedBox(width: 5),
            Text(finalPrice ?? '', style: TextStyle(fontWeight: FontWeight.bold)),
          ],
        )
            : Text(price, style: TextStyle(fontWeight: FontWeight.bold)),
      ],
    );
  }
}
