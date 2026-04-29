import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:google_fonts/google_fonts.dart';

class InvoicesPage extends StatelessWidget {
  const InvoicesPage({super.key});

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
                  Text('Invoices', style: GoogleFonts.inter(fontSize: 24, fontWeight: FontWeight.bold)),
                  Text('Manage and track all invoices', style: TextStyle(color: Colors.grey[500], fontSize: 13)),
                ],
              ),
              ElevatedButton.icon(
                onPressed: () {},
                icon: const Icon(LucideIcons.plus, size: 16),
                label: const Text('Create Invoice'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF1E40AF),
                  foregroundColor: Colors.white,
                  elevation: 5,
                  shadowColor: Colors.blue.withOpacity(0.3),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                ),
              ),
            ],
          ),
          const SizedBox(height: 24),
          _buildStatsRow(),
          const SizedBox(height: 24),
          _buildSearchAndFilters(),
          const SizedBox(height: 24),
          _buildInvoiceList(),
          const SizedBox(height: 24),
          _buildPagination(),
        ],
      ),
    );
  }

  Widget _buildStatsRow() {
    final stats = [
      {'label': 'Total Invoices', 'value': '128', 'color': Colors.blue},
      {'label': 'Paid', 'value': '78', 'color': Colors.green},
      {'label': 'Pending', 'value': '32', 'color': Colors.orange},
      {'label': 'Overdue', 'value': '18', 'color': Colors.red},
    ];

    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 4,
        crossAxisSpacing: 10,
        childAspectRatio: 0.8,
      ),
      itemCount: stats.length,
      itemBuilder: (context, index) {
        final s = stats[index];
        return Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: Colors.grey[100]!),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.all(6),
                decoration: BoxDecoration(
                  color: (s['color'] as Color).withOpacity(0.1),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Icon(LucideIcons.fileText, size: 14, color: s['color'] as Color),
              ),
              const SizedBox(height: 8),
              Text(s['label'] as String, style: TextStyle(color: Colors.grey[400], fontSize: 8, fontWeight: FontWeight.bold)),
              const SizedBox(height: 2),
              Text(s['value'] as String, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
              const Spacer(),
              Text('View all', style: TextStyle(color: Colors.blue[600], fontSize: 8, fontWeight: FontWeight.bold)),
            ],
          ),
        );
      },
    );
  }

  Widget _buildSearchAndFilters() {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Search by invoice no., client...',
                  hintStyle: TextStyle(color: Colors.grey[300], fontSize: 13),
                  prefixIcon: const Icon(LucideIcons.search, size: 16, color: Colors.grey),
                  filled: true,
                  fillColor: Colors.white,
                  contentPadding: const EdgeInsets.symmetric(vertical: 0),
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: BorderSide(color: Colors.grey[200]!)),
                  enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: BorderSide(color: Colors.grey[100]!)),
                ),
              ),
            ),
            const SizedBox(width: 12),
            _buildSmallButton(LucideIcons.filter, 'Filter'),
            const SizedBox(width: 8),
            _buildSmallButton(LucideIcons.arrowUpDown, 'Sort'),
          ],
        ),
        const SizedBox(height: 12),
        Row(
          children: [
            _buildDropdownFilter('Status: All'),
            const SizedBox(width: 8),
            _buildDropdownFilter('Project: All'),
            const SizedBox(width: 8),
            _buildDropdownFilter('Client: All'),
            const Spacer(),
            Text('Clear', style: TextStyle(color: Colors.blue[600], fontSize: 12, fontWeight: FontWeight.bold)),
          ],
        )
      ],
    );
  }

  Widget _buildSmallButton(IconData icon, String label) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey[100]!),
      ),
      child: Row(
        children: [
          Icon(icon, size: 14, color: Colors.grey),
          const SizedBox(width: 8),
          Text(label, style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: Colors.grey)),
        ],
      ),
    );
  }

  Widget _buildDropdownFilter(String label) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.grey[100]!),
      ),
      child: Row(
        children: [
          Text(label, style: const TextStyle(fontSize: 10, fontWeight: FontWeight.bold, color: Colors.grey)),
          const SizedBox(width: 4),
          const Icon(LucideIcons.chevronDown, size: 12, color: Colors.grey),
        ],
      ),
    );
  }

  Widget _buildInvoiceList() {
    final invoices = [
      {'id': 'INV-2024-00128', 'name': 'UI/UX Redesign', 'client': 'Ezitech Solutions', 'date': '28 May 2024', 'due': '12 Jun 2024', 'amount': 'PKR 85,000', 'status': 'Paid', 'color': Colors.green},
      {'id': 'INV-2024-00127', 'name': 'Mobile App Development', 'client': 'TechGrow', 'date': '25 May 2024', 'due': '10 Jun 2024', 'amount': 'PKR 120,000', 'status': 'Pending', 'color': Colors.orange},
      {'id': 'INV-2024-00126', 'name': 'Website Development', 'client': 'BrightCorp', 'date': '20 May 2024', 'due': '05 Jun 2024', 'amount': 'PKR 65,000', 'status': 'Overdue', 'color': Colors.red},
      {'id': 'INV-2024-00125', 'name': 'Digital Marketing', 'client': 'Marketify', 'date': '18 May 2024', 'due': '02 Jun 2024', 'amount': 'PKR 45,000', 'status': 'Paid', 'color': Colors.green},
    ];

    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: invoices.length,
      itemBuilder: (context, index) {
        final inv = invoices[index];
        return Container(
          margin: const EdgeInsets.only(bottom: 16),
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: Colors.grey[100]!),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 48, height: 48,
                decoration: BoxDecoration(
                  color: (inv['color'] as Color).withOpacity(0.1),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Icon(LucideIcons.fileText, color: inv['color'] as Color),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(inv['id'] as String, style: const TextStyle(fontSize: 13, fontWeight: FontWeight.bold)),
                        Text(inv['amount'] as String, style: const TextStyle(fontSize: 13, fontWeight: FontWeight.bold)),
                      ],
                    ),
                    Text(inv['name'] as String, style: TextStyle(fontSize: 11, color: Colors.grey[500], fontWeight: FontWeight.w500)),
                    const SizedBox(height: 4),
                    Text('Client: ${inv['client']}', style: const TextStyle(fontSize: 10, fontWeight: FontWeight.bold)),
                    const SizedBox(height: 12),
                    Row(
                      children: [
                        const Icon(LucideIcons.calendar, size: 10, color: Colors.grey),
                        const SizedBox(width: 4),
                        Text(inv['date'] as String, style: const TextStyle(fontSize: 10, color: Colors.grey)),
                        const SizedBox(width: 16),
                        Icon(LucideIcons.calendar, size: 10, color: Colors.red[200]),
                        const SizedBox(width: 4),
                        Text('Due: ${inv['due']}', style: TextStyle(fontSize: 10, color: Colors.red[400], fontWeight: FontWeight.bold)),
                      ],
                    )
                  ],
                ),
              ),
              const SizedBox(width: 12),
              Column(
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    decoration: BoxDecoration(
                      color: (inv['color'] as Color).withOpacity(0.1),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Text(inv['status'] as String, style: TextStyle(color: inv['color'] as Color, fontSize: 10, fontWeight: FontWeight.bold)),
                  ),
                  const SizedBox(height: 20),
                  const Icon(LucideIcons.moreVertical, size: 16, color: Colors.grey),
                ],
              )
            ],
          ),
        );
      },
    );
  }

  Widget _buildPagination() {
    return Column(
      children: [
        const Text('Showing 1 to 10 of 128 invoices', style: TextStyle(fontSize: 10, color: Colors.grey)),
        const SizedBox(height: 16),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _pageButton(null, icon: LucideIcons.chevronLeft),
            _pageButton('1', isSelected: true),
            _pageButton('2'),
            _pageButton('3'),
            _pageButton('...', isText: true),
            _pageButton('13'),
            _pageButton(null, icon: LucideIcons.chevronRight),
          ],
        )
      ],
    );
  }

  Widget _pageButton(String? text, {IconData? icon, bool isSelected = false, bool isText = false}) {
    return Container(
      width: 32, height: 32,
      margin: const EdgeInsets.symmetric(horizontal: 2),
      decoration: BoxDecoration(
        color: isSelected ? const Color(0xFF1E40AF) : (isText ? Colors.transparent : Colors.white),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: isSelected || isText ? Colors.transparent : Colors.grey[100]!),
      ),
      child: Center(
        child: icon != null 
          ? Icon(icon, size: 14, color: Colors.grey)
          : Text(text!, style: TextStyle(
              color: isSelected ? Colors.white : Colors.grey,
              fontSize: 11,
              fontWeight: FontWeight.bold)),
      ),
    );
  }
}
