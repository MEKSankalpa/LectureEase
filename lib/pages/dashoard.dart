import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:lecture_ease/pages/login_screen.dart';

class DashboardScreen extends StatefulWidget {
  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Hi, Mahishi'),
        actions: [
          IconButton(
            icon: Icon(Icons.notifications),
            onPressed: () {
              // Add notification functionality here
            },
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Color(0xFF4A90E2), // Primary color
                    Color(0xFF50E3C2), // Secondary color
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircleAvatar(
                    radius: 40, // Adjust the size as needed
                    backgroundImage: AssetImage(
                        'assets/images/profile.jpeg'), // Replace with your image URL or AssetImage
                  ),
                  SizedBox(height: 10), // Spacing between image and name
                  Text(
                    'Mahishi Caldera', // Replace with the user's name
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                    ),
                  ),
                ],
              ),
            ),

            ListTile(
              leading: Icon(Icons.home),
              title: Text('Home'),
              onTap: () {
                // Add navigation to home
              },
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text('Settings'),
              onTap: () {
                // Add navigation to settings
              },
            ),
            Container(
              height: 430, // Adjust the height as needed
            ),

            // Sign Out button placed at the very bottom of the drawer
            ListTile(
              leading: Icon(Icons.logout, color: Colors.red),
              title: Text(
                'Sign Out',
                style: TextStyle(color: Colors.red),
              ),
              onTap: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => LoginScreen()),
                );
              },
            ),
          ],
        ),
      ),
      body: Padding( 
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Attendance Report Section
            Text(
              'Attendance Report',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),
            // This could be a custom widget showing a bar chart
            Container(
              height: 200,
              child: BarChart(
                BarChartData(
                  alignment: BarChartAlignment.spaceAround,
                  maxY: 20,
                  barTouchData: BarTouchData(enabled: false),
                  titlesData: FlTitlesData(
                    show: true,
                    bottomTitles: AxisTitles(
                      sideTitles: SideTitles(
                        showTitles: true,
                        getTitlesWidget: (value, meta) {
                          const titles = ['Mon', 'Tue', 'Wed', 'Thu', 'Fri'];
                          return Text(titles[value.toInt()]);
                        },
                        reservedSize: 32,
                      ),
                    ),
                    leftTitles: AxisTitles(
                      sideTitles: SideTitles(showTitles: false),
                    ),
                  ),
                  borderData: FlBorderData(show: false),
                  barGroups: [
                    BarChartGroupData(x: 0, barRods: [
                      BarChartRodData(toY: 15, color: Colors.lightBlueAccent)
                    ]),
                    BarChartGroupData(x: 1, barRods: [
                      BarChartRodData(toY: 18, color: Colors.lightBlueAccent)
                    ]),
                    BarChartGroupData(x: 2, barRods: [
                      BarChartRodData(toY: 16, color: Colors.lightBlueAccent)
                    ]),
                    BarChartGroupData(x: 3, barRods: [
                      BarChartRodData(toY: 19, color: Colors.lightBlueAccent)
                    ]),
                    BarChartGroupData(x: 4, barRods: [
                      BarChartRodData(toY: 10, color: Colors.lightBlueAccent)
                    ]),
                  ],
                ),
              ),
            ),
            SizedBox(height: 24),
            // Upcoming Lectures Section
            Text(
              'Upcoming Lecture',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Container(
              padding: EdgeInsets.all(12),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Monday, 08th August 2024',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 8),
                  LectureScheduleItem(
                      time: '08.00 A.M - 10.00 A.M',
                      subject: 'Human Computer Interactions'),
                  LectureScheduleItem(
                      time: '10.00 A.M - 12.00 A.M',
                      subject: 'Human Computer Interactions'),
                  LectureScheduleItem(
                      time: '13.00 A.M - 15.00 A.M',
                      subject: 'Human Computer Interactions'),
                  LectureScheduleItem(
                      time: '15.00 A.M - 17.00 A.M',
                      subject: 'Human Computer Interactions'),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.blue,
        onTap: _onItemTapped,
      ),
    );
  }
}

class LectureScheduleItem extends StatelessWidget {
  final String time;
  final String subject;

  LectureScheduleItem({required this.time, required this.subject});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        children: [
          Icon(Icons.schedule, size: 16),
          SizedBox(width: 8),
          Expanded(
            child: Text('$time : $subject'),
          ),
        ],
      ),
    );
  }
}
