import 'package:flutter/material.dart';
import 'filter_page.dart';
import 'food_detail_page.dart';
import 'recommendation_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F7F8),
      appBar: AppBar(
        backgroundColor: const Color(0xFFF5F7F8),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.menu, color: Color(0xFF1E9B70)),
          onPressed: () {},
        ),
        title: const Text(
          "PocketBite",
          style: TextStyle(color: Color(0xFF1E9B70), fontWeight: FontWeight.w900, fontSize: 20, letterSpacing: -0.5),
        ),
        centerTitle: false,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: CircleAvatar(
              radius: 16,
              backgroundColor: Colors.white,
              child: ClipOval(
                child: Image.network("https://i.pravatar.cc/150?img=11", width: 32, height: 32, fit: BoxFit.cover),
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
            // Header Row
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: const Text(
                    "Hey Bhushan 👋",
                    style: TextStyle(fontSize: 28, fontWeight: FontWeight.w900, color: Color(0xFF1C2126)),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                GestureDetector(
                  onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const RecommendationPage())),
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                    decoration: BoxDecoration(color: const Color(0xFFB5F4DF), borderRadius: BorderRadius.circular(16)),
                    child: Row(
                      children: const [
                        Icon(Icons.bolt, color: Color(0xFF0F7A59), size: 14),
                        SizedBox(width: 4),
                        Text("QUICK BITE", style: TextStyle(color: Color(0xFF0F7A59), fontSize: 10, fontWeight: FontWeight.w900)),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 4),
            const Text("Healthy picks for your break", style: TextStyle(fontSize: 16, color: Color(0xFF5F6C7B), fontWeight: FontWeight.w500)),
            const SizedBox(height: 24),

            // Search Bar with Filter button
            GestureDetector(
              onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const FilterPage())),
              child: Container(
                padding: const EdgeInsets.only(left: 20, right: 8, top: 4, bottom: 4),
                decoration: BoxDecoration(
                  color: const Color(0xFFE2E8F0).withOpacity(0.5),
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Row(
                  children: [
                    const Icon(Icons.search, color: Color(0xFF4A5568), size: 18),
                    const SizedBox(width: 8),
                    const Expanded(
                      child: Text("Search for your next snack...", style: TextStyle(color: Color(0xFF8A9AAB), fontSize: 13, fontWeight: FontWeight.w500)),
                    ),
                    GestureDetector(
                      onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const FilterPage())),
                      child: Container(
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: const Color(0xFF0A5840),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: const Icon(Icons.tune, color: Colors.white, size: 16),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 24),

            // Filter Chips
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              clipBehavior: Clip.none,
              child: Row(
                children: [
                  _buildChip("All", true),
                  const SizedBox(width: 12),
                  _buildChip("Under ₹50", false),
                  const SizedBox(width: 12),
                  _buildChip("Under 5 min", false),
                  const SizedBox(width: 12),
                  _buildChip("Healthy", false),
                ],
              ),
            ),
            const SizedBox(height: 28),

            // Best Seller Card — taps to Food Detail
            GestureDetector(
              onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const FoodDetailPage())),
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(32),
                  boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.04), blurRadius: 20, offset: const Offset(0, 10))],
                ),
                child: Column(
                  children: [
                    Stack(
                      children: [
                        ClipRRect(
                          borderRadius: const BorderRadius.vertical(top: Radius.circular(32)),
                          child: Image.network(
                            "https://images.unsplash.com/photo-1512621776951-a57141f2eefd?ixlib=rb-1.2.1&auto=format&fit=crop&w=800&q=80",
                            height: 180,
                            width: double.infinity,
                            fit: BoxFit.cover,
                          ),
                        ),
                        Positioned.fill(
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: const BorderRadius.vertical(top: Radius.circular(32)),
                              gradient: LinearGradient(
                                colors: [Colors.transparent, Colors.black.withOpacity(0.6)],
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          top: 16,
                          left: 16,
                          child: Container(
                            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                            decoration: BoxDecoration(color: Colors.white.withOpacity(0.9), borderRadius: BorderRadius.circular(12)),
                            child: const Text("BEST SELLER", style: TextStyle(fontSize: 10, fontWeight: FontWeight.w900, color: Color(0xFF0F7A59), letterSpacing: 0.5)),
                          ),
                        ),
                        Positioned(
                          bottom: 16,
                          left: 16,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text("Mediterranean Bowl", style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.w800)),
                              const SizedBox(height: 4),
                              Row(
                                children: const [
                                  Text("Cafeteria Hub • 4.8", style: TextStyle(color: Colors.white, fontSize: 13)),
                                  SizedBox(width: 4),
                                  Icon(Icons.star, color: Colors.white, size: 12),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const [
                              Text("EST. TIME", style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold, color: Color(0xFF8A9AAB), letterSpacing: 1.0)),
                              SizedBox(height: 4),
                              Text("8-12 Mins", style: TextStyle(fontSize: 16, fontWeight: FontWeight.w900, color: Color(0xFF1C2126))),
                            ],
                          ),
                          Container(
                            padding: const EdgeInsets.all(12),
                            decoration: const BoxDecoration(color: Color(0xFF0F7A59), shape: BoxShape.circle),
                            child: const Icon(Icons.add, color: Colors.white, size: 24),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 24),

            // Feature Cards Row
            Row(
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const FilterPage())),
                    child: Container(
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(color: const Color(0xFFE2E8F0).withOpacity(0.5), borderRadius: BorderRadius.circular(28)),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            padding: const EdgeInsets.all(8),
                            decoration: const BoxDecoration(color: Colors.white, shape: BoxShape.circle),
                            child: const Icon(Icons.eco, color: Color(0xFF4A5568), size: 18),
                          ),
                          const SizedBox(height: 20),
                          const Text("Low-Cal Deals", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Color(0xFF1C2126))),
                          const SizedBox(height: 4),
                          const Text("Starting from ₹45", style: TextStyle(fontSize: 12, color: Color(0xFF5F6C7B))),
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: GestureDetector(
                    onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const RecommendationPage())),
                    child: Container(
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(color: const Color(0xFFC0F0E4), borderRadius: BorderRadius.circular(28)),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            padding: const EdgeInsets.all(8),
                            decoration: const BoxDecoration(color: Color(0xFF27D39A), shape: BoxShape.circle),
                            child: const Icon(Icons.timer, color: Color(0xFF0F7A59), size: 18),
                          ),
                          const SizedBox(height: 20),
                          const Text("Lightning\nDelivery", style: TextStyle(fontSize: 16, fontWeight: FontWeight.w800, color: Color(0xFF0A5840), height: 1.1)),
                          const SizedBox(height: 4),
                          const Text("Ready in < 5 mins", style: TextStyle(fontSize: 12, color: Color(0xFF0F7A59))),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 24),

            // Bottom Poke Bowl card — taps to Food Detail
            GestureDetector(
              onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const FoodDetailPage())),
              child: Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(32),
                  boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.04), blurRadius: 20, offset: const Offset(0, 10))],
                ),
                child: Row(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(24),
                      child: Image.network(
                        "https://images.unsplash.com/photo-1546069901-ba9599a7e63c?ixlib=rb-1.2.1&auto=format&fit=crop&w=150&q=80",
                        width: 80,
                        height: 80,
                        fit: BoxFit.cover,
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: const [
                              Expanded(
                                child: Text(
                                  "Fresh Poke Bowl",
                                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: Color(0xFF1C2126)),
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                              SizedBox(width: 8),
                              Text("₹120", style: TextStyle(fontSize: 16, fontWeight: FontWeight.w900, color: Color(0xFF0A5840))),
                            ],
                          ),
                          const SizedBox(height: 6),
                          const Text("Quinoa, avocado, and fresh greens", style: TextStyle(fontSize: 12, color: Color(0xFF5F6C7B)), maxLines: 1, overflow: TextOverflow.ellipsis),
                          const SizedBox(height: 8),
                          Row(
                            children: const [
                              Icon(Icons.stars, color: Color(0xFF35D193), size: 14),
                              SizedBox(width: 4),
                              Text("4.9 (120+ reviews)", style: TextStyle(fontSize: 11, color: Color(0xFF4A5568), fontWeight: FontWeight.w600)),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 50),
          ],
        ),
      ),
    );
  }

  Widget _buildChip(String label, bool isActive) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      decoration: BoxDecoration(
        color: isActive ? const Color(0xFF0F7A59) : const Color(0xFFF1F5F9),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        label,
        style: TextStyle(color: isActive ? Colors.white : const Color(0xFF4A5568), fontSize: 13, fontWeight: FontWeight.bold),
      ),
    );
  }
}