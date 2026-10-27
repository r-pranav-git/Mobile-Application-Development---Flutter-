
import 'package:flutter/material.dart';

void main() {
  runApp(const AnimatedProfileApp());
}

class AnimatedProfileApp extends StatelessWidget {
  const AnimatedProfileApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Animated Profile',
      theme: ThemeData(
        colorSchemeSeed: Colors.deepPurple,
        useMaterial3: true,
      ),
      home: const AnimatedProfileScreen(),
    );
  }
}

class AnimatedProfileScreen extends StatefulWidget {
  const AnimatedProfileScreen({super.key});

  @override
  State<AnimatedProfileScreen> createState() =>
      _AnimatedProfileScreenState();
}

class _AnimatedProfileScreenState
    extends State<AnimatedProfileScreen> {
  bool isExpanded = false;
  bool isFollowing = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Profile'),
        centerTitle: true,
      ),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: Card(
            elevation: 5,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(24),
            ),
            child: Padding(
              padding: const EdgeInsets.all(24),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        isExpanded = !isExpanded;
                      });
                    },
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 350),
                      curve: Curves.easeInOut,
                      width: isExpanded ? 180 : 130,
                      height: isExpanded ? 180 : 130,
                      padding: const EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: isExpanded
                              ? Colors.deepPurple
                              : Colors.grey,
                          width: isExpanded ? 5 : 2,
                        ),
                      ),
                      child: ClipOval(
                        child: Image.network(
                          'https://images.unsplash.com/photo-1500648767791-00dcc994a43e?w=400',
                          fit: BoxFit.cover,
                          errorBuilder: (context, error, stackTrace) {
                            return const ColoredBox(
                              color: Colors.deepPurple,
                              child: Icon(
                                Icons.person,
                                size: 70,
                                color: Colors.white,
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    'Alex Johnson',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 6),
                  const Text(
                    'Flutter Developer',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey,
                    ),
                  ),
                  AnimatedSize(
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.easeInOut,
                    child: isExpanded
                        ? Column(
                            children: const [
                              SizedBox(height: 20),
                              Divider(),
                              ListTile(
                                leading: Icon(
                                  Icons.email,
                                  color: Colors.deepPurple,
                                ),
                                title: Text('Email'),
                                subtitle: Text(
                                  'alex@example.com',
                                ),
                                contentPadding: EdgeInsets.zero,
                              ),
                              ListTile(
                                leading: Icon(
                                  Icons.phone,
                                  color: Colors.deepPurple,
                                ),
                                title: Text('Phone Number'),
                                subtitle: Text('+91 98765 43210'),
                                contentPadding: EdgeInsets.zero,
                              ),
                            ],
                          )
                        : const SizedBox.shrink(),
                  ),
                  const SizedBox(height: 20),
                  AnimatedContainer(
                    duration: const Duration(milliseconds: 250),
                    width: 180,
                    child: ElevatedButton.icon(
                      onPressed: () {
                        setState(() {
                          isFollowing = !isFollowing;
                        });
                      },
                      icon: Icon(
                        isFollowing
                            ? Icons.check
                            : Icons.person_add_alt_1,
                      ),
                      label: Text(
                        isFollowing ? 'Following' : 'Follow',
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: isFollowing
                            ? Colors.green
                            : Colors.deepPurple,
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(
                          vertical: 13,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 12),
                  Text(
                    isExpanded
                        ? 'Tap the profile image to collapse'
                        : 'Tap the profile image to view details',
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      color: Colors.grey,
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
