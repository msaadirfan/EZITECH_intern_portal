import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:fl_chart/fl_chart.dart';

class ReportsPage extends StatelessWidget {
  const ReportsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Reports', style: GoogleFonts.inter(fontSize: 24, fontWeight: FontWeight.bold)),
                  Text('Overview and insights of portal activities', style: TextStyle(color: Colors.grey[500], fontSize: 13)),
                ],
              ),
              ElevatedButton.icon(
                onPressed: () {},
                icon: const Icon(LucideIcons.download, size: 16),
                label: const Text('Export Report'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  foregroundColor: Colors.blue[600],
                  elevation: 0,
                  side: BorderSide(color: Colors.grey[200]!),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          _buildTabs(),
          const SizedBox(height: 20),
          _buildStatsCards(),
          const SizedBox(height: 24),
          _buildCheckInChart(),
          const SizedBox(height: 24),
          Row(
            children: [
              Expanded(child: _buildPieChart('Tasks by Status', 642, [
                {'name': 'Completed', 'value': 271, 'color': Colors.green},
                {'name': 'In Progress', 'value': 248, 'color': Colors.orange},
                {'name': 'To Do', 'value': 98, 'color': Colors.blue},
                {'name': 'On Hold', 'value': 25, 'color': Colors.purple},
              ])),
              const SizedBox(width: 16),
              Expanded(child: _buildPieChart('Projects by Status', 156, [
                {'name': 'Active', 'value': 98, 'color': Colors.green},
                {'name': 'Completed', 'value': 45, 'color': Colors.blue},
                {'name': 'On Hold', 'value': 13, 'color': Colors.orange},
              ])),
            ],
          ),
          const SizedBox(height: 24),
          _buildTopInternsSection(),
        ],
      ),
    );
  }

  Widget _buildTabs() {
    final tabs = ['Today', 'This Week', 'This Month', 'This Quarter', 'This Year', 'Custom'];
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: tabs.map((tab) {
          bool isSelected = tab == 'This Month';
          return Container(
            margin: const EdgeInsets.only(right: 8),
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            decoration: BoxDecoration(
              color: isSelected ? Colors.blue[600] : Colors.white,
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: isSelected ? Colors.blue[600]! : Colors.grey[100]!),
            ),
            child: Row(
              children: [
                Text(tab, style: TextStyle(
                  color: isSelected ? Colors.white : Colors.grey[500],
                  fontSize: 13,
                  fontWeight: FontWeight.w600,
                )),
                if (tab == 'Custom') ...[
                  const SizedBox(width: 6),
                  Icon(LucideIcons.calendar, size: 14, color: isSelected ? Colors.white : Colors.grey),
                ]
              ],
            ),
          );
        }).toList(),
      ),
    );
  }

  Widget _buildStatsCards() {
    final stats = [
      {'label': 'Total Interns', 'value': '1,248', 'trend': '+ 12.5%', 'color': Colors.blue, 'icon': LucideIcons.users},
      {'label': 'Active Projects', 'value': '98', 'trend': '+ 8.3%', 'color': Colors.green, 'icon': LucideIcons.briefcase},
      {'label': 'Tasks Completed', 'value': '271', 'trend': '+ 15.7%', 'color': Colors.purple, 'icon': LucideIcons.checkSquare},
      {'label': 'Total Invoices', 'value': '128', 'trend': '+ 10.2%', 'color': Colors.orange, 'icon': LucideIcons.fileText},
    ];

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: stats.map((stat) => Container(
          width: 150,
          margin: const EdgeInsets.only(right: 12),
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: Colors.grey[100]!),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: (stat['color'] as Color).withOpacity(0.1),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Icon(stat['icon'] as IconData, color: stat['color'] as Color, size: 16),
              ),
              const SizedBox(height: 12),
              Text(stat['label'] as String, style: TextStyle(color: Colors.grey[400], fontSize: 11)),
              Text(stat['value'] as String, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              const SizedBox(height: 4),
              Row(
                children: [
                  const Icon(LucideIcons.arrowUpRight, size: 10, color: Colors.green),
                  Text(stat['trend'] as String, style: const TextStyle(color: Colors.green, fontSize: 10, fontWeight: FontWeight.bold)),
                ],
              ),
            ],
          ),
        )).toList(),
      ),
    );
  }

  Widget _buildCheckInChart() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.grey[100]!),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text('Intern Check-in Overview', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                decoration: BoxDecoration(color: Colors.grey[50], borderRadius: BorderRadius.circular(8)),
                child: const Row(
                  children: [Text('This Month', style: TextStyle(fontSize: 11)), Icon(LucideIcons.chevronDown, size: 12)],
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          SizedBox(
            height: 180,
            child: LineChart(
              LineChartData(
                gridData: const FlGridData(show: true, drawVerticalLine: false),
                titlesData: FlTitlesData(
                  leftTitles: const AxisTitles(sideTitles: SideTitles(showTitles: true, reservedSize: 30, getTitlesWidget: _leftTitles)),
                  bottomTitles: AxisTitles(sideTitles: SideTitles(showTitles: true, getTitlesWidget: _bottomTitles)),
                  rightTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
                  topTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
                ),
                borderData: FlBorderData(show: false),
                lineBarsData: [
                  _lineBar(Colors.blue, [1, 3, 2, 5, 2.5, 4]),
                  _lineBar(Colors.green, [0.5, 1.5, 1, 2, 1.8, 2.2]),
                  _lineBar(Colors.orange, [0.2, 0.5, 0.4, 0.8, 0.6, 1]),
                ],
              ),
            ),
          ),
          const SizedBox(height: 20),
          const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _Legend(color: Colors.blue, label: 'Present'),
              SizedBox(width: 16),
              _Legend(color: Colors.green, label: 'Late'),
              SizedBox(width: 16),
              _Legend(color: Colors.orange, label: 'Absent'),
            ],
          )
        ],
      ),
    );
  }

  LineChartBarData _lineBar(Color color, List<double> values) {
    return LineChartBarData(
      isCurved: true,
      color: color,
      barWidth: 2,
      isStrokeCapRound: true,
      dotData: const FlDotData(show: true),
      belowBarData: BarAreaData(show: false),
      spots: values.asMap().entries.map((e) => FlSpot(e.key.toDouble(), e.value)).toList(),
    );
  }

  static Widget _bottomTitles(double value, TitleMeta meta) {
    const dates = ['1 May', '7 May', '14 May', '21 May', '28 May', '31 May'];
    if (value.toInt() < 0 || value.toInt() >= dates.length) return const SizedBox();
    return Text(dates[value.toInt()], style: const TextStyle(fontSize: 10, color: Colors.grey));
  }

  static Widget _leftTitles(double value, TitleMeta meta) {
    return Text(value.toInt().toString(), style: const TextStyle(fontSize: 10, color: Colors.grey));
  }

  Widget _buildPieChart(String title, int total, List<Map<String, dynamic>> items) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.grey[100]!),
      ),
      child: Column(
        children: [
          Align(alignment: Alignment.centerLeft, child: Text(title, style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold))),
          const SizedBox(height: 20),
          SizedBox(
            height: 100,
            child: Stack(
              children: [
                PieChart(
                  PieChartData(
                    sectionsSpace: 4,
                    centerSpaceRadius: 30,
                    sections: items.map((item) => PieChartSectionData(
                      color: item['color'] as Color,
                      value: (item['value'] as int).toDouble(),
                      radius: 12,
                      showTitle: false,
                    )).toList(),
                  ),
                ),
                Center(child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(total.toString(), style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
                    const Text('TOTAL', style: TextStyle(fontSize: 8, color: Colors.grey, fontWeight: FontWeight.bold)),
                  ],
                ))
              ],
            ),
          ),
          const SizedBox(height: 16),
          ...items.map((item) => Padding(
            padding: const EdgeInsets.only(bottom: 6),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Container(width: 6, height: 6, decoration: BoxDecoration(color: item['color'] as Color, shape: BoxShape.circle)),
                    const SizedBox(width: 8),
                    Text(item['name'] as String, style: const TextStyle(fontSize: 9, color: Colors.grey)),
                  ],
                ),
                Text('${item['value']} (${(item['value'] / total * 100).round()}%)', style: const TextStyle(fontSize: 9, color: Colors.grey)),
              ],
            ),
          )).toList(),
        ],
      ),
    );
  }

  Widget _buildTopInternsSection() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.grey[100]!),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text('Top Performing Interns', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
              TextButton(onPressed: () {}, child: const Text('View All', style: TextStyle(fontSize: 12, color: Colors.blue))),
            ],
          ),
          const SizedBox(height: 16),
          _buildInternRow('Usman Ahmed', 'Web Development', 32, '+ 16%', '98%', Colors.green, 1),
          const Divider(height: 32),
          _buildInternRow('Sara Khan', 'Mobile App Development', 28, '+ 12%', '95%', Colors.blue, 2),
          const Divider(height: 32),
          _buildInternRow('Ali Raza', 'UI/UX Design', 24, '+ 8%', '93%', Colors.orange, 3),
        ],
      ),
    );
  }

  Widget _buildInternRow(String name, String role, int tasks, String change, String progress, Color color, int rank) {
    return Row(
      children: [
        Stack(
          children: [
            const CircleAvatar(radius: 20, backgroundImage: NetworkImage("https://picsum.photos/200")),
            Positioned(
              left: -4,
              top: -4,
              child: Container(
                padding: const EdgeInsets.all(4),
                decoration: BoxDecoration(
                  color: rank == 1 ? Colors.amber : (rank == 2 ? Colors.grey : Colors.brown),
                  shape: BoxShape.circle,
                ),
                child: Text(rank.toString(), style: const TextStyle(color: Colors.white, fontSize: 8, fontWeight: FontWeight.bold)),
              ),
            )
          ],
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(name, style: const TextStyle(fontSize: 13, fontWeight: FontWeight.bold)),
              Text(role, style: TextStyle(fontSize: 10, color: Colors.grey[400])),
            ],
          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('$tasks', style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold)),
            Text(change, style: const TextStyle(fontSize: 10, color: Colors.green, fontWeight: FontWeight.bold)),
          ],
        ),
        const SizedBox(width: 24),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(progress, style: const TextStyle(fontSize: 10, fontWeight: FontWeight.bold)),
            const SizedBox(height: 4),
            Container(width: 60, height: 4, decoration: BoxDecoration(color: Colors.grey[100], borderRadius: BorderRadius.circular(2))),
            Container(width: 45, height: 4, decoration: BoxDecoration(color: color, borderRadius: BorderRadius.circular(2))),
          ],
        )
      ],
    );
  }
}

class _Legend extends StatelessWidget {
  final Color color;
  final String label;
  const _Legend({required this.color, required this.label});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(width: 8, height: 8, decoration: BoxDecoration(color: color, shape: BoxShape.circle)),
        const SizedBox(width: 8),
        Text(label, style: const TextStyle(fontSize: 11, color: Colors.grey, fontWeight: FontWeight.w600)),
      ],
    );
  }
}
