import 'package:flutter/material.dart';
import 'login_page.dart';
import '../../../main_nav/presentation/pages/main_nav_shell.dart';

class OnboardingPage extends StatelessWidget {
  const OnboardingPage({super.key});

  void _goToLogin(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => const LoginPage()),
    );
  }

  void _skipToHome(BuildContext context) {
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (_) => const MainNavShell()),
      (route) => false,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF1FDFB),
      appBar: AppBar(
        backgroundColor: const Color(0xFFF1FDFB),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.menu, color: Color(0xFF1E9B70)),
          onPressed: () {},
        ),
        title: const Text(
          "PocketBite",
          style: TextStyle(
            color: Color(0xFF1E9B70),
            fontWeight: FontWeight.w900,
            fontSize: 20,
            letterSpacing: -0.5,
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => _skipToHome(context),
            child: const Text(
              "Skip",
              style: TextStyle(color: Color(0xFF0F7A59), fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(24, 20, 24, 40),
        child: Column(
          children: [
            const Text(
              "Onboarding the Student.",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.w900,
                color: Color(0xFF1C2126),
                height: 1.1,
              ),
            ),
            const SizedBox(height: 16),
            const Text(
              "Intuitive, visual, and value-driven. We transform the student meal experience from a chore into a seamless discovery journey.",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 15,
                color: Color(0xFF5F6C7B),
                fontWeight: FontWeight.w500,
                height: 1.5,
              ),
            ),
            const SizedBox(height: 32),

            // Step 1
            _buildStepCard(
              step: "STEP 1",
              stepColor: const Color(0xFF5AEDB1),
              title: "Eat Big, Spend Small",
              desc: "Curated deals and student-exclusive bundles that make your dollar go further without compromising on portions.",
              heroWidget: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.network(
                  "https://images.unsplash.com/photo-1550547660-d9450f859349?ixlib=rb-1.2.1&auto=format&fit=crop&w=400&q=80",
                  height: 140,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(height: 24),

            // Step 2
            _buildStepCard(
              step: "STEP 2",
              stepColor: const Color(0xFFD4E1FA),
              title: "Eat Smart, Live Better",
              desc: "Personalized nutritional tracking that syncs with your fitness goals. We highlight the fuel your brain needs for finals.",
              heroWidget: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.network(
                  "https://images.unsplash.com/photo-1490645935967-10de6ba17061?ixlib=rb-1.2.1&auto=format&fit=crop&w=400&q=80",
                  height: 140,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(height: 24),

            // Step 3 with CTA
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(32),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.04),
                    blurRadius: 20,
                    offset: const Offset(0, 10),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
                    decoration: BoxDecoration(
                      color: const Color(0xFF22D3EE),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: const Text("STEP 3", style: TextStyle(color: Colors.white, fontSize: 10, fontWeight: FontWeight.w900)),
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    "Smart Discovery, Zero Effort",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w900,
                      color: Color(0xFF1C2126),
                      height: 1.2,
                    ),
                  ),
                  const SizedBox(height: 12),
                  const Text(
                    "Our AI learns your schedule, budget, and cravings to recommend the perfect meal before you even know you're hungry.",
                    style: TextStyle(fontSize: 14, color: Color(0xFF5F6C7B), height: 1.5),
                  ),
                  const SizedBox(height: 24),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Flexible(
                        child: Row(
                          children: [
                            Container(width: 16, height: 6, decoration: BoxDecoration(color: const Color(0xFF0F7A59), borderRadius: BorderRadius.circular(3))),
                            const SizedBox(width: 6),
                            Container(width: 6, height: 6, decoration: const BoxDecoration(color: Color(0xFFE2E8F0), shape: BoxShape.circle)),
                            const SizedBox(width: 6),
                            Container(width: 6, height: 6, decoration: const BoxDecoration(color: Color(0xFFE2E8F0), shape: BoxShape.circle)),
                          ],
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () => _goToLogin(context),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF35D193),
                          elevation: 0,
                          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: const [
                            Text("Next Step", style: TextStyle(color: Color(0xFF0F7A59), fontWeight: FontWeight.bold, fontSize: 13)),
                            SizedBox(width: 4),
                            Icon(Icons.arrow_forward, color: Color(0xFF0F7A59), size: 16),
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
      ),
    );
  }

  Widget _buildStepCard({
    required String step,
    required Color stepColor,
    required String title,
    required String desc,
    required Widget heroWidget,
  }) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(32),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.04),
            blurRadius: 20,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
            decoration: BoxDecoration(color: stepColor, borderRadius: BorderRadius.circular(16)),
            child: Text(
              step,
              style: TextStyle(
                color: stepColor.computeLuminance() > 0.5 ? const Color(0xFF0F7A59) : Colors.white,
                fontSize: 10,
                fontWeight: FontWeight.w900,
              ),
            ),
          ),
          const SizedBox(height: 16),
          Text(title, style: const TextStyle(fontSize: 24, fontWeight: FontWeight.w900, color: Color(0xFF1C2126), height: 1.2)),
          const SizedBox(height: 12),
          Text(desc, style: const TextStyle(fontSize: 14, color: Color(0xFF5F6C7B), height: 1.5)),
          const SizedBox(height: 20),
          heroWidget,
        ],
      ),
    );
  }
}