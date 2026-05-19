import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();
  int currentPage = 0;

  final List<Map<String, String>> onboardingData = [
    {
      "title": "Bienvenido a Stay Balanced",
      "description": "La app que te ayuda a tomar el control de tu dinero como estudiante.",
      "image": "💰",
    },
    {
      "title": "Presupuesto Inteligente",
      "description": "Crea tu presupuesto mensual automáticamente según tus ingresos y estilo de vida.",
      "image": "📊",
    },
    {
      "title": "Entiende el valor real del dinero",
      "description": "Descubre cuánto tiempo de tu trabajo cuesta cada gasto.",
      "image": "⏰",
    },
    {
      "title": "Compite y mejora",
      "description": "Mantén rachas, fija metas y compite sanamente con tus amigos.",
      "image": "🏆",
    },
  ];

  void _nextPage() {
    if (currentPage < onboardingData.length - 1) {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    } else {
      // Ir al Login o Dashboard
      context.go('/login');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            // Skip button
            Align(
              alignment: Alignment.topRight,
              child: TextButton(
                onPressed: () => context.go('/login'),
                child: const Text("Saltar"),
              ),
            ),

            Expanded(
              child: PageView.builder(
                controller: _pageController,
                onPageChanged: (value) {
                  setState(() => currentPage = value);
                },
                itemCount: onboardingData.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(32.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          onboardingData[index]['image']!,
                          style: const TextStyle(fontSize: 120),
                        ),
                        const SizedBox(height: 40),
                        Text(
                          onboardingData[index]['title']!,
                          style: const TextStyle(
                            fontSize: 28,
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 16),
                        Text(
                          onboardingData[index]['description']!,
                          style: const TextStyle(
                            fontSize: 17,
                            color: Colors.grey,
                            height: 1.4,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),

            // Indicadores y botón
            Padding(
              padding: const EdgeInsets.all(32.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Dots
                  Row(
                    children: List.generate(
                      onboardingData.length,
                      (index) => Container(
                        margin: const EdgeInsets.only(right: 8),
                        width: currentPage == index ? 24 : 8,
                        height: 8,
                        decoration: BoxDecoration(
                          color: currentPage == index ? Colors.blue : Colors.grey[300],
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                    ),
                  ),

                  // Botón Siguiente
                  ElevatedButton(
                    onPressed: _nextPage,
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                    child: Text(
                      currentPage == onboardingData.length - 1 ? "Empezar" : "Siguiente",
                      style: const TextStyle(fontSize: 16),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}