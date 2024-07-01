// import 'package:flutter/material.dart';
// import 'package:bizconnectapp/routes/login_route.dart';

// void main() => runApp(MyApp());

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       onGenerateRoute: LoginRoute.generateRoute,
//       // Define more MaterialApp properties as needed
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'routes/app_routes.dart';

void main() {
  runApp(BizConnectApp());
}

class BizConnectApp extends StatelessWidget {
  // @override
  // Widget build(BuildContext context) {
  //   return MaterialApp(
  //     title: 'BizConnect App',
  //     theme: ThemeData(
  //       primarySwatch: Colors.blue,
  //     ),
  //     initialRoute: AppRoutes.login,
  //     routes: AppRoutes.getRoutes(),
  //   );
  // }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      onGenerateRoute: AppRoutes.getRoutes,
      // Define more MaterialApp properties as needed
    );
  }
}