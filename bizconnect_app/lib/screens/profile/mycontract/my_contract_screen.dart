import 'package:flutter/material.dart';
import '../../../components/appbar/custom_app_bar.dart';
import '../../../components/card/account_card.dart';

class MyContractScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'My Contract'),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: ListView(
          children: [
            AccountCard(
              name: 'New Jeno',
              position: 'Jenosize Dev',
              email: 'new.jeno@jenosize.com',
              phone: '123-456-7890',
              company: 'Jenosize',
            ),
            SizedBox(height: 8.0),
            AccountCard(
              name: 'John Doe',
              position: 'Developer',
              email: 'john.doe@example.com',
              phone: '987-654-3210',
              company: 'Example Corp',
            ),
            SizedBox(height: 8.0),
            AccountCard(
              name: 'Jane Smith',
              position: 'Designer',
              email: 'jane.smith@example.com',
              phone: '555-666-7777',
              company: 'Creative Studio',
            ),
          ],
        ),
      ),
    );
  }
}
