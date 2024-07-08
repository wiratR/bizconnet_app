import 'package:flutter/material.dart';

class PrivateEventDialog extends StatefulWidget {
  @override
  _PrivateEventDialogState createState() => _PrivateEventDialogState();
}

class _PrivateEventDialogState extends State<PrivateEventDialog> {
  TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(10.0)),
      ),
      contentPadding: EdgeInsets.all(16.0),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'Add Private Event by code',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 16),
          TextField(
            controller: _controller,
            decoration: InputDecoration(
              hintText: 'Enter code',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
            ),
          ),
          SizedBox(height: 16),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFF00C6FF), // Submit button background color
                foregroundColor: Colors.white, // Submit button text color
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                padding: EdgeInsets.symmetric(vertical: 12.0, horizontal: 24.0),
              ),
              onPressed: () {
                // Handle submit action
              },
              child: Text('SUBMIT'),
            ),
          ),
          SizedBox(height: 8),
          SizedBox(
            width: double.infinity,
            child: OutlinedButton(
              style: OutlinedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                side: BorderSide(color: Color(0xFF00C6FF)), // Close button border color
                padding: EdgeInsets.symmetric(vertical: 12.0, horizontal: 24.0),
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text(
                'CLOSE',
                style: TextStyle(
                  color: Color(0xFF00C6FF), // Close button text color
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
