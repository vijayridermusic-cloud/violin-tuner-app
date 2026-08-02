import 'package:flutter/material.dart';

void main() {
  runApp(const ViolinTunerApp());
}

class ViolinTunerApp extends StatelessWidget {
  const ViolinTunerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Violin Tuner Pro',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: const Color(0xFF0F172A),
        primaryColor: Colors.amber,
      ),
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String selectedString = 'Sa (G)';

  // கர்நாடக வயலின் 4-ஸ்ட்ரிங் விவரங்கள்
  final List<Map<String, String>> stringsInfo = [
    {'name': 'Sa (G)', 'note': 'G3 / G4 - Main Tonic'},
    {'name': 'Pa (D)', 'note': 'D4 - Fifth'},
    {'name': 'Sa (A)', 'note': 'A4 - Higher Tonic'},
    {'name': 'Pa (E)', 'note': 'E5 - Highest Fifth'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Carnatic Violin Tuner'),
        centerTitle: true,
        backgroundColor: const Color(0xFF1E293B),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Precision Match',
              style: TextStyle(fontSize: 18, color: Colors.grey),
            ),
            const SizedBox(height: 30),
            const Text(
              'Carnatic 4-String Setup (Sa-Pa-Sa-Pa)',
              style: TextStyle(
                  fontSize: 16,
                  color: Colors.amber,
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 30),

            // ஸ்ட்ரிங் பட்டன்களை உருவாக்குதல்
            ...stringsInfo.map((item) {
              String str = item['name']!;
              String note = item['note']!;
              bool isSelected = selectedString == str;

              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: SizedBox(
                  width: double.infinity,
                  height: 60,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor:
                          isSelected ? Colors.amber : const Color(0xFF334155),
                      foregroundColor: isSelected ? Colors.black : Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    onPressed: () {
                      setState(() {
                        selectedString = str;
                      });
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          str,
                          style: const TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          note,
                          style: TextStyle(
                            fontSize: 14,
                            color:
                                isSelected ? Colors.black87 : Colors.grey[400],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            }).toList(),
          ],
        ),
      ),
    );
  }
}
