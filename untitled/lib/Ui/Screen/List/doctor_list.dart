import 'package:flutter/material.dart';
import 'package:untitled/Var/variable.dart';

import '../../../Data/modul/doctor.dart';
DateTime currentDate = DateTime.now();
class CalendarLikeInterface extends StatefulWidget {
  @override
  _CalendarLikeInterfaceState createState() => _CalendarLikeInterfaceState();
}

class _CalendarLikeInterfaceState extends State<CalendarLikeInterface> {

  void _incrementDay() {
    setState(() {
      currentDate = currentDate.add(Duration(days: 1));
    });
  }

  void _decrementDay() {
    setState(() {
      currentDate = currentDate.subtract(Duration(days: 1));
    });
  }

  void _incrementMonth() {
    setState(() {
      currentDate = DateTime(currentDate.year, currentDate.month + 1, currentDate.day);
    });
  }

  void _decrementMonth() {
    setState(() {
      currentDate = DateTime(currentDate.year, currentDate.month - 1, currentDate.day);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  icon: Icon(Icons.arrow_back),
                  onPressed: _decrementMonth,
                ),
                Text(
                  '${currentDate.day} ${_getMonthName(currentDate.month)} ${currentDate.year}',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                IconButton(
                  icon: Icon(Icons.arrow_forward),
                  onPressed: _incrementMonth,
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                IconButton(
                  icon: Icon(Icons.arrow_back),
                  onPressed: _decrementDay,
                ),
                Text(
                  'Day ${currentDate.day}',
                  style: TextStyle(fontSize: 16),
                ),
                IconButton(
                  icon: Icon(Icons.arrow_forward),
                  onPressed: _incrementDay,
                ),
              ],
            ),

          ],
        ),
        DoctorVisitsList()
      ],
    );
  }

  String _getMonthName(int month) {
    final monthNames = [
      "January", "February", "March", "April", "May", "June",
      "July", "August", "September", "October", "November", "December"
    ];
    return monthNames[month - 1];
  }
}

class DoctorVisitsList extends StatelessWidget {
  final List<DoctorVisit> _visits = [
    DoctorVisit(
      patientName: 'Patient 1',
      visitDate: DateTime.now(),
      diagnosis: 'Diagnosis for Patient 1',
    ),
    DoctorVisit(
      patientName: 'Patient 2',
      visitDate: DateTime.now().add(Duration(days: 3)),
      diagnosis: 'Diagnosis for Patient 2',
    ),
    // Add more DoctorVisit objects here
  ];

  @override
  Widget build(BuildContext context) {
    return Container(height: screenHeight,
      child: ListView.builder(
        itemCount: _visits.length,
        itemBuilder: (context, index) {
          final visit = _visits[index];
          return currentDate.year == visit.visitDate.year &&
              currentDate.month == visit.visitDate.month &&
              currentDate.day == visit.visitDate.day?Card(
            margin: EdgeInsets.all(8),
            child: ListTile(
              title: Text(visit.patientName),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Visit Date: ${visit.visitDate.toLocal()}',
                    style: TextStyle(color: Colors.grey),
                  ),
                  Text(
                    'Diagnosis: ${visit.diagnosis}',
                    style: TextStyle(color: Colors.grey[700]),
                  ),
                ],
              ),
            ),
          ):Container();
        },
      ),
    );
  }
}
