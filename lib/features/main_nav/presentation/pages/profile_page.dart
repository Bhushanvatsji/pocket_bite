import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F7F8),
      body: CustomScrollView(
        slivers: [
          // Green hero header
          SliverAppBar(
            expandedHeight: 220,
            pinned: true,
            backgroundColor: const Color(0xFF0F7A59),
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
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const SizedBox(height: 16),
                      // Avatar
                      Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(color: Colors.white, width: 4),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withValues(alpha: 0.2),
                              blurRadius: 20,
                              offset: const Offset(0, 8),
                            ),
                          ],
                        ),
                        child: ClipOval(
                          child: Image.network(
                            "https://i.pravatar.cc/150?img=11",
                            width: 80,
                            height: 80,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      const SizedBox(height: 12),
                      const Text(
                        "Bhushan vats",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 22,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                      const SizedBox(height: 4),
                      _buildBadge("Chandigarh University ,4th.Year"),
                    ],
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
                  // Stats Row
                  Row(
                    children: [
                      _buildStatCard("48", "Snaps\nPosted", Icons.camera_alt, const Color(0xFFE0F7F0)),
                      const SizedBox(width: 12),
                      _buildStatCard("12", "Spots\nVisited", Icons.location_on, const Color(0xFFFFF4E4)),
                      const SizedBox(width: 12),
                      _buildStatCard("6", "Fav\nSpots", Icons.favorite, const Color(0xFFFFE4E4)),
                    ],
                  ),
                  const SizedBox(height: 28),

                  // Campus Section
                  _sectionLabel("My Campus Info"),
                  const SizedBox(height: 12),
                  _buildInfoCard(
                    children: [
                      _infoRow(Icons.school, "Campus", "Chandigarh University"),
                      _divider(),
                      _infoRow(Icons.map, "Campus Area", "Gharuan , Mohali "),
                      _divider(),
                      _infoRow(Icons.account_balance, "Department", "Computer Engineering"),
                      _divider(),
                      _infoRow(Icons.badge, "Student ID", "CSE2022CE0481"),
                    ],
                  ),
                  const SizedBox(height: 24),

                  // Food Preferences
                  _sectionLabel("My Food Preferences"),
                  const SizedBox(height: 12),
                  _buildInfoCard(
                    children: [
                      _infoRow(Icons.eco, "Food Type", "Vegetarian"),
                      _divider(),
                      _infoRow(Icons.payments, "Usual Budget", "Under ₹80 per meal"),
                      _divider(),
                      _infoRow(Icons.favorite, "Favourite Spot", "Canteen Block B"),
                      _divider(),
                      _infoRow(Icons.emoji_food_beverage, "Go-To Snack", "Samosa & Chai"),
                    ],
                  ),
                  const SizedBox(height: 24),

                  // My Snaps preview
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _sectionLabel("My Snaps"),
                      TextButton(
                        onPressed: () {},
                        child: const Text("See All", style: TextStyle(color: Color(0xFF0F7A59), fontWeight: FontWeight.bold)),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  SizedBox(
                    height: 120,
                    child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      itemCount: 5,
                      separatorBuilder: (_, __) => const SizedBox(width: 10),
                      itemBuilder: (context, index) {
                        final urls = [
                          "https://images.unsplash.com/photo-1565299507177-b0ac66763828?w=200&q=80",
                          "https://images.unsplash.com/photo-1568901346375-23c9450c58cd?w=200&q=80",
                          "https://images.unsplash.com/photo-1512621776951-a57141f2eefd?w=200&q=80",
                          "https://images.unsplash.com/photo-1490645935967-10de6ba17061?w=200&q=80",
                          "https://images.unsplash.com/photo-1546069901-ba9599a7e63c?w=200&q=80",
                        ];
                        return ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: Image.network(urls[index], width: 110, height: 110, fit: BoxFit.cover),
                        );
                      },
                    ),
                  ),
                  const SizedBox(height: 28),

                  // Settings
                  _sectionLabel("Settings"),
                  const SizedBox(height: 12),
                  _buildInfoCard(
                    children: [
                      _settingsRow(Icons.notifications_outlined, "Notifications", true),
                      _divider(),
                      _settingsRow(Icons.location_on_outlined, "Location Services", true),
                      _divider(),
                      _settingsRow(Icons.camera_alt_outlined, "Allow Camera for Snaps", true),
                    ],
                  ),
                  const SizedBox(height: 20),

                  // Help & About
                  _buildInfoCard(
                    children: [
                      _actionRow(context, Icons.help_outline, "Help & Support"),
                      _divider(),
                      _actionRow(context, Icons.info_outline, "About PocketBite"),
                      _divider(),
                      _actionRow(context, Icons.logout, "Sign Out", isDestructive: true),
                    ],
                  ),
                  const SizedBox(height: 32),

                  Center(
                    child: Column(
                      children: [
                        const Text("PocketBite v1.0.0", style: TextStyle(color: Color(0xFF8A9AAB), fontSize: 12)),
                        const SizedBox(height: 4),
                        const Text("Made for campus food discovery 🍽️", style: TextStyle(color: Color(0xFF8A9AAB), fontSize: 11)),
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

  Widget _buildBadge(String text) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.2),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.white.withValues(alpha: 0.5)),
      ),
      child: Text(text, style: const TextStyle(color: Colors.white, fontSize: 11, fontWeight: FontWeight.w600)),
    );
  }

  Widget _buildStatCard(String value, String label, IconData icon, Color bg) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 16),
        decoration: BoxDecoration(color: bg, borderRadius: BorderRadius.circular(24)),
        child: Column(
          children: [
            Icon(icon, color: const Color(0xFF0F7A59), size: 22),
            const SizedBox(height: 8),
            Text(value, style: const TextStyle(fontSize: 22, fontWeight: FontWeight.w900, color: Color(0xFF1C2126))),
            const SizedBox(height: 2),
            Text(label, textAlign: TextAlign.center, style: const TextStyle(fontSize: 10, color: Color(0xFF5F6C7B), fontWeight: FontWeight.w600)),
          ],
        ),
      ),
    );
  }

  Widget _sectionLabel(String text) {
    return Text(text, style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w900, color: Color(0xFF1C2126)));
  }

  Widget _buildInfoCard({required List<Widget> children}) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24),
        boxShadow: [BoxShadow(color: Colors.black.withValues(alpha: 0.04), blurRadius: 16, offset: const Offset(0, 4))],
      ),
      child: Column(children: children),
    );
  }

  Widget _infoRow(IconData icon, String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
      child: Row(
        children: [
          Icon(icon, color: const Color(0xFF0F7A59), size: 20),
          const SizedBox(width: 14),
          Expanded(child: Text(label, style: const TextStyle(fontSize: 13, color: Color(0xFF5F6C7B)))),
          Text(value, style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w700, color: Color(0xFF1C2126))),
        ],
      ),
    );
  }

  Widget _settingsRow(IconData icon, String label, bool value) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Row(
        children: [
          Icon(icon, color: const Color(0xFF0F7A59), size: 20),
          const SizedBox(width: 14),
          Expanded(child: Text(label, style: const TextStyle(fontSize: 13, color: Color(0xFF1C2126), fontWeight: FontWeight.w600))),
          Switch.adaptive(
            value: value,
            activeColor: const Color(0xFF35D193),
            onChanged: (_) {},
          ),
        ],
      ),
    );
  }

  Widget _actionRow(BuildContext context, IconData icon, String label, {bool isDestructive = false}) {
    return InkWell(
      onTap: () {},
      borderRadius: BorderRadius.circular(24),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
        child: Row(
          children: [
            Icon(icon, color: isDestructive ? const Color(0xFFDC3545) : const Color(0xFF0F7A59), size: 20),
            const SizedBox(width: 14),
            Expanded(
              child: Text(
                label,
                style: TextStyle(fontSize: 13, color: isDestructive ? const Color(0xFFDC3545) : const Color(0xFF1C2126), fontWeight: FontWeight.w600),
              ),
            ),
            if (!isDestructive) const Icon(Icons.arrow_forward_ios, size: 14, color: Color(0xFF8A9AAB)),
          ],
        ),
      ),
    );
  }

  Widget _divider() {
    return const Divider(height: 1, indent: 54, endIndent: 20, color: Color(0xFFEDF1F3));
  }
}