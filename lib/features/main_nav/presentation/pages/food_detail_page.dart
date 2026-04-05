import 'package:flutter/material.dart';

class FoodDetailPage extends StatelessWidget {
  const FoodDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F7F8),
      appBar: AppBar(
        backgroundColor: const Color(0xFFF5F7F8),
        elevation: 0,
        leading: Padding(
          padding: const EdgeInsets.only(left: 16.0),
          child: CircleAvatar(
            backgroundColor: const Color(0xFFE8ECEF),
            child: IconButton(
              icon: const Icon(Icons.arrow_back, color: Color(0xFF1C2126)),
              onPressed: () => Navigator.pop(context),
            ),
          ),
        ),
        title: const Text(
          "Zen Garden Bowl",
          style: TextStyle(color: Color(0xFF1E9B70), fontWeight: FontWeight.w800, fontSize: 18),
        ),
        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: CircleAvatar(
              backgroundColor: const Color(0xFFE8ECEF),
              child: IconButton(
                icon: const Icon(Icons.favorite, color: Color(0xFF4A5568)),
                onPressed: () {},
              ),
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(20, 16, 20, 40),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(32),
                  child: Image.network(
                    "https://images.unsplash.com/photo-1546069901-ba9599a7e63c?ixlib=rb-1.2.1&auto=format&fit=crop&w=800&q=80",
                    height: 280,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned.fill(
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(32),
                      gradient: LinearGradient(
                        colors: [Colors.black.withOpacity(0.3), Colors.transparent, Colors.black.withOpacity(0.4)],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: 16,
                  right: 16,
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    decoration: BoxDecoration(color: Colors.white.withOpacity(0.85), borderRadius: BorderRadius.circular(20)),
                    child: const Text("₹120", style: TextStyle(fontSize: 20, fontWeight: FontWeight.w900, color: Color(0xFF1C2126))),
                  ),
                ),
                Positioned(
                  bottom: 16,
                  left: 16,
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    decoration: BoxDecoration(color: const Color(0xFF35D193), borderRadius: BorderRadius.circular(20)),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: const [
                        Icon(Icons.directions_walk, color: Color(0xFF0F7A59), size: 16),
                        SizedBox(width: 4),
                        Text("5 mins away", style: TextStyle(fontSize: 12, fontWeight: FontWeight.w800, color: Color(0xFF0F7A59))),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),

            // Info Cards Row
            Row(
              children: [
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(32),
                      boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.02), blurRadius: 10, offset: const Offset(0, 5))],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text("ENERGY", style: TextStyle(fontSize: 10, fontWeight: FontWeight.w800, color: Color(0xFF8A9AAB), letterSpacing: 1.0)),
                        const SizedBox(height: 8),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.baseline,
                          textBaseline: TextBaseline.alphabetic,
                          children: const [
                            Text("350", style: TextStyle(fontSize: 32, fontWeight: FontWeight.w900, color: Color(0xFF1C2126))),
                            SizedBox(width: 4),
                            Text("kcal", style: TextStyle(fontSize: 12, fontWeight: FontWeight.w700, color: Color(0xFF1C2126))),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(color: const Color(0xFFE5F7F3), borderRadius: BorderRadius.circular(32)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text("PROTEIN", style: TextStyle(fontSize: 10, fontWeight: FontWeight.w800, color: Color(0xFF0F7A59), letterSpacing: 1.0)),
                        const SizedBox(height: 8),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.baseline,
                          textBaseline: TextBaseline.alphabetic,
                          children: const [
                            Text("15", style: TextStyle(fontSize: 32, fontWeight: FontWeight.w900, color: Color(0xFF1E9B70))),
                            SizedBox(width: 2),
                            Text("G", style: TextStyle(fontSize: 12, fontWeight: FontWeight.w800, color: Color(0xFF1E9B70))),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 28),

            Row(
              children: [
                Container(width: 30, height: 3, decoration: BoxDecoration(color: const Color(0xFF1E9B70), borderRadius: BorderRadius.circular(2))),
                const SizedBox(width: 12),
                const Text("FRESHNESS FOCUS", style: TextStyle(fontSize: 10, fontWeight: FontWeight.w800, color: Color(0xFF5F6C7B), letterSpacing: 1.5)),
              ],
            ),
            const SizedBox(height: 16),
            RichText(
              text: const TextSpan(
                style: TextStyle(fontSize: 15, height: 1.6, color: Color(0xFF5F6C7B), fontWeight: FontWeight.w500),
                children: [
                  TextSpan(text: "Experience the ultimate mindful meal. Our "),
                  TextSpan(text: "Zen Garden Bowl", style: TextStyle(fontWeight: FontWeight.w800, color: Color(0xFF1C2126))),
                  TextSpan(text: " features organic quinoa harvested from local farms, tossed with crisp snap peas, edamame, and a dash of ginger-miso glaze. Designed for sustained mental clarity during long study sessions."),
                ],
              ),
            ),
            const SizedBox(height: 32),

            const Text("Route to Freshness", style: TextStyle(fontSize: 18, fontWeight: FontWeight.w800, color: Color(0xFF1C2126))),
            const SizedBox(height: 16),
            Container(
              height: 140,
              decoration: BoxDecoration(
                color: const Color(0xFFB1B6BA),
                borderRadius: BorderRadius.circular(32),
                image: const DecorationImage(
                  image: NetworkImage("https://images.unsplash.com/photo-1524661135-423995f22d0b?ixlib=rb-1.2.1&auto=format&fit=crop&w=600&q=80"),
                  fit: BoxFit.cover,
                  colorFilter: ColorFilter.mode(Colors.grey, BlendMode.saturation),
                ),
              ),
              child: Center(
                child: Container(
                  padding: const EdgeInsets.all(12),
                  decoration: const BoxDecoration(color: Color(0xFF0F7A59), shape: BoxShape.circle),
                  child: const Icon(Icons.location_on, color: Colors.white),
                ),
              ),
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: ElevatedButton.icon(
                    onPressed: () {},
                    icon: const Icon(Icons.map_outlined, color: Color(0xFF4A5568), size: 18),
                    label: const Text("Open Map", style: TextStyle(color: Color(0xFF4A5568), fontWeight: FontWeight.bold, fontSize: 13)),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFFE2E8F0),
                      elevation: 0,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                      padding: const EdgeInsets.symmetric(vertical: 14),
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: ElevatedButton.icon(
                    onPressed: () {},
                    icon: const Icon(Icons.navigation, color: Color(0xFF0A5840), size: 18),
                    label: const Text("Check Route", style: TextStyle(color: Color(0xFF0A5840), fontWeight: FontWeight.bold, fontSize: 13)),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF35D193),
                      elevation: 0,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                      padding: const EdgeInsets.symmetric(vertical: 14),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 24),

            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(color: const Color(0xFFDFF5FA), borderRadius: BorderRadius.circular(30)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: const [
                      Icon(Icons.lightbulb, color: Color(0xFF076785), size: 18),
                      SizedBox(width: 8),
                      Text("STUDENT PRO-TIP", style: TextStyle(fontSize: 10, fontWeight: FontWeight.w900, color: Color(0xFF076785), letterSpacing: 1.0)),
                    ],
                  ),
                  const SizedBox(height: 12),
                  const Text(
                    "Grab this between 2 PM and 4 PM for the \"Library Happy Hour\" – the cafe is 50% quieter and the Wi-Fi is blazing fast. Perfect for finishing that thesis!",
                    style: TextStyle(fontSize: 13, height: 1.5, color: Color(0xFF094D61), fontWeight: FontWeight.w500),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: [
                _buildTag("VEGAN FRIENDLY"),
                _buildTag("GLUTEN FREE"),
                _buildTag("ECO-PACKAGING"),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTag(String label) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
      decoration: BoxDecoration(color: const Color(0xFFE8ECEF), borderRadius: BorderRadius.circular(16)),
      child: Text(label, style: const TextStyle(fontSize: 10, fontWeight: FontWeight.w800, color: Color(0xFF5F6C7B))),
    );
  }
}