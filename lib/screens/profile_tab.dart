import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../widgets/animated_background.dart';
import '../widgets/glass_card.dart';

class ProfileTab extends StatelessWidget {
  const ProfileTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF000000),
      body: Stack(
        children: [
          const AnimatedBackground(),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                children: [
                  const SizedBox(height: 40),
                  const CircleAvatar(
                    radius: 60,
                    backgroundColor: Color(0xFF5E5CE6),
                    child: Icon(Icons.person, size: 60, color: Colors.white),
                  ),
                  const SizedBox(height: 20),
                  Text('مستخدم NEXUS', style: GoogleFonts.tajawal(fontSize: 28, fontWeight: FontWeight.bold, color: Colors.white)),
                  Text('user@nexus.com', style: GoogleFonts.tajawal(fontSize: 16, color: Colors.white54)),
                  const SizedBox(height: 40),
                  
                  GlassCard(
                    height: 100,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        _buildStat('12', 'مشروع'),
                        _buildStat('450', 'نقطة'),
                        _buildStat('VIP', 'العضوية'),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                  GlassCard(
                    height: 60,
                    onTap: () {},
                    child: Center(child: Text('تعديل الملف الشخصي', style: GoogleFonts.tajawal(fontSize: 18, color: Colors.white))),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStat(String val, String label) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(val, style: GoogleFonts.tajawal(fontSize: 24, fontWeight: FontWeight.bold, color: const Color(0xFF0A84FF))),
        Text(label, style: GoogleFonts.tajawal(fontSize: 14, color: Colors.white54)),
      ],
    );
  }
}