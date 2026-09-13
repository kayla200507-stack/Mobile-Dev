import 'package:flutter/material.dart';

// --- Model Data (UserModel) ---
class UserModel {
  final int id;
  final String name;
  final String email;
  final String? phone;
  final String? address;

  UserModel({
    required this.id,
    required this.name,
    required this.email,
    this.phone,
    this.address,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'] as int? ?? 0,
      name: json['name'] as String? ?? 'Unknown',
      email: json['email'] as String? ?? 'No Email',
      phone: json['phone'] as String?,
      address: json['address'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'phone': phone,
      'address': address,
    };
  }
}

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Katalog Pengguna',
      theme: ThemeData(
        primarySwatch: Colors.indigo,
        useMaterial3: true,
      ),
      home: HomeScreen(),
    );
  }
}

// ==========================================
// 1. SCREEN 1: Beranda / Katalog (StatelessWidget)
// ==========================================
class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  // Mockup data 3 pengguna (Json Response)
  final List<Map<String, dynamic>> rawJsonList = [
    {
      'id': 101,
      'name': 'Budi Santoso',
      'email': 'budi.santoso@example.com',
      'phone': '+62 812-3456-7890',
      'address': 'Jl. Merdeka No. 45, Jakarta',
    },
    {
      'id': 102,
      'name': 'Siti Rahma',
      'email': 'siti.rahma@example.com',
      // phone & address disengaja null untuk testing fallback UserModel
    },
    {
      'id': 103,
      'name': 'Andi Wijaya',
      'email': 'andi.wijaya@example.com',
      'phone': '+62 857-1122-3344',
      'address': 'Jl. Pemuda No. 12, Surabaya',
    },
  ];

  @override
  Widget build(BuildContext context) {
    // Deserialization: Konversi JSON List ke List<UserModel>
    final List<UserModel> userList =
    rawJsonList.map((json) => UserModel.fromJson(json)).toList();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Katalog Pengguna'),
        backgroundColor: Colors.indigo,
        foregroundColor: Colors.white,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(12.0),
        itemCount: userList.length,
        itemBuilder: (context, index) {
          final user = userList[index];
          return Card(
            elevation: 3,
            margin: const EdgeInsets.symmetric(vertical: 8.0),
            child: ListTile(
              leading: CircleAvatar(
                backgroundColor: Colors.indigo.shade100,
                child: Text(
                  user.name.substring(0, 1),
                  style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.indigo),
                ),
              ),
              title: Text(
                user.name,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Text(user.email),
              trailing: const Icon(Icons.arrow_forward_ios, size: 16),
              onTap: () {
                // Navigasi Navigator.push ke Screen 2
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DetailScreen(user: user),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}

// ==========================================
// 2. SCREEN 2: Detail Katalog (StatefulWidget)
// ==========================================
class DetailScreen extends StatefulWidget {
  final UserModel user;

  const DetailScreen({super.key, required this.user});

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  // State interaktif untuk tombol Bookmark/Favorit
  bool isBookmarked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detail Profil'),
        backgroundColor: Colors.indigo,
        foregroundColor: Colors.white,
        // AppBar otomatis menyediakan tombol Back
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Avatar dan Nama
            Center(
              child: Column(
                children: [
                  CircleAvatar(
                    radius: 40,
                    backgroundColor: Colors.indigo,
                    child: Text(
                      widget.user.name.substring(0, 1),
                      style: const TextStyle(fontSize: 32, color: Colors.white),
                    ),
                  ),
                  const SizedBox(height: 12),
                  Text(
                    widget.user.name,
                    style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    'ID User: ${widget.user.id}',
                    style: TextStyle(color: Colors.grey.shade600),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),

            // Container Warna Pastel untuk Informasi/Bio
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                color: Colors.indigo.shade50, // Latar belakang pastel
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: Colors.indigo.shade100),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Informasi Kontak & Alamat',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.indigo),
                  ),
                  const Divider(),
                  const SizedBox(height: 8),
                  Text('Email: ${widget.user.email}'),
                  const SizedBox(height: 6),
                  Text('Telepon: ${widget.user.phone ?? 'Tidak tersedia'}'),
                  const SizedBox(height: 6),
                  Text('Alamat: ${widget.user.address ?? 'Tidak tersedia'}'),
                ],
              ),
            ),
            const SizedBox(height: 24),

            // Tombol Interaktif (Perubahan State pada StatefulWidget)
            Center(
              child: ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  backgroundColor: isBookmarked ? Colors.amber.shade700 : Colors.indigo,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                ),
                onPressed: () {
                  setState(() {
                    isBookmarked = !isBookmarked;
                  });
                },
                icon: Icon(isBookmarked ? Icons.bookmark : Icons.bookmark_border),
                label: Text(
                  isBookmarked ? 'Tersimpan di Favorit' : 'Simpan ke Favorit',
                  style: const TextStyle(fontSize: 16),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}