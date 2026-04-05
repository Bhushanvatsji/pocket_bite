import 'package:flutter/material.dart';
import 'login_page.dart';
import '../../../main_nav/presentation/pages/main_nav_shell.dart';

class CreateAccountPage extends StatelessWidget {
  const CreateAccountPage({super.key});

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
          Center(
            child: Container(
              margin: const EdgeInsets.only(right: 24),
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              decoration: BoxDecoration(color: const Color(0xFFE2E8F0), borderRadius: BorderRadius.circular(20)),
              child: const Text("STEP 04 / 12", style: TextStyle(color: Color(0xFF4A5568), fontSize: 9, fontWeight: FontWeight.w800, letterSpacing: 0.5)),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
        child: Column(
          children: [
            Row(
              children: [
                _buildProgressSegment(true),
                const SizedBox(width: 8),
                _buildProgressSegment(true),
                const SizedBox(width: 8),
                _buildProgressSegment(true),
                const SizedBox(width: 8),
                _buildProgressSegment(true),
                const SizedBox(width: 8),
                _buildProgressSegment(false),
                const SizedBox(width: 8),
                _buildProgressSegment(false),
              ],
            ),
            const SizedBox(height: 32),
            const Text(
              "Joining the Campus",
              style: TextStyle(fontSize: 32, fontWeight: FontWeight.w900, color: Color(0xFF1C2126)),
            ),
            const SizedBox(height: 12),
            const Text(
              "Personalized Profile Setup: Tailoring\nthe experience from day one.",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 15, color: Color(0xFF5F6C7B), fontWeight: FontWeight.w500, height: 1.4),
            ),
            const SizedBox(height: 32),

            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(32),
                boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.04), blurRadius: 20, offset: const Offset(0, 10))],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildLabel("FULL NAME"),
                  _buildInputField(icon: Icons.person, hintText: "John Doe"),
                  const SizedBox(height: 20),
                  _buildLabel("STUDENT EMAIL"),
                  _buildInputField(icon: Icons.school, hintText: "student@university.edu"),
                  const SizedBox(height: 8),
                  Row(
                    children: const [
                      Icon(Icons.verified_user, color: Color(0xFF0F7A59), size: 12),
                      SizedBox(width: 6),
                      Text("Email will be used for campus verification", style: TextStyle(color: Color(0xFF0F7A59), fontSize: 10, fontWeight: FontWeight.bold)),
                    ],
                  ),
                  const SizedBox(height: 20),
                  _buildLabel("COLLEGE / CAMPUS NAME"),
                  _buildDropdownField(icon: Icons.location_on, hintText: "Select your campus"),
                  const SizedBox(height: 20),
                  _buildLabel("PASSWORD"),
                  _buildInputField(icon: Icons.lock, hintText: "••••••••", isObscure: true),
                  const SizedBox(height: 20),
                  _buildLabel("CONFIRM PASSWORD"),
                  _buildInputField(icon: Icons.key, hintText: "••••••••", isObscure: true),
                  const SizedBox(height: 32),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(builder: (_) => const MainNavShell()),
                          (route) => false,
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF35D193),
                        elevation: 0,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
                        padding: const EdgeInsets.symmetric(vertical: 16),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Text("Create Account", style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold)),
                          SizedBox(width: 8),
                          Icon(Icons.arrow_forward, color: Colors.white, size: 18),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 32),
            GestureDetector(
              onTap: () => Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => const LoginPage())),
              child: RichText(
                text: const TextSpan(
                  style: TextStyle(fontSize: 14, color: Color(0xFF5F6C7B)),
                  children: [
                    TextSpan(text: "Already have an account? "),
                    TextSpan(text: "Sign In", style: TextStyle(fontWeight: FontWeight.bold, color: Color(0xFF0F7A59))),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 32),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(30),
                border: Border.all(color: const Color(0xFFE2E8F0)),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text("TRUSTED", style: TextStyle(fontSize: 9, fontWeight: FontWeight.bold, color: Color(0xFF8A9AAB), letterSpacing: 1.0)),
                  Container(height: 12, width: 1, color: const Color(0xFFE2E8F0), margin: const EdgeInsets.symmetric(horizontal: 12)),
                  _buildPagerNumber("01"),
                  _buildPagerNumber("02"),
                  _buildPagerNumber("03"),
                  _buildPagerNumberActive("04"),
                  _buildPagerNumber("05"),
                  const Padding(padding: EdgeInsets.symmetric(horizontal: 6), child: Text("...", style: TextStyle(color: Color(0xFF8A9AAB), fontSize: 12))),
                  _buildPagerNumber("12"),
                ],
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  Widget _buildProgressSegment(bool isActive) {
    return Expanded(
      child: Container(
        height: 4,
        decoration: BoxDecoration(
          color: isActive ? const Color(0xFF0F7A59) : const Color(0xFFE2E8F0),
          borderRadius: BorderRadius.circular(2),
        ),
      ),
    );
  }

  Widget _buildLabel(String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0, left: 4.0),
      child: Text(text, style: const TextStyle(fontSize: 10, fontWeight: FontWeight.bold, color: Color(0xFF4A5568), letterSpacing: 1.0)),
    );
  }

  Widget _buildInputField({required IconData icon, required String hintText, bool isObscure = false}) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(color: const Color(0xFFE2E8F0).withOpacity(0.5), borderRadius: BorderRadius.circular(24)),
      child: TextField(
        obscureText: isObscure,
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: TextStyle(color: const Color(0xFF8A9AAB), fontSize: 14, letterSpacing: isObscure ? 2.0 : 0.0),
          border: InputBorder.none,
          icon: Icon(icon, color: const Color(0xFF8A9AAB), size: 18),
        ),
      ),
    );
  }

  Widget _buildDropdownField({required IconData icon, required String hintText}) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(color: const Color(0xFFE2E8F0).withOpacity(0.5), borderRadius: BorderRadius.circular(24)),
      child: IgnorePointer(
        child: TextField(
          decoration: InputDecoration(
            hintText: hintText,
            hintStyle: const TextStyle(color: Color(0xFF1C2126), fontSize: 14),
            border: InputBorder.none,
            icon: Icon(icon, color: const Color(0xFF8A9AAB), size: 18),
            suffixIcon: const Icon(Icons.keyboard_arrow_down, color: Color(0xFF8A9AAB)),
          ),
        ),
      ),
    );
  }

  Widget _buildPagerNumber(String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 6),
      child: Text(text, style: const TextStyle(color: Color(0xFF8A9AAB), fontSize: 12, fontWeight: FontWeight.bold)),
    );
  }

  Widget _buildPagerNumberActive(String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 6),
      child: Column(
        children: [
          Container(height: 2, width: 12, color: const Color(0xFF0F7A59), margin: const EdgeInsets.only(bottom: 2)),
          Text(text, style: const TextStyle(color: Color(0xFF0F7A59), fontSize: 12, fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }
}