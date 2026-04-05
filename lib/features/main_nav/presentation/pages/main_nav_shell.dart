import 'package:flutter/material.dart';
import 'home_page.dart';
import 'explore_pages.dart';
import 'wallet_page.dart';
import 'profile_page.dart';
import 'recommendation_page.dart';

class MainNavShell extends StatefulWidget {
  final int initialIndex;
  const MainNavShell({super.key, this.initialIndex = 0});

  @override
  State<MainNavShell> createState() => _MainNavShellState();
}

class _MainNavShellState extends State<MainNavShell> {
  late int _currentIndex;

  @override
  void initState() {
    super.initState();
    _currentIndex = widget.initialIndex;
  }

  // 4 pages — FAB in center is not a page, it pushes a new route
  static const List<Widget> _pages = [
    HomePage(),
    ExplorePage(),
    WalletPage(),
    ProfilePage(),
  ];

  // 4 nav items: HOME | EXPLORE | [FAB gap] | WALLET | PROFILE
  static const List<_NavItem> _leftItems = [
    _NavItem(icon: Icons.home_outlined, activeIcon: Icons.home, label: "HOME"),
    _NavItem(icon: Icons.search_outlined, activeIcon: Icons.search, label: "EXPLORE"),
  ];

  static const List<_NavItem> _rightItems = [
    _NavItem(icon: Icons.account_balance_wallet_outlined, activeIcon: Icons.account_balance_wallet, label: "WALLET"),
    _NavItem(icon: Icons.person_outline, activeIcon: Icons.person, label: "PROFILE"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _currentIndex,
        children: _pages,
      ),
      floatingActionButton: _buildCenterFAB(context),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: _buildBottomNav(),
    );
  }

  Widget _buildCenterFAB(BuildContext context) {
    return Container(
      height: 60,
      width: 60,
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Color(0xFF35D193), Color(0xFF0B6B4A)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(
            color: const Color(0xFF0F7A59).withValues(alpha: 0.4),
            blurRadius: 16,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: FloatingActionButton(
        backgroundColor: Colors.transparent,
        elevation: 0,
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => const RecommendationPage()),
          );
        },
        child: const Icon(Icons.auto_awesome, color: Colors.white, size: 26),
      ),
    );
  }

  Widget _buildBottomNav() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: const BorderRadius.vertical(top: Radius.circular(28)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.07),
            blurRadius: 20,
            offset: const Offset(0, -4),
          ),
        ],
      ),
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
          child: Row(
            children: [
              // Left 2 items: HOME, EXPLORE
              ..._leftItems.asMap().entries.map((e) {
                final i = e.key; // global index 0, 1
                return Expanded(
                  child: GestureDetector(
                    onTap: () => setState(() => _currentIndex = i),
                    behavior: HitTestBehavior.opaque,
                    child: _buildNavItem(_leftItems[i], _currentIndex == i),
                  ),
                );
              }),

              // Center gap for FAB
              const SizedBox(width: 60),

              // Right 2 items: WALLET (idx 2), PROFILE (idx 3)
              ..._rightItems.asMap().entries.map((e) {
                final i = e.key + 2; // global index 2, 3
                return Expanded(
                  child: GestureDetector(
                    onTap: () => setState(() => _currentIndex = i),
                    behavior: HitTestBehavior.opaque,
                    child: _buildNavItem(_rightItems[e.key], _currentIndex == i),
                  ),
                );
              }),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildNavItem(_NavItem item, bool isActive) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 220),
      curve: Curves.easeInOut,
      margin: const EdgeInsets.symmetric(horizontal: 2),
      padding: isActive
          ? const EdgeInsets.symmetric(horizontal: 14, vertical: 8)
          : const EdgeInsets.symmetric(horizontal: 6, vertical: 8),
      decoration: BoxDecoration(
        color: isActive ? const Color(0xFF35D193) : Colors.transparent,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            isActive ? item.activeIcon : item.icon,
            color: isActive ? Colors.white : const Color(0xFF8A9AAB),
            size: 22,
          ),
          if (isActive) ...[
            const SizedBox(width: 6),
            Flexible(
              child: Text(
                item.label,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 11,
                  fontWeight: FontWeight.bold,
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ],
      ),
    );
  }
}

class _NavItem {
  final IconData icon;
  final IconData activeIcon;
  final String label;
  const _NavItem({required this.icon, required this.activeIcon, required this.label});
}
