import 'package:flutter/material.dart';
import '../../../../core/services/backend_service.dart';
import '../../../../core/services/location_service.dart';
import '../../../../models/menu_item_model.dart';

class ComparisonScreen extends StatefulWidget {
  final String searchQuery;

  const ComparisonScreen({super.key, required this.searchQuery});

  @override
  State<ComparisonScreen> createState() => _ComparisonScreenState();
}

class _ComparisonScreenState extends State<ComparisonScreen> {
  final BackendService _backendService = BackendService();
  List<MenuItemModel> _results = [];
  bool _isLoading = true;
  String _currentSort = 'Cheapest';

  @override
  void initState() {
    super.initState();
    _fetchResults();
  }

  Future<void> _fetchResults() async {
    setState(() => _isLoading = true);
    final items = await _backendService.searchFoodAcrossRestaurants(widget.searchQuery);
    setState(() {
      _results = items;
      _isLoading = false;
    });
    _applySort();
  }

  void _applySort() {
    if (_results.isEmpty) return;
    setState(() {
      if (_currentSort == 'Cheapest') {
        _results.sort((a, b) => a.price.compareTo(b.price));
      } else if (_currentSort == 'Nearest') {
        _results.sort((a, b) => (a.distanceKm ?? 99).compareTo(b.distanceKm ?? 99));
      } else if (_currentSort == 'Fastest') {
        _results.sort((a, b) => (a.avgWaitTime ?? 99).compareTo(b.avgWaitTime ?? 99));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1E1E1E),
      appBar: AppBar(
        title: Text('Results for "${widget.searchQuery}"', style: const TextStyle(fontWeight: FontWeight.bold)),
        backgroundColor: const Color(0xFF1E1E1E),
        elevation: 0,
        actions: [
          IconButton(
            icon: const Icon(Icons.filter_list),
            onPressed: () {
              // Show filter bottom sheet later
            },
          )
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Sort Options
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            child: Row(
              children: [
                _buildSortChip('Cheapest'),
                _buildSortChip('Nearest'),
                _buildSortChip('Fastest'),
              ],
            ),
          ),
          
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            child: Text(
              '${_results.length} places found',
              style: const TextStyle(color: Colors.grey, fontSize: 14),
            ),
          ),

          // Results List
          Expanded(
            child: _isLoading
                ? const Center(child: CircularProgressIndicator(color: Color(0xFF27D39A)))
                : _results.isEmpty
                    ? _buildEmptyState()
                    : ListView.builder(
                        padding: const EdgeInsets.all(16.0),
                        itemCount: _results.length,
                        itemBuilder: (context, index) {
                          return _buildComparisonCard(_results[index], index);
                        },
                      ),
          ),
        ],
      ),
    );
  }

  Widget _buildSortChip(String label) {
    bool isSelected = _currentSort == label;
    return GestureDetector(
      onTap: () {
        setState(() {
          _currentSort = label;
          _applySort();
        });
      },
      child: Container(
        margin: const EdgeInsets.only(right: 8.0),
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        decoration: BoxDecoration(
          color: isSelected ? const Color(0xFF27D39A) : Colors.transparent,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: isSelected ? const Color(0xFF27D39A) : Colors.grey.shade800),
        ),
        child: Text(
          label,
          style: TextStyle(
            color: isSelected ? Colors.black : Colors.white,
            fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
          ),
        ),
      ),
    );
  }

  Widget _buildComparisonCard(MenuItemModel item, int index) {
    // Highlight badges based on the top 1 result for current sort
    String? badgeLabel;
    Color? badgeColor;
    
    if (index == 0) {
      if (_currentSort == 'Cheapest') {
        badgeLabel = 'Best Value';
        badgeColor = const Color(0xFF27D39A);
      } else if (_currentSort == 'Nearest') {
        badgeLabel = 'Closest to you';
        badgeColor = Colors.blueAccent;
      } else if (_currentSort == 'Fastest') {
        badgeLabel = 'Quicker Bite';
        badgeColor = Colors.orangeAccent;
      }
    }

    return Container(
      margin: const EdgeInsets.only(bottom: 16.0),
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: const Color(0xFF2C2C2C),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: index == 0 ? (badgeColor ?? Colors.transparent) : Colors.transparent, width: 2),
        boxShadow: const [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 10,
            offset: Offset(0, 4),
          )
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                item.restaurantName,
                style: const TextStyle(color: Colors.grey, fontSize: 13, fontWeight: FontWeight.w500),
              ),
              if (badgeLabel != null)
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                    color: badgeColor!.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Text(
                    badgeLabel,
                    style: TextStyle(color: badgeColor, fontSize: 10, fontWeight: FontWeight.bold),
                  ),
                ),
            ],
          ),
          const SizedBox(height: 8),
          Text(
            item.foodName,
            style: const TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 12),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '₹${item.price.toStringAsFixed(0)}',
                style: const TextStyle(color: Color(0xFF27D39A), fontSize: 22, fontWeight: FontWeight.bold),
              ),
              Row(
                children: [
                  const Icon(Icons.location_on, color: Colors.grey, size: 14),
                  const SizedBox(width: 4),
                  Text('${item.distanceKm?.toStringAsFixed(1)} km', style: const TextStyle(color: Colors.grey, fontSize: 12)),
                  const SizedBox(width: 12),
                  const Icon(Icons.timer, color: Colors.grey, size: 14),
                  const SizedBox(width: 4),
                  Text('${item.avgWaitTime} min', style: const TextStyle(color: Colors.grey, fontSize: 12)),
                ],
              )
            ],
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              Expanded(
                child: ElevatedButton.icon(
                  onPressed: () async {
                    try {
                      // Fetch the restaurant lat/lng from the DB in real app
                      // For MVP, passing dummy values 
                      final locationService = LocationService();
                      await locationService.openGoogleMaps(30.765, 76.575); 
                    } catch (e) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Could not open map')),
                      );
                    }
                  },
                  icon: const Icon(Icons.directions, size: 16),
                  label: const Text('Navigate'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF27D39A),
                    foregroundColor: Colors.black,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                  ),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: OutlinedButton(
                  onPressed: () {},
                  style: OutlinedButton.styleFrom(
                    side: const BorderSide(color: Colors.grey),
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                  ),
                  child: const Text('View Shop'),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }

  Widget _buildEmptyState() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.search_off, size: 60, color: Colors.grey.shade600),
          const SizedBox(height: 16),
          const Text(
            'No nearby results found.',
            style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          const Text(
            'Try searching for something else.',
            style: TextStyle(color: Colors.grey, fontSize: 14),
          ),
        ],
      ),
    );
  }
}
