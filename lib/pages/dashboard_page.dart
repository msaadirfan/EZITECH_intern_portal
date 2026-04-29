import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildWelcomeCard(),
          const SizedBox(height: 24),

          // HEADER
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Quick Overview',
                style: GoogleFonts.inter(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Row(
                children: [
                  Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(color: Colors.grey.shade200),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: const Row(
                      children: [
                        Text('Today', style: TextStyle(fontSize: 12)),
                        Icon(Icons.keyboard_arrow_down, size: 14),
                      ],
                    ),
                  ),
                  const SizedBox(width: 8),
                  Container(
                    padding: const EdgeInsets.all(6),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(color: Colors.grey.shade200),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: const Icon(
                      Icons.calendar_month,
                      size: 18,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ],
          ),

          const SizedBox(height: 16),

          // FIXED: Wrap instead of GridView (avoids overflow)
          Wrap(
            spacing: 16,
            runSpacing: 16,
            children: _stats()
                .map((e) => SizedBox(
                      width: (MediaQuery.of(context).size.width / 2) - 30,
                      child: _buildStatCard(e),
                    ))
                .toList(),
          ),

          const SizedBox(height: 24),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Recent Activities',
                style:
                    GoogleFonts.inter(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              TextButton(
                onPressed: () {},
                child: const Text('View All'),
              ),
            ],
          ),

          const SizedBox(height: 12),

          _buildActivitiesList(),
        ],
      ),
    );
  }

  // ---------------- WELCOME CARD ----------------
  Widget _buildWelcomeCard() {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: const Color(0xFFEFF6FF),
        borderRadius: BorderRadius.circular(20),
      ),
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Welcome back,',
              style: TextStyle(color: Colors.grey, fontSize: 16)),
          SizedBox(height: 4),
          Text('Admin!',
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold)),
          SizedBox(height: 12),
          Text("Here's what's happening in your portal today.",
              style: TextStyle(color: Colors.grey)),
        ],
      ),
    );
  }

  // ---------------- STATS ----------------
  List<Map<String, dynamic>> _stats() => [
        {
          'label': 'Total Interns',
          'value': '1,248',
          'trend': '+12.5%',
          'icon': Icons.people,
          'color': Colors.blue
        },
        {
          'label': 'Active Interns',
          'value': '842',
          'trend': '+10.3%',
          'icon': Icons.verified_user,
          'color': Colors.green
        },
        {
          'label': 'Projects',
          'value': '156',
          'trend': '+8.7%',
          'icon': Icons.work,
          'color': Colors.purple
        },
        {
          'label': 'Tasks',
          'value': '3,421',
          'trend': '+15.2%',
          'icon': Icons.check_box,
          'color': Colors.orange
        },
        {
          'label': 'Pending',
          'value': '642',
          'trend': '-6.1%',
          'icon': Icons.access_time,
          'color': Colors.red
        },
        {
          'label': 'Invoices',
          'value': 'PKR 8.75M',
          'trend': '+18.6%',
          'icon': Icons.description,
          'color': Colors.teal
        },
      ];

  Widget _buildStatCard(Map<String, dynamic> stat) {
    final bool isDown = stat['trend'].toString().contains('-');

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.grey.shade100),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(stat['icon'], color: stat['color'], size: 22),
          const SizedBox(height: 16),
          Text(stat['label'],
              style: TextStyle(color: Colors.grey.shade600, fontSize: 12)),
          const SizedBox(height: 4),
          Text(stat['value'],
              style:
                  const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          const SizedBox(height: 6),
          Row(
            children: [
              Icon(
                isDown
                    ? Icons.trending_down
                    : Icons.trending_up,
                size: 14,
                color: isDown ? Colors.red : Colors.green,
              ),
              const SizedBox(width: 4),
              Text(
                stat['trend'],
                style: TextStyle(
                  fontSize: 11,
                  fontWeight: FontWeight.bold,
                  color: isDown ? Colors.red : Colors.green,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  // ---------------- ACTIVITIES ----------------
  Widget _buildActivitiesList() {
    final activities = [
      {
        'title': 'New intern registered',
        'time': '10:30 AM',
        'icon': Icons.person_add,
        'color': Colors.green
      },
      {
        'title': 'New message in project',
        'time': '09:45 AM',
        'icon': Icons.message,
        'color': Colors.blue
      },
      {
        'title': 'Task submitted',
        'time': 'Yesterday',
        'icon': Icons.check_box,
        'color': Colors.purple
      },
      {
        'title': 'Invoice paid',
        'time': 'Yesterday',
        'icon': Icons.description,
        'color': Colors.orange
      },
    ];

    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        children: activities.map((act) {
          return ListTile(
            leading: CircleAvatar(
              backgroundColor: (act['color'] as Color).withOpacity(0.1),
              child: Icon(act['icon'] as IconData,
                  color: act['color'] as Color, size: 18),
            ),
            title: Text(act['title'] as String),
            trailing: Text(
              act['time'] as String,
              style: const TextStyle(color: Colors.grey, fontSize: 11),
            ),
          );
        }).toList(),
      ),
    );
  }
}