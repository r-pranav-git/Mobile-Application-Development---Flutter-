
import 'package:flutter/material.dart';

void main() {
  runApp(const InstagramProfileApp());
}

class InstagramProfileApp extends StatelessWidget {
  const InstagramProfileApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Instagram Profile UI',
      theme: ThemeData(
        useMaterial3: true,
        colorSchemeSeed: Colors.pink,
      ),
      home: const InstagramProfileScreen(),
    );
  }
}

class InstagramProfileScreen extends StatefulWidget {
  const InstagramProfileScreen({super.key});

  @override
  State<InstagramProfileScreen> createState() =>
      _InstagramProfileScreenState();
}

class _InstagramProfileScreenState
    extends State<InstagramProfileScreen> {
  bool isFollowing = false;

  final List<String> highlights = [
    'Travel',
    'Nature',
    'Friends',
    'Food',
    'Memories',
  ];

  final List<String> posts = [
    'photo-1500530855697-b586d89ba3ee',
    'photo-1470770841072-f978cf4d019e',
    'photo-1441974231531-c6227db76b6e',
    'photo-1470252649378-9c29740c9fa8',
    'photo-1501785888041-af3ef285b470',
    'photo-1464822759023-fed622ff2c3b',
    'photo-1472396961693-142e6e269027',
    'photo-1518837695005-2083093ee35b',
    'photo-1472214103451-9374bd1c798e',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'pranav_travels',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        actions: const [
          Icon(Icons.add_box_outlined),
          SizedBox(width: 20),
          Icon(Icons.menu),
          SizedBox(width: 16),
        ],
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              children: [
                const CircleAvatar(
                  radius: 43,
                  backgroundImage: NetworkImage(
                    'https://images.unsplash.com/photo-1500648767791-00dcc994a43e?w=200',
                  ),
                ),
                const SizedBox(width: 20),
                const Expanded(
                  child: Row(
                    mainAxisAlignment:
                        MainAxisAlignment.spaceAround,
                    children: [
                      _ProfileStat(count: '24', label: 'Posts'),
                      _ProfileStat(
                        count: '1.2K',
                        label: 'Followers',
                      ),
                      _ProfileStat(
                        count: '350',
                        label: 'Following',
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Pranav R',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 4),
                Text('Travel | Photography | Lifestyle 📸'),
                Text('Exploring the world, one frame at a time 🌍'),
                Text(
                  '📍 Kerala, India',
                  style: TextStyle(color: Colors.blue),
                ),
              ],
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      setState(() {
                        isFollowing = !isFollowing;
                      });
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: isFollowing
                          ? Colors.grey.shade300
                          : Colors.blue,
                      foregroundColor:
                          isFollowing ? Colors.black : Colors.white,
                    ),
                    child: Text(
                      isFollowing ? 'Following' : 'Follow',
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: OutlinedButton(
                    onPressed: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Message button tapped'),
                        ),
                      );
                    },
                    child: const Text('Message'),
                  ),
                ),
                const SizedBox(width: 8),
                OutlinedButton(
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('More options selected'),
                      ),
                    );
                  },
                  child: const Icon(Icons.person_add_alt_1),
                ),
              ],
            ),
          ),

          SizedBox(
            height: 105,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 12),
              itemCount: highlights.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 7),
                  child: Column(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(3),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: Colors.pink,
                            width: 2,
                          ),
                        ),
                        child: CircleAvatar(
                          radius: 29,
                          backgroundColor: Colors.grey.shade200,
                          backgroundImage: NetworkImage(
                            'https://images.unsplash.com/'
                            '${posts[index]}?w=150',
                          ),
                        ),
                      ),
                      const SizedBox(height: 5),
                      Text(
                        highlights[index],
                        style: const TextStyle(fontSize: 12),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),

          const Divider(height: 1),

          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Padding(
                padding: EdgeInsets.all(12),
                child: Icon(Icons.grid_on, size: 26),
              ),
              Padding(
                padding: EdgeInsets.all(12),
                child: Icon(Icons.video_library_outlined, size: 26),
              ),
              Padding(
                padding: EdgeInsets.all(12),
                child: Icon(Icons.person_pin_outlined, size: 26),
              ),
            ],
          ),

          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: posts.length,
            gridDelegate:
                const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              crossAxisSpacing: 2,
              mainAxisSpacing: 2,
            ),
            itemBuilder: (context, index) {
              return Image.network(
                'https://images.unsplash.com/'
                '${posts[index]}?w=400',
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return Container(
                    color: Colors.grey.shade200,
                    child: const Icon(Icons.image_not_supported),
                  );
                },
              );
            },
          ),
        ],
      ),
    );
  }
}

class _ProfileStat extends StatelessWidget {
  final String count;
  final String label;

  const _ProfileStat({
    required this.count,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          count,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(label, style: const TextStyle(fontSize: 12)),
      ],
    );
  }
}
