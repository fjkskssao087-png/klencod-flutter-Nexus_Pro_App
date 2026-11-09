import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../widgets/animated_background.dart';
import '../widgets/glass_card.dart';

class StoreTab extends StatefulWidget {
  const StoreTab({super.key});

  @override
  State<StoreTab> createState() => _StoreTabState();
}

class _StoreTabState extends State<StoreTab> {
  int _cartCount = 0;

  final List<Map<String, dynamic>> products = [
    {'name': 'منتج رقم 1', 'price': 99, 'color': const Color(0xFF0A84FF)},
    {'name': 'منتج رقم 2', 'price': 149, 'color': const Color(0xFF5E5CE6)},
    {'name': 'منتج رقم 3', 'price': 199, 'color': const Color(0xFFF093FB)},
    {'name': 'منتج رقم 4', 'price': 249, 'color': const Color(0xFF30D158)},
  ];

  void _addToCart(String name) {
    setState(() {
      _cartCount++;
    });
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('تمت إضافة $name للسلة!', style: GoogleFonts.tajawal()),
        backgroundColor: const Color(0xFF5E5CE6),
        duration: const Duration(seconds: 1),
      ),
    );
  }

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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('المتجر', style: GoogleFonts.tajawal(fontSize: 36, fontWeight: FontWeight.bold, color: Colors.white)),
                      Stack(
                        children: [
                          const Icon(Icons.shopping_cart, color: Colors.white, size: 30),
                          if (_cartCount > 0)
                            Positioned(
                              right: 0,
                              child: Container(
                                padding: const EdgeInsets.all(4),
                                decoration: const BoxDecoration(color: Colors.red, shape: BoxShape.circle),
                                child: Text('$_cartCount', style: const TextStyle(fontSize: 10, color: Colors.white)),
                              ),
                            )
                        ],
                      )
                    ],
                  ),
                  const SizedBox(height: 30),
                  Expanded(
                    child: GridView.builder(
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 16,
                        mainAxisSpacing: 16,
                        childAspectRatio: 0.75,
                      ),
                      itemCount: products.length,
                      itemBuilder: (context, index) {
                        final p = products[index];
                        return GlassCard(
                          radius: 20,
                          child: Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  height: 100,
                                  decoration: BoxDecoration(
                                    color: p['color'].withOpacity(0.3),
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  child: Center(child: Icon(Icons.star, color: p['color'], size: 50)),
                                ),
                                Text(p['name'], style: GoogleFonts.tajawal(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white)),
                                Text('\$${p['price']}', style: GoogleFonts.tajawal(fontSize: 20, fontWeight: FontWeight.bold, color: const Color(0xFFF093FB))),
                                SizedBox(
                                  width: double.infinity,
                                  child: ElevatedButton(
                                    onPressed: () => _addToCart(p['name']),
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: p['color'],
                                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                                    ),
                                    child: Text('أضف', style: GoogleFonts.tajawal(fontWeight: FontWeight.bold)),
                                  ),
                                )
                              ],
                            ),
                          ),
                        );
                      },
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
}