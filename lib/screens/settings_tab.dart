import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../widgets/animated_background.dart';
import '../widgets/glass_card.dart';

class SettingsTab extends StatefulWidget {
  const SettingsTab({super.key});

  @override
  State<SettingsTab> createState() => _SettingsTabState();
}

class _SettingsTabState extends State<SettingsTab> {
  bool _notifications = true;
  bool _darkMode = true;

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
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 20),
                  Text('الإعدادات', style: GoogleFonts.tajawal(fontSize: 36, fontWeight: FontWeight.bold, color: Colors.white)),
                  const SizedBox(height: 30),
                  
                  GlassCard(
                    child: Column(
                      children: [
                        SwitchListTile(
                          title: Text('الإشعارات', style: GoogleFonts.tajawal(color: Colors.white)),
                          value: _notifications,
                          activeColor: const Color(0xFF0A84FF),
                          onChanged: (val) => setState(() => _notifications = val),
                        ),
                        Divider(color: Colors.white.withOpacity(0.1)),
                        SwitchListTile(
                          title: Text('الوضع الليلي', style: GoogleFonts.tajawal(color: Colors.white)),
                          value: _darkMode,
                          activeColor: const Color(0xFF0A84FF),
                          onChanged: (val) => setState(() => _darkMode = val),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                  GlassCard(
                    height: 60,
                    onTap: () {},
                    child: Center(child: Text('حول التطبيق', style: GoogleFonts.tajawal(fontSize: 18, color: Colors.white))),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}