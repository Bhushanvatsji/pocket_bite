import 'package:flutter/material.dart';

class WalletPage extends StatelessWidget {
  const WalletPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F7F8),
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 200,
            pinned: true,
            backgroundColor: const Color(0xFF0B6B4A),
            title: const Text(
              "Campus Wallet",
              style: TextStyle(color: Colors.white, fontWeight: FontWeight.w900, fontSize: 20),
            ),
            leading: const SizedBox(),
            flexibleSpace: FlexibleSpaceBar(
              background: Container(
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Color(0xFF27D39A), Color(0xFF0B6B4A)],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                ),
                child: SafeArea(
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(24, 48, 24, 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        const Text(
                          "CAMPUS FOOD BALANCE",
                          style: TextStyle(color: Colors.white70, fontSize: 10, fontWeight: FontWeight.w800, letterSpacing: 1.2),
                        ),
                        const SizedBox(height: 6),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            const Text(
                              "₹",
                              style: TextStyle(color: Colors.white70, fontSize: 22, fontWeight: FontWeight.w700),
                            ),
                            const SizedBox(width: 4),
                            const Text(
                              "486",
                              style: TextStyle(color: Colors.white, fontSize: 48, fontWeight: FontWeight.w900, height: 1.0),
                            ),
                            const SizedBox(width: 4),
                            const Text(
                              ".50",
                              style: TextStyle(color: Colors.white70, fontSize: 24, fontWeight: FontWeight.w700),
                            ),
                            const Spacer(),
                            Container(
                              padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
                              decoration: BoxDecoration(
                                color: Colors.white.withValues(alpha: 0.2),
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: const Row(
                                children: [
                                  Icon(Icons.add, color: Colors.white, size: 16),
                                  SizedBox(width: 4),
                                  Text("Top Up", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 13)),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),

          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Quick actions
                  Row(
                    children: [
                      _buildQuickAction(Icons.qr_code_scanner, "Scan & Pay", const Color(0xFFE0F7F0)),
                      const SizedBox(width: 12),
                      _buildQuickAction(Icons.history, "History", const Color(0xFFFFF4E4)),
                      const SizedBox(width: 12),
                      _buildQuickAction(Icons.receipt_long, "Receipts", const Color(0xFFEDE9FE)),
                      const SizedBox(width: 12),
                      _buildQuickAction(Icons.share, "Share", const Color(0xFFFFE4E4)),
                    ],
                  ),
                  const SizedBox(height: 28),

                  // Spending summary
                  _sectionTitle("This Month's Spending"),
                  const SizedBox(height: 12),
                  Container(
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(24),
                      boxShadow: [BoxShadow(color: Colors.black.withValues(alpha: 0.04), blurRadius: 16, offset: const Offset(0, 4))],
                    ),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            _buildSpendStat("₹1,240", "Total Spent", Icons.trending_down, const Color(0xFFEF4444)),
                            Container(width: 1, height: 40, color: const Color(0xFFE2E8F0)),
                            _buildSpendStat("₹413", "Avg/Week", Icons.calendar_today, const Color(0xFFEAB308)),
                            Container(width: 1, height: 40, color: const Color(0xFFE2E8F0)),
                            _buildSpendStat("32", "Spots Visited", Icons.location_on, const Color(0xFF0F7A59)),
                          ],
                        ),
                        const SizedBox(height: 20),
                        // Mock spend bar
                        Column(
                          children: [
                            _buildSpendBar("Canteen Block A", 0.65, "₹485", const Color(0xFF35D193)),
                            const SizedBox(height: 10),
                            _buildSpendBar("Central Cafeteria", 0.45, "₹312", const Color(0xFFEAB308)),
                            const SizedBox(height: 10),
                            _buildSpendBar("Library Canteen", 0.28, "₹195", const Color(0xFF22D3EE)),
                            const SizedBox(height: 10),
                            _buildSpendBar("Engineering Stall", 0.15, "₹108", const Color(0xFFA855F7)),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 28),

                  // Recent transactions
                  _sectionTitle("Recent Transactions"),
                  const SizedBox(height: 12),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(24),
                      boxShadow: [BoxShadow(color: Colors.black.withValues(alpha: 0.04), blurRadius: 16, offset: const Offset(0, 4))],
                    ),
                    child: Column(
                      children: [
                        _txRow("Samosa + Chai", "Canteen Block A", "-₹25", "Today, 10:45 AM", Icons.emoji_food_beverage, true),
                        _divider(),
                        _txRow("Vada Pav × 2", "Central Cafeteria", "-₹30", "Today, 8:15 AM", Icons.lunch_dining, true),
                        _divider(),
                        _txRow("Top Up", "UPI Transfer", "+₹200", "Yesterday, 6:00 PM", Icons.add_circle, false),
                        _divider(),
                        _txRow("Quinoa Bowl", "Library Canteen", "-₹85", "Yesterday, 1:30 PM", Icons.rice_bowl, true),
                        _divider(),
                        _txRow("Top Up", "UPI Transfer", "+₹500", "Mar 26, 9:00 AM", Icons.add_circle, false),
                        _divider(),
                        _txRow("Pizza Slice", "Engineering Stall", "-₹55", "Mar 25, 4:00 PM", Icons.local_pizza, true),
                      ],
                    ),
                  ),
                  const SizedBox(height: 28),

                  // Campus card
                  Container(
                    padding: const EdgeInsets.all(24),
                    decoration: BoxDecoration(
                      color: const Color(0xFF1C2126),
                      borderRadius: BorderRadius.circular(28),
                    ),
                    child: Row(
                      children: [
                        const Icon(Icons.credit_card, color: Color(0xFF35D193), size: 36),
                        const SizedBox(width: 16),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const [
                              Text("Campus ID Card", style: TextStyle(color: Colors.white, fontWeight: FontWeight.w900, fontSize: 16)),
                              SizedBox(height: 4),
                              Text("Link your Chandigarh University ID card to pay at any campus food stall.", style: TextStyle(color: Color(0xFF8A9AAB), fontSize: 12, height: 1.4)),
                            ],
                          ),
                        ),
                        const SizedBox(width: 12),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
                          decoration: BoxDecoration(
                            color: const Color(0xFF35D193),
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: const Text("Link", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 12)),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 80),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _sectionTitle(String text) {
    return Text(text, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w900, color: Color(0xFF1C2126)));
  }

  Widget _buildQuickAction(IconData icon, String label, Color bg) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 16),
        decoration: BoxDecoration(color: bg, borderRadius: BorderRadius.circular(20)),
        child: Column(
          children: [
            Icon(icon, color: const Color(0xFF0F7A59), size: 22),
            const SizedBox(height: 8),
            Text(label, textAlign: TextAlign.center, style: const TextStyle(fontSize: 10, fontWeight: FontWeight.w700, color: Color(0xFF1C2126))),
          ],
        ),
      ),
    );
  }

  Widget _buildSpendStat(String value, String label, IconData icon, Color color) {
    return Expanded(
      child: Column(
        children: [
          Icon(icon, color: color, size: 18),
          const SizedBox(height: 6),
          Text(value, style: TextStyle(fontSize: 16, fontWeight: FontWeight.w900, color: color)),
          const SizedBox(height: 2),
          Text(label, textAlign: TextAlign.center, style: const TextStyle(fontSize: 9, color: Color(0xFF8A9AAB), fontWeight: FontWeight.w600)),
        ],
      ),
    );
  }

  Widget _buildSpendBar(String label, double fraction, String amount, Color color) {
    return Row(
      children: [
        SizedBox(width: 110, child: Text(label, style: const TextStyle(fontSize: 11, color: Color(0xFF4A5568)), overflow: TextOverflow.ellipsis)),
        const SizedBox(width: 8),
        Expanded(
          child: ClipRRect(
            borderRadius: BorderRadius.circular(4),
            child: LinearProgressIndicator(
              value: fraction,
              minHeight: 8,
              backgroundColor: const Color(0xFFE2E8F0),
              valueColor: AlwaysStoppedAnimation<Color>(color),
            ),
          ),
        ),
        const SizedBox(width: 10),
        Text(amount, style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w700, color: Color(0xFF1C2126))),
      ],
    );
  }

  Widget _txRow(String title, String location, String amount, String time, IconData icon, bool isDebit) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: isDebit ? const Color(0xFFFFF4E4) : const Color(0xFFE0F7F0),
              shape: BoxShape.circle,
            ),
            child: Icon(icon, color: isDebit ? const Color(0xFFEAB308) : const Color(0xFF0F7A59), size: 18),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: const TextStyle(fontWeight: FontWeight.w700, fontSize: 13, color: Color(0xFF1C2126))),
                const SizedBox(height: 2),
                Row(
                  children: [
                    const Icon(Icons.location_on, size: 10, color: Color(0xFF8A9AAB)),
                    const SizedBox(width: 2),
                    Text(location, style: const TextStyle(fontSize: 11, color: Color(0xFF8A9AAB))),
                  ],
                ),
              ],
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                amount,
                style: TextStyle(
                  fontWeight: FontWeight.w900,
                  fontSize: 14,
                  color: isDebit ? const Color(0xFFDC3545) : const Color(0xFF0F7A59),
                ),
              ),
              const SizedBox(height: 2),
              Text(time, style: const TextStyle(fontSize: 9, color: Color(0xFF8A9AAB))),
            ],
          ),
        ],
      ),
    );
  }

  Widget _divider() => const Divider(height: 1, indent: 60, endIndent: 16, color: Color(0xFFEDF1F3));
}
