import 'package:flutter/material.dart';
import '../../components/card/event_card.dart';

class EventScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Event'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            EventCard(title: "Today's Event", count: 3),
            SizedBox(height: 16),
            EventCard(title: 'Upcoming Event', count: 0),
            SizedBox(height: 16),
            EventCard(title: 'Past Event', count: 12),
          ],
        ),
      ),
      // Center(
      //   child: Text('My Event Screen Content'),
      // ),
    );
  }
}
