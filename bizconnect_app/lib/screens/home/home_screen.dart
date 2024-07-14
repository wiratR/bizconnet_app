import 'package:flutter/material.dart';
import '../login/login_screen.dart';
import '../profile/profile_screen.dart';          // Import the ProfileScreen
import '../qrscan/qr_scan_screen.dart';           // Import the QrScanScreen
import '../event/event_screen.dart';              // Import the MyEventScreen
import '../favorite/favorite_screen.dart';        // Import the MyFavoriteScreen
import '../../components/card/custom_card.dart';  // Import custom card
import './popularevents/popular_view_all.dart';   // Import propular view all
import './specialevents/special_view_all.dart';   // Import special view all
import '../../services/auth/auth_service.dart';   // Import service for authentication


class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final AuthService authService = AuthService();
  int _selectedIndex = 0;
  final Color selectedColor = Color(0xFF56BED6);
  final Color unselectedColor = Color(0xFF91A6C4);

  @override
  void initState() {
    super.initState();
    _checkAuthentication();
  }

  void _checkAuthentication() async {
    bool isAuthenticated = await authService.isAuthenticated();
    if (!isAuthenticated) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => LoginScreen()),
      );
    }
  }

  void _logout(BuildContext context) async {
    await authService.logout();
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => LoginScreen()),
    );
  }

  void _openQRScanner() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => QrScanScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60.0),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(20),
              bottomRight: Radius.circular(20),
            ),
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Color(0xFF0081DC),
                Color(0xFF60D0FA),
                Color(0xFF62D5D8),
              ],
            ),
          ),
          child: AppBar(
            title: Text(
              'BizConnect',
              style: TextStyle(color: Colors.white),
            ),
            backgroundColor: Colors.transparent,
            elevation: 0,
            leading: IconButton(
              icon: Icon(Icons.logout),
              onPressed: () {
                _logout(context);
              },
            ),
            actions: [
              IconButton(
                icon: Icon(Icons.qr_code_scanner),
                onPressed: _openQRScanner,
              ),
            ],
          ),
        ),
      ),
      body: _buildBody(),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color(0xFF0081DC),
              Color(0xFF60D0FA),
              Color(0xFF62D5D8),
            ],
          ),
        ),
        child: BottomNavigationBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          currentIndex: _selectedIndex,
          selectedItemColor: selectedColor,
          unselectedItemColor: unselectedColor,
          onTap: _onItemTapped,
          items: const <BottomNavigationBarItem>[
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
        ),
      ),
    );
  }

  Widget _buildBody() {
    
    switch (_selectedIndex) {
      case 0:
        return _buildHomeContent();
      case 1:
        return EventScreen(); // Navigate to My Event Screen
      case 2:
        return FavoriteScreen(); // Navigate to My Favorite Screen
      case 3:
        return ProfileScreen(); // Navigate to Profile Screen
      default:
        return Container();
    }
  }

Widget _buildHomeContent() {
  return SingleChildScrollView (
    child: Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Popular Events',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => PopularViewAllScreen()),
                  );
                },
                child: Text(
                  'view all',
                  style: TextStyle(
                    color: Colors.blue,
                    decoration: TextDecoration.underline,
                    decorationColor: Colors.blue, // Same color as the text
                  ),
                ),
              ),
            ],
          ),
          // create card
          Row(
            children: [
              Flexible(
                child: CustomCard(
                  title: 'Card Title 1',
                  description: 'This is the description for card 1.',
                  imageUrl: 'https://via.placeholder.com/150',
                  onTap: () {
                    // print('Card 1 tapped');
                  },
                ),
              ),
              // Flexible(
              //   child: CustomCard(
              //     title: 'Card Title 2',
              //     description: 'This is the description for card 2.',
              //     imageUrl: 'https://via.placeholder.com/150',
              //     onTap: () {
              //       print('Card 2 tapped');
              //     },
              //   ),
              // ),
            ],
          ),
          // 
        ],
      ),
    ),
  );

} 

// Widget _buildHomeContent() {
//     return SingleChildScrollView(
//       child: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.stretch,
//           children: [
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 Text(
//                   'Popular Events',
//                   style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//                 ),
//                 TextButton(
//                   onPressed: () {
//                     Navigator.push(
//                       context,
//                       MaterialPageRoute(builder: (context) => PopularViewAllScreen()),
//                     );
//                   },
//                   child: Text(
//                     'view all',
//                     style: TextStyle(
//                       color: Colors.blue,
//                       decoration: TextDecoration.underline,
//                       decorationColor: Colors.blue, // Same color as the text
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//             Row(
//               // mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 CustomCard(
//                   title: 'Card Title 1',
//                   description: 'This is the description for card 1.',
//                   imageUrl: 'https://via.placeholder.com/150',
//                   onTap: () {
//                     print('Card 1 tapped');
//                   },
//                 ),
//               ],
//             ),
//             // SizedBox(height: 10),
//             // Row(
//             //   children: [
//             //     CustomCard(
//             //       title: 'Card Title 1',
//             //       description: 'This is the description for card 1.',
//             //       imageUrl: 'https://via.placeholder.com/150',
//             //       onTap: () {
//             //         print('Card 1 tapped');
//             //       },
//             //     ),
//             //     // Expanded(
//             //     //   child: CustomCard(), // Left card
//             //     // ),
//             //     // SizedBox(width: 10), // Space between cards
//             //     // Expanded(
//             //     //   child: CustomCard(), // Right card
//             //     // ),
//             //   ],
//             // ),
//             // // SizedBox(height: 20), // Space between sections
//             // Row(
//             //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             //   children: [
//             //     Text(
//             //       'Special Events',
//             //       style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//             //     ),
//             //     TextButton(
//             //       onPressed: () {
//             //         Navigator.push(
//             //           context,
//             //           MaterialPageRoute(builder: (context) => SpecialViewAllScreen()),
//             //         );
//             //       },
//             //       child: Text(
//             //         'view all',
//             //         style: TextStyle(
//             //           color: Colors.blue,
//             //           decoration: TextDecoration.underline,
//             //           decorationColor: Colors.blue, // Same color as the text
//             //         ),
//             //       ),
//             //     ),
//             //   ],
//             // ),
//             // Text(
//             //   'Special Events',
//             //   style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//             // ),
//             // SizedBox(height: 10),
//             // Row(
//             //   children: [
//             //     Expanded(
//             //       child: CustomCard(), // Left card
//             //     ),
//             //     SizedBox(width: 10), // Space between cards
//             //     Expanded(
//             //       child: CustomCard(), // Right card
//             //     ),
//             //   ],
//             // ),
//             // Add more rows or other content as needed
//           ],
//         ),
//       ),
//     );
//   }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
}
