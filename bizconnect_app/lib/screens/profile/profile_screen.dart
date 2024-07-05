import 'package:flutter/material.dart';
import './myqr/my_qr_screen.dart';
import './mycontract/my_contract_screen.dart'; 
import './myticket/my_ticket_screen.dart'; 
import './term/term_condition_screen.dart';
import './privateevent/private_event_screen.dart';
import './myaccount/my_account_screen.dart';


class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
      ),
      body: Scrollbar(
        thumbVisibility: true, // Always show the scrollbar thumb
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Column(
                  children: [
                    CircleAvatar(
                      radius: 50,
                      backgroundImage: AssetImage('assets/avatar.png'), // Use AssetImage to load an image from assets
                    ),
                    SizedBox(height: 10),
                    Text(
                      'Alif Jenosize',
                      style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      'alif@jenosize.com',
                      style: TextStyle(fontSize: 16, color: Colors.grey),
                    ),
                    SizedBox(height: 10),
                    ElevatedButton.icon(
                      onPressed: () {
                        // Navigate to MyQRScreen when button is pressed
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => MyQRScreen()),
                        );
                      },
                      icon: Icon(Icons.qr_code),
                      label: Text('My QR Code'),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xFF56BED6), // Change the button color to #56BED6
                        foregroundColor: Colors.white, // Change the text color to white
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
              Text(
                'Company: Jenosize',
                style: TextStyle(fontSize: 18),
              ),
              Text(
                'Position: Designer',
                style: TextStyle(fontSize: 18),
              ),
              Text(
                'Email: alif@jenosize.com',
                style: TextStyle(fontSize: 18),
              ),
              Text(
                'Phone: 0123456789',
                style: TextStyle(fontSize: 18),
              ),
              SizedBox(height: 20),
              ListTile(
                leading: Icon(Icons.confirmation_number, color: Color(0xFF56BED6)), // Change icon color to #56BED6
                title: Text('My Ticket'),
                trailing: Icon(Icons.arrow_forward_ios), 
                onTap: () {
                  // Navigate to MyTicketScreen when tapped
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => MyTicketScreen()),
                  );
                },
              ),
              ListTile(
                leading: Icon(Icons.event, color: Color(0xFF56BED6)), // Change icon color to #56BED6
                title: Text('Private Event'),
                trailing: Icon(Icons.arrow_forward_ios),
                onTap: () {
                  // Navigate to PrivateEventScreen when tapped
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => PrivateEventScreen()),
                  );
                },
              ),
              ListTile(
                leading: Icon(Icons.contact_mail, color: Color(0xFF56BED6)), // Change icon color to #56BED6
                title: Text('My Contact'),
                trailing: Icon(Icons.arrow_forward_ios),
                onTap: () {
                  // Navigate to MyContractScreen when tapped
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => MyContractScreen()),
                  );
                },
              ),
              ListTile(
                leading: Icon(Icons.description, color: Color(0xFF56BED6)), // Change icon color to #56BED6
                title: Text('Term and Condition'),
                trailing: Icon(Icons.arrow_forward_ios),
                onTap: () {
                  // Navigate to Term Condition Screen when tapped
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => TermConditionScreen()),
                  );
                },
              ),
              ListTile(
                leading: Icon(Icons.account_circle, color: Color(0xFF56BED6)), // Change icon color to #56BED6
                title: Text('My Account'),
                trailing: Icon(Icons.arrow_forward_ios),
                onTap: () {
                  // Navigate to MyAccountScreen when tapped
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => MyAccountScreen()),
                  );
                },
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 3, // Set the current index to 'Profile'
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.event),
            label: 'My Event',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'My Favorite',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
        onTap: (index) {
          // Handle navigation based on the selected index
          switch (index) {
            case 0:
              // Navigate to Home screen
              break;
            case 1:
              // Navigate to My Event screen
              break;
            case 2:
              // Navigate to My Favorite screen
              break;
            case 3:
              // Stay on Profile screen
              break;
          }
        },
      ),
    );
  }
}
