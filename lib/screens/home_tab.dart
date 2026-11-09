import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../widgets/animated_background.dart';
import '../widgets/glass_card.dart';

class HomeTab extends StatelessWidget {
  const HomeTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF000000),
      body: Stack(
        children: [
          const AnimatedBackground(),
          SafeArea(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 20),
                  Text('مرحباً بك في', style: GoogleFonts.tajawal(fontSize: 20, color: Colors.white70)),
                  Text('NEXUS PRO', style: GoogleFonts.tajawal(fontSize: 40, fontWeight: FontWeight.w900, color: Colors.white)),
                  const SizedBox(height: 30),
                  
                  GlassCard(
                    height: 60,
                    radius: 20,
                    child: TextField(
                      style: GoogleFonts.tajawal(color: Colors.white),
                      decoration: InputDecoration(
                        hintText: 'ابحث في التطبيق...',
                        hintStyle: GoogleFonts.tajawal(color: Colors.white54),
                        prefixIcon: const Icon(Icons.search, color: Colors.white70),
                        border: InputBorder.none,
                        contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
                      ),
                    ),
                  ),
                  const SizedBox(height: 30),
                  
                  Text('اكتشف المزيد', style: GoogleFonts.tajawal(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white)),
                  const SizedBox(height: 20),
                  
                  SizedBox(
                    height: 200,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: [
                        _buildFeatureCard('تحليل ذكي', Icons.analytics, const Color(0xFF0A84FF)),
                        _buildFeatureCard('أدوات متقدمة', Icons.build, const Color(0xFF5E5CE6)),
                        _buildFeatureCard('تقارير فورية', Icons.speed, const Color(0xFFF093FB)),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFeatureCard(String title, IconData icon, Color color) {
    return Padding(
      padding: const EdgeInsets.only(right: 16.0),
      child: GlassCard(
        width: 160,
        radius: 24,
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon, size: 50, color: color),
              const SizedBox(height: 15),
              Text(title, style: GoogleFonts.tajawal(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white)),
            ],
          ),
        ),
      ),
    );
  }
}