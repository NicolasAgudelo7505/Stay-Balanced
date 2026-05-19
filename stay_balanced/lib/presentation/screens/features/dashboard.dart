import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';  // Lo activamos después

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Stay Balanced',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: false,
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications_outlined),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              '¡Hola, Nicolás!',
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
            ),
            const Text(
              'Aquí está tu resumen financiero',
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ),
            const SizedBox(height: 24),

            // Placeholder de Presupuesto
            Container(
              height: 180,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.blue[700],
                borderRadius: BorderRadius.circular(20),
              ),
              child: const Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Presupuesto Mensual',
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
                    Text(
                      '\$1,250.000',
                      style: TextStyle(color: Colors.white, fontSize: 32, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      '60% gastado',
                      style: TextStyle(color: Colors.white70),
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 16),

            Container(
              height: 100,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.orange[100],
                borderRadius: BorderRadius.circular(16),
              ),
              child: const Center(
                child: Text(
                  '🔥 Racha Actual: 7 días',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
            ),

            const SizedBox(height: 30),
            const Text(
              'Próximamente más widgets...',
              style: TextStyle(fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }
}