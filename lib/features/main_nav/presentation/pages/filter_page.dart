import 'package:flutter/material.dart';

class FilterPage extends StatefulWidget {
  const FilterPage({super.key});

  @override
  State<FilterPage> createState() => _FilterPageState();
}

class _FilterPageState extends State<FilterPage> {
  double _budget = 500;
  double _distance = 2.5;
  bool _healthy = true;
  bool _openNow = true;
  String _selectedMeal = 'Breakfast';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text("PocketBite", style: TextStyle(color: Color(0xFF1E9B70), fontWeight: FontWeight.w900)),
        centerTitle: false,
        backgroundColor: const Color(0xFFF5F7F8),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.menu, color: Color(0xFF1E9B70)),
          onPressed: () {},
        ),
      ),
      body: Container(
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(top: Radius.circular(32)),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Drag handle
              Center(
                child: Container(
                  width: 40,
                  height: 4,
                  margin: const EdgeInsets.only(bottom: 24),
                  decoration: BoxDecoration(
                    color: const Color(0xFFD6DBDF),
                    borderRadius: BorderRadius.circular(2),
                  ),
                ),
              ),
              
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Filters",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w800,
                      color: Color(0xFF1C2126),
                    ),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: const Text(
                      "Reset All",
                      style: TextStyle(
                        color: Color(0xFF1E9B70),
                        fontWeight: FontWeight.w700,
                        fontSize: 14,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 24),

              // Budget Range
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text("Budget Range", style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700, color: Color(0xFF1C2126))),
                  Text("₹0 - ₹${_budget.toInt()}+", style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w800, color: Color(0xFF1E9B70))),
                ],
              ),
              SliderTheme(
                data: SliderThemeData(
                  trackHeight: 6,
                  activeTrackColor: const Color(0xFF35D193),
                  inactiveTrackColor: const Color(0xFFE2E8F0),
                  thumbColor: Colors.white,
                  thumbShape: const RoundSliderThumbShape(enabledThumbRadius: 10, elevation: 4),
                  overlayShape: const RoundSliderOverlayShape(overlayRadius: 20),
                ),
                child: Slider(
                  value: _budget,
                  min: 0,
                  max: 1000,
                  onChanged: (val) {
                    setState(() => _budget = val);
                  },
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text("₹0", style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold, color: Color(0xFF8A9AAB))),
                  Text("₹1000", style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold, color: Color(0xFF8A9AAB))),
                ],
              ),
              const SizedBox(height: 28),

              // Distance
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text("Distance", style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700, color: Color(0xFF1C2126))),
                  Text("Under ${_distance.toStringAsFixed(1)}km", style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w800, color: Color(0xFF1E9B70))),
                ],
              ),
              SliderTheme(
                data: SliderThemeData(
                  trackHeight: 6,
                  activeTrackColor: const Color(0xFF35D193),
                  inactiveTrackColor: const Color(0xFFE2E8F0),
                  thumbColor: Colors.white,
                  thumbShape: const RoundSliderThumbShape(enabledThumbRadius: 10, elevation: 4),
                ),
                child: Slider(
                  value: _distance,
                  min: 0,
                  max: 5,
                  onChanged: (val) {
                    setState(() => _distance = val);
                  },
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text("0KM", style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold, color: Color(0xFF8A9AAB))),
                  Text("5KM", style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold, color: Color(0xFF8A9AAB))),
                ],
              ),
              const SizedBox(height: 28),

              // Toggles
              Row(
                children: [
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                      decoration: BoxDecoration(
                        color: const Color(0xFFF5F7F8),
                        borderRadius: BorderRadius.circular(24),
                      ),
                      child: Row(
                        children: [
                          const Icon(Icons.eco_rounded, color: Color(0xFF1E9B70), size: 20),
                          const SizedBox(width: 8),
                          const Expanded(child: Text("Healthy", style: TextStyle(fontWeight: FontWeight.w600, color: Color(0xFF1C2126)))),
                          Switch(
                            value: _healthy,
                            onChanged: (v) => setState(() => _healthy = v),
                            activeThumbColor: Colors.white,
                            activeTrackColor: const Color(0xFF0F7A59),
                            inactiveTrackColor: const Color(0xFFD6DBDF),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                      decoration: BoxDecoration(
                        color: const Color(0xFFF5F7F8),
                        borderRadius: BorderRadius.circular(24),
                      ),
                      child: Row(
                        children: [
                          const Icon(Icons.access_time_filled, color: Color(0xFF1E9B70), size: 20),
                          const SizedBox(width: 8),
                          const Expanded(child: Text("Open\nNow", style: TextStyle(fontWeight: FontWeight.w600, color: Color(0xFF1C2126), fontSize: 13, height: 1.1))),
                          Switch(
                            value: _openNow,
                            onChanged: (v) => setState(() => _openNow = v),
                            activeThumbColor: Colors.white,
                            activeTrackColor: const Color(0xFF0F7A59),
                            inactiveTrackColor: const Color(0xFFD6DBDF),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 32),

              // Meal Type
              const Text("Meal Type", style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700, color: Color(0xFF1C2126))),
              const SizedBox(height: 16),
              Wrap(
                spacing: 12,
                runSpacing: 12,
                children: [
                  _buildTag("Breakfast", _selectedMeal == "Breakfast"),
                  _buildTag("Lunch", _selectedMeal == "Lunch"),
                  _buildTag("Dinner", _selectedMeal == "Dinner"),
                  _buildTag("Snacks", _selectedMeal == "Snacks"),
                  _buildTag("Beverages", _selectedMeal == "Beverages"),
                ],
              ),
              const Spacer(),
              
              // Apply Button
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF35D193),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(28)),
                    padding: const EdgeInsets.symmetric(vertical: 18),
                    elevation: 0,
                  ),
                  child: const Text(
                    "Apply Filters",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTag(String label, bool isSelected) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedMeal = label;
        });
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        decoration: BoxDecoration(
          color: isSelected ? const Color(0xFF0B6B4A) : const Color(0xFFE8ECEF),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Text(
          label,
          style: TextStyle(
            color: isSelected ? Colors.white : const Color(0xFF4A5568),
            fontWeight: FontWeight.w600,
            fontSize: 14,
          ),
        ),
      ),
    );
  }
}