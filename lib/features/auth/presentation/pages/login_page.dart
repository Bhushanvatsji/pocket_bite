import 'package:flutter/material.dart';
import 'create_account_page.dart';
import '../../../main_nav/presentation/pages/main_nav_shell.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF1FDFB),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "PocketBite",
                    style: TextStyle(
                      color: Color(0xFF1E9B70),
                      fontWeight: FontWeight.w900,
                      fontSize: 20,
                      letterSpacing: -0.5,
                    ),
                  ),
                  const SizedBox()
                ],
              ),
              const SizedBox(height: 48),
              Row(
                children: [
                  Container(width: 32, height: 2, margin: const EdgeInsets.only(right: 12), decoration: BoxDecoration(color: const Color(0xFF0F7A59), borderRadius: BorderRadius.circular(1))),
                  const Flexible(
                    child: Text(
                      "STUDENT-FIRST AUTHENTICATION",
                      style: TextStyle(color: Color(0xFF0F7A59), fontSize: 10, fontWeight: FontWeight.w800, letterSpacing: 1.0),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              RichText(
                text: const TextSpan(
                  style: TextStyle(fontSize: 48, fontWeight: FontWeight.w900, color: Color(0xFF1C2126), height: 1.1),
                  children: [
                    TextSpan(text: "Welcome\n"),
                    TextSpan(text: "back"),
                    TextSpan(text: ".", style: TextStyle(color: Color(0xFF1E9B70))),
                  ],
                ),
              ),
              const SizedBox(height: 12),
              const Text("Fast, secure, and friction-free.", style: TextStyle(fontSize: 16, color: Color(0xFF5F6C7B), fontWeight: FontWeight.w500)),
              const SizedBox(height: 40),

              // Login Card
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
                    const Text("UNIVERSITY EMAIL", style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold, color: Color(0xFF4A5568), letterSpacing: 1.0)),
                    const SizedBox(height: 8),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      decoration: BoxDecoration(color: const Color(0xFFE2E8F0).withOpacity(0.5), borderRadius: BorderRadius.circular(24)),
                      child: const TextField(
                        decoration: InputDecoration(
                          hintText: "student@university.edu",
                          hintStyle: TextStyle(color: Color(0xFF8A9AAB), fontSize: 13),
                          border: InputBorder.none,
                          icon: Icon(Icons.alternate_email, color: Color(0xFF8A9AAB), size: 18),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        Text("PASSWORD", style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold, color: Color(0xFF4A5568), letterSpacing: 1.0)),
                        Text("FORGOT?", style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold, color: Color(0xFF0F7A59), letterSpacing: 1.0)),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      decoration: BoxDecoration(color: const Color(0xFFE2E8F0).withOpacity(0.5), borderRadius: BorderRadius.circular(24)),
                      child: const TextField(
                        obscureText: true,
                        decoration: InputDecoration(
                          hintText: "••••••••",
                          hintStyle: TextStyle(color: Color(0xFF8A9AAB), fontSize: 16, letterSpacing: 2.0),
                          border: InputBorder.none,
                          icon: Icon(Icons.lock_outline, color: Color(0xFF8A9AAB), size: 18),
                          suffixIcon: Icon(Icons.visibility_outlined, color: Color(0xFF8A9AAB), size: 18),
                        ),
                      ),
                    ),
                    const SizedBox(height: 28),
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
                            Text("Login", style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold)),
                            SizedBox(width: 8),
                            Icon(Icons.arrow_forward, color: Colors.white, size: 18),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 28),
                    Row(
                      children: [
                        Expanded(child: Container(height: 1, color: const Color(0xFFE2E8F0))),
                        const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 16),
                          child: Text("OR CONTINUE WITH", style: TextStyle(fontSize: 9, fontWeight: FontWeight.bold, color: Color(0xFF8A9AAB), letterSpacing: 1.0)),
                        ),
                        Expanded(child: Container(height: 1, color: const Color(0xFFE2E8F0))),
                      ],
                    ),
                    const SizedBox(height: 24),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton.icon(
                        onPressed: () {
                          Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(builder: (_) => const MainNavShell()),
                            (route) => false,
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFFF1F5F9),
                          elevation: 0,
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
                          padding: const EdgeInsets.symmetric(vertical: 16),
                        ),
                        icon: Image.network("https://img.icons8.com/color/48/000000/google-logo.png", height: 16),
                        label: const Text("Continue with Google", style: TextStyle(color: Color(0xFF1C2126), fontSize: 14, fontWeight: FontWeight.w700)),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 40),
              Center(
                child: GestureDetector(
                  onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const CreateAccountPage())),
                  child: RichText(
                    text: const TextSpan(
                      style: TextStyle(fontSize: 14, color: Color(0xFF5F6C7B)),
                      children: [
                        TextSpan(text: "Don't have an account? "),
                        TextSpan(text: "Join the community", style: TextStyle(fontWeight: FontWeight.bold, color: Color(0xFF0F7A59))),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}