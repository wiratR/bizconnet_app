import 'package:flutter/material.dart';
import '../appbar/custom_app_bar.dart'; // Ensure the correct import path

class AccountCardDetails extends StatelessWidget {
  final String name;
  final String position;
  final String email;
  final String phone;
  final String company;

  AccountCardDetails({
    required this.name,
    required this.position,
    required this.email,
    required this.phone,
    required this.company,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'Contract Detail'), // Using 'Back' as in the design
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CircleAvatar(
              backgroundColor: Colors.transparent,
              radius: 50.0,
              child: Icon(
                Icons.person,
                color: Color(0xFF00C6FF),
                size: 60.0,
              ),
            ),
            SizedBox(height: 16),
            Text(
              name,
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Color(0xFF05334D),
              ),
            ),
            SizedBox(height: 24),
            _buildDetailRow('Company', company),
            _buildDetailRow('Position', position),
            _buildDetailRow('Email', email),
            _buildDetailRow('Phone', phone),
            Spacer(),
            ElevatedButton(
              onPressed: () {
                // Add your save contact functionality here
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFF60D0FA),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                padding: EdgeInsets.symmetric(vertical: 16, horizontal: 40),
              ),
              child: Text(
                'SAVE CONTACT TO PHONE',
                style: TextStyle(fontSize: 16, color: Colors.white),
              ),
            ),
            SizedBox(height: 16),
          ],
        ),
      ),
    );
  }

  // Widget _buildDetailRow(String label, String value) {
  // return Padding(
  //     padding: const EdgeInsets.symmetric(vertical: 8.0),
  //     child: Row(
  //       crossAxisAlignment: CrossAxisAlignment.start,
  //       children: [
  //         Expanded(
  //           flex: 1,
  //           child: Text(
  //             '$label : ',
  //             style: TextStyle(
  //               fontSize: 16,
  //               color: Color(0xFF05334D),
  //               fontWeight: FontWeight.bold,
  //             ),
  //           ),
  //         ),
  //         Expanded(
  //           flex: 3,
  //           child: Text(
  //             value,
  //             style: TextStyle(
  //               fontSize: 16,
  //               color: Color(0xFF05334D),
  //             ),
  //           ),
  //         ),
  //       ],
  //     ),
  //   );
  // }
  Widget _buildDetailRow(String label, String value) {
  return Padding(
    padding: EdgeInsets.symmetric(horizontal: 24.0),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          flex: 1,
          child: Text(
            '$label   : ',
            style: TextStyle(
              fontSize: 16,
              color: Color(0xFF05334D),
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Expanded(
          flex: 2,
          child: Text(
            value,
            style: TextStyle(
              fontSize: 16,
              color: Color(0xFF05334D),
            ),
          ),
        ),
      ],
    ),
  );
}


}
