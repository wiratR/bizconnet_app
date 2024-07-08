import 'package:flutter/material.dart';
import 'account_card_details.dart'; // Import the AccountCardDetails widget

class AccountCard extends StatelessWidget {
  final String name;
  final String position;
  final String email;
  final String phone;
  final String company;

  AccountCard({
    required this.name,
    required this.position,
    required this.email,
    required this.phone,
    required this.company,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => AccountCardDetails(
              name: name,
              position: position,
              email: email,
              phone: phone,
              company: company,
            ),
          ),
        );
      },
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: ListTile(
            leading: CircleAvatar(
              backgroundColor: Colors.transparent,
              child: Icon(
                Icons.person,
                color: Color(0xFF00C6FF),
                size: 40.0,
              ),
            ),
            title: Text(
              name,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  position,
                  style: TextStyle(fontSize: 16),
                ),
                Text(
                  company,
                  style: TextStyle(fontSize: 14, color: Colors.grey),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
