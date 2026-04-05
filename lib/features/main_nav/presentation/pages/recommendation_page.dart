import 'package:flutter/material.dart';
import 'recommendation_result_page.dart';

class RecommendationPage extends StatelessWidget {
  const RecommendationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F7F8),
      appBar: AppBar(
        backgroundColor: const Color(0xFFF5F7F8),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Color(0xFF1C2126)),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          "PocketBite",
          style: TextStyle(color: Color(0xFF1E9B70), fontWeight: FontWeight.w900, fontSize: 20, letterSpacing: -0.5),
        ),
        centerTitle: false,
        actions: [
          const Center(
            child: Text("DECISION FLOW", style: TextStyle(color: Color(0xFF8A9AAB), fontSize: 10, fontWeight: FontWeight.bold, letterSpacing: 1.2)),
          ),
          const SizedBox(width: 8),
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: CircleAvatar(
              radius: 14,
              backgroundColor: Colors.white,
              child: ClipOval(
                child: Image.network("https://i.pravatar.cc/150?img=11", width: 28, height: 28, fit: BoxFit.cover),
              ),
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Row(
                  children: const [
                    Icon(Icons.auto_awesome, color: Color(0xFF1E9B70), size: 14),
                    SizedBox(width: 4),
                    Text("AI Assistant Active", style: TextStyle(color: Color(0xFF1E9B70), fontSize: 10, fontWeight: FontWeight.w800)),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 16),
            const Text(
              "Smart\nRecommendation\nFlow",
              style: TextStyle(fontSize: 32, fontWeight: FontWeight.w900, color: Color(0xFF1C2126), height: 1.1),
            ),
            const SizedBox(height: 8),
            const Text(
              "Helping students decide in under 10 seconds.",
              style: TextStyle(fontSize: 15, color: Color(0xFF5F6C7B), fontWeight: FontWeight.w500, height: 1.3),
            ),
            const SizedBox(height: 32),
            Center(
              child: Column(
                children: [
                  const Text(
                    "What matters most right\nnow?",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.w800, color: Color(0xFF1C2126)),
                  ),
                  const SizedBox(height: 8),
                  Container(width: 40, height: 3, decoration: BoxDecoration(color: const Color(0xFF35D193), borderRadius: BorderRadius.circular(2))),
                ],
              ),
            ),
            const SizedBox(height: 24),

            // Option Cards - each navigates to result
            _buildOptionCard(
              context: context,
              icon: Icons.money,
              iconBgColor: const Color(0xFFB5F4DF),
              iconColor: const Color(0xFF0F7A59),
              title: "Affordable",
              desc: "Focus on budget-friendly meals and student discounts nearby.",
              mode: "Affordable",
            ),
            const SizedBox(height: 16),
            _buildOptionCard(
              context: context,
              icon: Icons.bolt,
              iconBgColor: const Color(0xFFD4E1FA),
              iconColor: const Color(0xFF334155),
              title: "Quick Bite",
              desc: "Ready in under 15 mins. Perfect between back-to-back lectures.",
              mode: "Quick Bite",
            ),
            const SizedBox(height: 16),
            _buildOptionCard(
              context: context,
              icon: Icons.eco,
              iconBgColor: const Color(0xFFC4F2FA),
              iconColor: const Color(0xFF0F3E3F),
              title: "Healthy",
              desc: "Nutrient-dense bowls and fresh salads to power your study session.",
              mode: "Healthy",
            ),
            const SizedBox(height: 16),

            // Surprise Me Card
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => const RecommendationResultPage(selectedMode: "Surprise Me", budget: 100),
                  ),
                );
              },
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(28),
                  boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.03), blurRadius: 15, offset: const Offset(0, 5))],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(20),
                      child: Container(
                        padding: const EdgeInsets.all(12),
                        decoration: const BoxDecoration(color: Color(0xFF35D193), shape: BoxShape.circle),
                        child: const Icon(Icons.casino, color: Colors.white, size: 24),
                      ),
                    ),
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(20),
                      decoration: const BoxDecoration(
                        color: Color(0xFF27D39A),
                        borderRadius: BorderRadius.vertical(bottom: Radius.circular(28)),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text("Surprise Me", style: TextStyle(fontSize: 18, fontWeight: FontWeight.w800, color: Colors.white)),
                          const SizedBox(height: 6),
                          const Text(
                            "Let our AI pick a highly-rated local gem based on your past favorites.",
                            style: TextStyle(fontSize: 12, color: Colors.white, height: 1.4),
                          ),
                          const SizedBox(height: 16),
                          Row(
                            children: const [
                              Text("ROLL THE DICE", style: TextStyle(fontSize: 10, fontWeight: FontWeight.w900, color: Colors.white, letterSpacing: 1.5)),
                              SizedBox(width: 4),
                              Icon(Icons.casino, color: Colors.white, size: 12),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 32),

            // Engine Status
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(color: const Color(0xFFEDF1F3), borderRadius: BorderRadius.circular(30)),
              child: Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(color: const Color(0xFF1E293B), borderRadius: BorderRadius.circular(10)),
                    child: const Icon(Icons.memory, color: Color(0xFFEAB308), size: 20),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text("ENGINE STATUS", style: TextStyle(fontSize: 9, fontWeight: FontWeight.bold, color: Color(0xFF8A9AAB), letterSpacing: 0.5)),
                        SizedBox(height: 2),
                        Text("Neural Decision-\nMaker V2.4", style: TextStyle(fontSize: 12, fontWeight: FontWeight.w800, color: Color(0xFF0F7A59))),
                      ],
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: const [
                      Text("EST.\nPROCESSING", textAlign: TextAlign.right, style: TextStyle(fontSize: 8, fontWeight: FontWeight.bold, color: Color(0xFF8A9AAB), letterSpacing: 0.5)),
                      Text("1.2s", style: TextStyle(fontSize: 18, fontWeight: FontWeight.w900, color: Color(0xFF1C2126))),
                    ],
                  )
                ],
              ),
            ),
            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }

  Widget _buildOptionCard({
    required BuildContext context,
    required IconData icon,
    required Color iconBgColor,
    required Color iconColor,
    required String title,
    required String desc,
    required String mode,
  }) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => RecommendationResultPage(selectedMode: mode, budget: 100),
          ),
        );
      },
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(28),
          boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.03), blurRadius: 15, offset: const Offset(0, 5))],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(padding: const EdgeInsets.all(12), decoration: BoxDecoration(color: iconBgColor, shape: BoxShape.circle), child: Icon(icon, color: iconColor, size: 20)),
            const SizedBox(height: 16),
            Text(title, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w800, color: Color(0xFF1C2126))),
            const SizedBox(height: 6),
            Text(desc, style: const TextStyle(fontSize: 12, color: Color(0xFF5F6C7B), height: 1.4)),
          ],
        ),
      ),
    );
  }
}