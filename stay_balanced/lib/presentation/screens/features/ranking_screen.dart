import 'package:flutter/material.dart';

class RankingScreen extends StatefulWidget {
  const RankingScreen({super.key});

  @override
  State<RankingScreen> createState() => _RankingScreenState();
}

class _RankingScreenState extends State<RankingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Ranking de Amigos',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: false,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Mi posición destacada
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.amber[100],
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: Colors.amber, width: 2),
              ),
              child: Row(
                children: [
                  const CircleAvatar(
                    radius: 28,
                    backgroundColor: Colors.amber,
                    child: Text('4', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
                  ),
                  const SizedBox(width: 16),
                  const Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Tu posición',
                          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                        ),
                        Text(
                          'Nicolás • 12 días en racha',
                          style: TextStyle(fontSize: 15),
                        ),
                      ],
                    ),
                  ),
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        '🏆',
                        style: TextStyle(fontSize: 32),
                      ),
                      Text('4° Lugar'),
                    ],
                  ),
                ],
              ),
            ),

            const SizedBox(height: 24),

            const Text(
              'Leaderboard',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 12),

            // Ranking List
            Expanded(
              child: ListView.builder(
                itemCount: 10,
                itemBuilder: (context, index) {
                  final names = [
                    'Laura Martínez',
                    'Carlos López',
                    'Valentina Ruiz',
                    'Nicolás García',
                    'Mariana Torres',
                    'Andrés Pérez',
                    'Sofía Ramírez',
                    'Diego Morales',
                    'Camila Soto',
                    'Juan Pablo Vega',
                  ];

                  final streaks = [18, 15, 14, 12, 11, 9, 8, 7, 6, 5];
                  final colors = [
                    Colors.amber,
                    Colors.grey[400],
                    Colors.orange[700],
                    Colors.blue,
                    Colors.purple,
                  ];

                  return Card(
                    margin: const EdgeInsets.only(bottom: 10),
                    child: ListTile(
                      leading: CircleAvatar(
                        backgroundColor: index < 3 ? colors[index] : Colors.grey[300],
                        child: Text(
                          '${index + 1}',
                          style: TextStyle(
                            color: index < 3 ? Colors.white : Colors.black87,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      title: Text(
                        names[index],
                        style: const TextStyle(fontWeight: FontWeight.w600),
                      ),
                      subtitle: Text('${streaks[index]} días en racha'),
                      trailing: index < 3
                          ? const Icon(Icons.emoji_events, color: Colors.amber)
                          : null,
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}