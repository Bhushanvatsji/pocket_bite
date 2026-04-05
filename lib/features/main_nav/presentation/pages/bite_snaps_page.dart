import 'package:flutter/material.dart';

// Model for a snap
class _SnapModel {
  final String user;
  final String avatar;
  final String location;
  final String timeAgo;
  final String imageUrl;
  final String caption;
  final int likes;
  final String tag;
  bool liked = false;

  _SnapModel({
    required this.user,
    required this.avatar,
    required this.location,
    required this.timeAgo,
    required this.imageUrl,
    required this.caption,
    required this.likes,
    required this.tag,
  });
}

class BiteSnapsPage extends StatefulWidget {
  const BiteSnapsPage({super.key});

  @override
  State<BiteSnapsPage> createState() => _BiteSnapsPageState();
}

class _BiteSnapsPageState extends State<BiteSnapsPage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  final List<_SnapModel> _snaps = [
    _SnapModel(
      user: "Priya S.",
      avatar: "https://i.pravatar.cc/80?img=5",
      location: "Canteen Block A",
      timeAgo: "3 min ago",
      imageUrl: "https://images.unsplash.com/photo-1565299507177-b0ac66763828?ixlib=rb-1.2.1&auto=format&fit=crop&w=800&q=80",
      caption: "Fresh samosa just dropped! Queue is small right now 🔥",
      likes: 42,
      tag: "HOT PICK",
    ),
    _SnapModel(
      user: "Rohan M.",
      avatar: "https://i.pravatar.cc/80?img=8",
      location: "Central Cafeteria",
      timeAgo: "12 min ago",
      imageUrl: "https://images.unsplash.com/photo-1568901346375-23c9450c58cd?ixlib=rb-1.2.1&auto=format&fit=crop&w=800&q=80",
      caption: "Vada pav today is on another level 💯 Only ₹15!",
      likes: 87,
      tag: "BUDGET PICK",
    ),
    _SnapModel(
      user: "Ananya K.",
      avatar: "https://i.pravatar.cc/80?img=25",
      location: "Library Canteen",
      timeAgo: "25 min ago",
      imageUrl: "https://images.unsplash.com/photo-1512621776951-a57141f2eefd?ixlib=rb-1.2.1&auto=format&fit=crop&w=800&q=80",
      caption: "Healthy quinoa bowl for the study session! 📚",
      likes: 33,
      tag: "HEALTHY",
    ),
    _SnapModel(
      user: "Dev P.",
      avatar: "https://i.pravatar.cc/80?img=12",
      location: "Engineering Block Stall",
      timeAgo: "1 hr ago",
      imageUrl: "https://images.unsplash.com/photo-1490645935967-10de6ba17061?ixlib=rb-1.2.1&auto=format&fit=crop&w=800&q=80",
      caption: "Chai and biscuits between labs. This is the life 🍵",
      likes: 55,
      tag: "QUICK BITE",
    ),
    _SnapModel(
      user: "Sneha T.",
      avatar: "https://i.pravatar.cc/80?img=47",
      location: "Canteen Block B",
      timeAgo: "2 hrs ago",
      imageUrl: "https://images.unsplash.com/photo-1546069901-ba9599a7e63c?ixlib=rb-1.2.1&auto=format&fit=crop&w=800&q=80",
      caption: "New poke bowl arrived! Never thought campus food could look this good 😍",
      likes: 104,
      tag: "NEW",
    ),
  ];

  // My own snaps
  final List<Map<String, String>> _mySnaps = [
    {"url": "https://images.unsplash.com/photo-1513104890138-7c749659a591?w=300&q=80", "caption": "Pizza Friday!"},
    {"url": "https://images.unsplash.com/photo-1565299507177-b0ac66763828?w=300&q=80", "caption": "Morning snack"},
    {"url": "https://images.unsplash.com/photo-1512621776951-a57141f2eefd?w=300&q=80", "caption": "Healthy lunch"},
  ];

  // Story ring avatars (students)
  final List<Map<String, String>> _stories = [
    {"img": "https://i.pravatar.cc/80?img=1", "name": "Aarav"},
    {"img": "https://i.pravatar.cc/80?img=2", "name": "Tanya"},
    {"img": "https://i.pravatar.cc/80?img=3", "name": "Karan"},
    {"img": "https://i.pravatar.cc/80?img=4", "name": "Meera"},
    {"img": "https://i.pravatar.cc/80?img=6", "name": "Nikhil"},
    {"img": "https://i.pravatar.cc/80?img=7", "name": "Isha"},
  ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  void _showSnapCamera(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (_) => _SnapCameraSheet(),
    );
  }

  void _toggleLike(int index) {
    setState(() {
      _snaps[index].liked = !_snaps[index].liked;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0D1117),
      body: SafeArea(
        child: Column(
          children: [
            // Header
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 16, 20, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        "BiteSnaps",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 26,
                          fontWeight: FontWeight.w900,
                          letterSpacing: -0.5,
                        ),
                      ),
                      Text(
                        "What's fresh on campus, right now",
                        style: TextStyle(color: Color(0xFF8A9AAB), fontSize: 12),
                      ),
                    ],
                  ),
                  GestureDetector(
                    onTap: () => _showSnapCamera(context),
                    child: Container(
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: const Color(0xFF35D193),
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: const Icon(Icons.add_a_photo, color: Colors.white, size: 22),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),

            // Story rings
            SizedBox(
              height: 90,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 16),
                itemCount: _stories.length + 1,
                itemBuilder: (context, index) {
                  if (index == 0) {
                    return _buildAddStoryRing(context);
                  }
                  final story = _stories[index - 1];
                  return _buildStoryRing(story["img"]!, story["name"]!);
                },
              ),
            ),

            const SizedBox(height: 16),

            // Tabs
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 20),
              padding: const EdgeInsets.all(4),
              decoration: BoxDecoration(
                color: const Color(0xFF1A2130),
                borderRadius: BorderRadius.circular(20),
              ),
              child: TabBar(
                controller: _tabController,
                indicator: BoxDecoration(
                  color: const Color(0xFF35D193),
                  borderRadius: BorderRadius.circular(16),
                ),
                labelColor: Colors.white,
                unselectedLabelColor: const Color(0xFF8A9AAB),
                labelStyle: const TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
                dividerColor: Colors.transparent,
                tabs: const [
                  Tab(text: "🔥  Live Feed"),
                  Tab(text: "📸  My Snaps"),
                ],
              ),
            ),

            const SizedBox(height: 16),

            // Tab Views
            Expanded(
              child: TabBarView(
                controller: _tabController,
                children: [
                  // Live Feed
                  ListView.builder(
                    padding: const EdgeInsets.fromLTRB(16, 0, 16, 80),
                    itemCount: _snaps.length,
                    itemBuilder: (context, index) => _buildSnapCard(index),
                  ),

                  // My Snaps
                  _buildMySnapsTab(),
                ],
              ),
            ),
          ],
        ),
      ),

    );
  }

  Widget _buildAddStoryRing(BuildContext context) {
    return GestureDetector(
      onTap: () => _showSnapCamera(context),
      child: Padding(
        padding: const EdgeInsets.only(right: 12),
        child: Column(
          children: [
            Container(
              width: 60,
              height: 60,
              decoration: BoxDecoration(
                color: const Color(0xFF1A2130),
                shape: BoxShape.circle,
                border: Border.all(color: const Color(0xFF35D193), width: 2),
              ),
              child: const Icon(Icons.add, color: Color(0xFF35D193), size: 28),
            ),
            const SizedBox(height: 6),
            const Text("Your Snap", style: TextStyle(color: Color(0xFF8A9AAB), fontSize: 10)),
          ],
        ),
      ),
    );
  }

  Widget _buildStoryRing(String imgUrl, String name) {
    return Padding(
      padding: const EdgeInsets.only(right: 12),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(2),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: const LinearGradient(
                colors: [Color(0xFF27D39A), Color(0xFF0B6B4A)],
              ),
            ),
            child: Container(
              padding: const EdgeInsets.all(2),
              decoration: const BoxDecoration(color: Color(0xFF0D1117), shape: BoxShape.circle),
              child: ClipOval(child: Image.network(imgUrl, width: 52, height: 52, fit: BoxFit.cover)),
            ),
          ),
          const SizedBox(height: 6),
          Text(name, style: const TextStyle(color: Colors.white70, fontSize: 10)),
        ],
      ),
    );
  }

  Widget _buildSnapCard(int index) {
    final snap = _snaps[index];
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      decoration: BoxDecoration(
        color: const Color(0xFF1A2130),
        borderRadius: BorderRadius.circular(28),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // User Header
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 14, 16, 14),
            child: Row(
              children: [
                ClipOval(child: Image.network(snap.avatar, width: 38, height: 38, fit: BoxFit.cover)),
                const SizedBox(width: 10),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(snap.user, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 13)),
                      Row(
                        children: [
                          const Icon(Icons.location_on, color: Color(0xFF35D193), size: 10),
                          const SizedBox(width: 2),
                          Text(snap.location, style: const TextStyle(color: Color(0xFF8A9AAB), fontSize: 11)),
                        ],
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                    color: _tagColor(snap.tag).withValues(alpha: 0.15),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Text(snap.tag, style: TextStyle(color: _tagColor(snap.tag), fontSize: 8, fontWeight: FontWeight.bold)),
                ),
                const SizedBox(width: 8),
                Text(snap.timeAgo, style: const TextStyle(color: Color(0xFF4A5568), fontSize: 10)),
              ],
            ),
          ),

          // Image
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Image.network(snap.imageUrl, height: 220, width: double.infinity, fit: BoxFit.cover),
          ),

          // Caption + Actions
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 14, 16, 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(snap.caption, style: const TextStyle(color: Colors.white, fontSize: 14, height: 1.4)),
                const SizedBox(height: 14),
                Row(
                  children: [
                    GestureDetector(
                      onTap: () => _toggleLike(index),
                      child: Row(
                        children: [
                          AnimatedSwitcher(
                            duration: const Duration(milliseconds: 200),
                            child: Icon(
                              snap.liked ? Icons.favorite : Icons.favorite_border,
                              key: ValueKey(snap.liked),
                              color: snap.liked ? const Color(0xFFFF4D6D) : const Color(0xFF8A9AAB),
                              size: 22,
                            ),
                          ),
                          const SizedBox(width: 5),
                          Text(
                            "${snap.liked ? snap.likes + 1 : snap.likes}",
                            style: const TextStyle(color: Color(0xFF8A9AAB), fontSize: 13, fontWeight: FontWeight.w600),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 20),
                    const Icon(Icons.chat_bubble_outline, color: Color(0xFF8A9AAB), size: 20),
                    const SizedBox(width: 5),
                    const Text("Reply", style: TextStyle(color: Color(0xFF8A9AAB), fontSize: 13)),
                    const Spacer(),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 7),
                      decoration: BoxDecoration(
                        color: const Color(0xFF0F7A59).withValues(alpha: 0.2),
                        borderRadius: BorderRadius.circular(14),
                        border: Border.all(color: const Color(0xFF0F7A59).withValues(alpha: 0.4)),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: const [
                          Icon(Icons.location_on, color: Color(0xFF35D193), size: 12),
                          SizedBox(width: 4),
                          Text("Get Directions", style: TextStyle(color: Color(0xFF35D193), fontSize: 11, fontWeight: FontWeight.bold)),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMySnapsTab() {
    return Column(
      children: [
        // Post a new snap prompt
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: GestureDetector(
            onTap: () => _showSnapCamera(context),
            child: Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [Color(0xFF0F7A59), Color(0xFF27D39A)],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.circular(24),
              ),
              child: Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: Colors.white.withValues(alpha: 0.2),
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(Icons.camera_alt, color: Colors.white, size: 24),
                  ),
                  const SizedBox(width: 16),
                  const Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Snap a food spot!", style: TextStyle(color: Colors.white, fontWeight: FontWeight.w900, fontSize: 16)),
                        SizedBox(height: 4),
                        Text("Show your campus what's fresh right now", style: TextStyle(color: Colors.white70, fontSize: 12)),
                      ],
                    ),
                  ),
                  const Icon(Icons.arrow_forward_ios, color: Colors.white70, size: 16),
                ],
              ),
            ),
          ),
        ),
        const SizedBox(height: 20),

        // My snaps grid
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: GridView.builder(
              padding: const EdgeInsets.only(bottom: 80),
              itemCount: _mySnaps.length + 1,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                childAspectRatio: 0.9,
              ),
              itemBuilder: (context, index) {
                if (index == 0) {
                  return GestureDetector(
                    onTap: () => _showSnapCamera(context),
                    child: Container(
                      decoration: BoxDecoration(
                        color: const Color(0xFF1A2130),
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(color: const Color(0xFF35D193).withValues(alpha: 0.5), width: 1.5, style: BorderStyle.solid),
                      ),
                      child: const Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.add_a_photo, color: Color(0xFF35D193), size: 36),
                          SizedBox(height: 10),
                          Text("Add Snap", style: TextStyle(color: Color(0xFF35D193), fontWeight: FontWeight.bold, fontSize: 13)),
                        ],
                      ),
                    ),
                  );
                }
                final snap = _mySnaps[index - 1];
                return ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Stack(
                    fit: StackFit.expand,
                    children: [
                      Image.network(snap["url"]!, fit: BoxFit.cover),
                      Positioned(
                        bottom: 0,
                        left: 0,
                        right: 0,
                        child: Container(
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [Colors.black.withValues(alpha: 0.7), Colors.transparent],
                              begin: Alignment.bottomCenter,
                              end: Alignment.topCenter,
                            ),
                          ),
                          child: Text(
                            snap["caption"]!,
                            style: const TextStyle(color: Colors.white, fontSize: 11, fontWeight: FontWeight.bold),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ),
      ],
    );
  }

  Color _tagColor(String tag) {
    switch (tag) {
      case "HOT PICK": return const Color(0xFFFF6B35);
      case "BUDGET PICK": return const Color(0xFF35D193);
      case "HEALTHY": return const Color(0xFF22D3EE);
      case "QUICK BITE": return const Color(0xFFEAB308);
      case "NEW": return const Color(0xFFA855F7);
      default: return const Color(0xFF8A9AAB);
    }
  }
}

// ── Bottom Sheet Snap Camera ──────────────────────────────────────────────────
class _SnapCameraSheet extends StatefulWidget {
  @override
  State<_SnapCameraSheet> createState() => _SnapCameraSheetState();
}

class _SnapCameraSheetState extends State<_SnapCameraSheet> {
  final _captionController = TextEditingController();
  String _selectedLocation = "Canteen Block A";
  String _selectedTag = "HOT PICK";

  final List<String> _locations = [
    "Canteen Block A",
    "Canteen Block B",
    "Central Cafeteria",
    "Library Canteen",
    "Engineering Block Stall",
    "Sports Complex Café",
  ];

  final List<String> _tags = ["HOT PICK", "BUDGET PICK", "HEALTHY", "QUICK BITE", "NEW"];

  @override
  void dispose() {
    _captionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.85,
      decoration: const BoxDecoration(
        color: Color(0xFF0D1117),
        borderRadius: BorderRadius.vertical(top: Radius.circular(32)),
      ),
      child: Column(
        children: [
          // Handle bar
          Container(
            margin: const EdgeInsets.only(top: 12, bottom: 20),
            width: 40,
            height: 4,
            decoration: BoxDecoration(color: const Color(0xFF2D3748), borderRadius: BorderRadius.circular(2)),
          ),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text("Post a Snap", style: TextStyle(color: Colors.white, fontSize: 22, fontWeight: FontWeight.w900)),
                IconButton(
                  icon: const Icon(Icons.close, color: Color(0xFF8A9AAB)),
                  onPressed: () => Navigator.pop(context),
                ),
              ],
            ),
          ),

          // Photo placeholder
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
            height: 200,
            decoration: BoxDecoration(
              color: const Color(0xFF1A2130),
              borderRadius: BorderRadius.circular(24),
              border: Border.all(color: const Color(0xFF35D193).withValues(alpha: 0.4)),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.camera_alt, color: Color(0xFF35D193), size: 48),
                const SizedBox(height: 12),
                const Text("Tap to take a photo", style: TextStyle(color: Color(0xFF8A9AAB), fontSize: 14)),
                const SizedBox(height: 20),
                ElevatedButton.icon(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF35D193),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                  ),
                  icon: const Icon(Icons.camera_alt, color: Colors.white, size: 18),
                  label: const Text("Open Camera", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                ),
              ],
            ),
          ),

          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Caption
                  const Text("Caption", style: TextStyle(color: Color(0xFF8A9AAB), fontSize: 12, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 8),
                  Container(
                    decoration: BoxDecoration(color: const Color(0xFF1A2130), borderRadius: BorderRadius.circular(16)),
                    child: TextField(
                      controller: _captionController,
                      maxLines: 2,
                      style: const TextStyle(color: Colors.white, fontSize: 14),
                      decoration: const InputDecoration(
                        hintText: "What's fresh? Tell your campus...",
                        hintStyle: TextStyle(color: Color(0xFF4A5568)),
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.all(14),
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),

                  // Location picker
                  const Text("Location", style: TextStyle(color: Color(0xFF8A9AAB), fontSize: 12, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 8),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 14),
                    decoration: BoxDecoration(color: const Color(0xFF1A2130), borderRadius: BorderRadius.circular(16)),
                    child: DropdownButton<String>(
                      value: _selectedLocation,
                      isExpanded: true,
                      dropdownColor: const Color(0xFF1A2130),
                      style: const TextStyle(color: Colors.white, fontSize: 14),
                      underline: const SizedBox(),
                      icon: const Icon(Icons.keyboard_arrow_down, color: Color(0xFF8A9AAB)),
                      onChanged: (v) => setState(() => _selectedLocation = v!),
                      items: _locations.map((l) => DropdownMenuItem(value: l, child: Text(l))).toList(),
                    ),
                  ),
                  const SizedBox(height: 16),

                  // Tag selector
                  const Text("Tag", style: TextStyle(color: Color(0xFF8A9AAB), fontSize: 12, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 8),
                  Wrap(
                    spacing: 8,
                    runSpacing: 8,
                    children: _tags.map((tag) {
                      final isSelected = tag == _selectedTag;
                      return GestureDetector(
                        onTap: () => setState(() => _selectedTag = tag),
                        child: AnimatedContainer(
                          duration: const Duration(milliseconds: 150),
                          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
                          decoration: BoxDecoration(
                            color: isSelected ? const Color(0xFF35D193) : const Color(0xFF1A2130),
                            borderRadius: BorderRadius.circular(14),
                            border: Border.all(
                              color: isSelected ? const Color(0xFF35D193) : const Color(0xFF2D3748),
                            ),
                          ),
                          child: Text(tag, style: TextStyle(color: isSelected ? Colors.white : const Color(0xFF8A9AAB), fontSize: 11, fontWeight: FontWeight.bold)),
                        ),
                      );
                    }).toList(),
                  ),
                  const SizedBox(height: 24),

                  // Post button
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton.icon(
                      onPressed: () {
                        // Capture messenger BEFORE popping so context is still valid
                        final messenger = ScaffoldMessenger.of(context);
                        Navigator.pop(context);
                        messenger.showSnackBar(
                          SnackBar(
                            backgroundColor: const Color(0xFF0F7A59),
                            behavior: SnackBarBehavior.floating,
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                            content: Row(
                              children: const [
                                Icon(Icons.check_circle, color: Colors.white),
                                SizedBox(width: 8),
                                Text("Snap posted! Your campus is notified 🔥", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                              ],
                            ),
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF35D193),
                        elevation: 0,
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                      ),
                      icon: const Icon(Icons.send, color: Colors.white),
                      label: const Text("Post Snap to Campus", style: TextStyle(color: Colors.white, fontSize: 15, fontWeight: FontWeight.bold)),
                    ),
                  ),
                  const SizedBox(height: 24),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
