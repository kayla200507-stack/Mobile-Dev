import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Katalog Produk',
      theme: ThemeData(
        primarySwatch: Colors.indigo,
        useMaterial3: true,
      ),
      home: const HomeScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

// Model Data Katalog
class CatalogItem {
  final String id;
  final String title;
  final String price;
  final String description;
  final IconData icon;

  const CatalogItem({
    required this.id,
    required this.title,
    required this.price,
    required this.description,
    required this.icon,
  });
}

// SCREEN 1: Beranda / Katalog (Wajib StatelessWidget)
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  // Data 3 card sesuai spesifikasi
  final List<CatalogItem> items = const [
    CatalogItem(
      id: '1',
      title: 'Laptop Gaming Pro',
      price: 'Rp 18.500.000',
      description: 'Laptop performa tinggi dengan prosesor generasi terbaru dan kartu grafis canggih untuk kebutuhan komputasi berat.',
      icon: Icons.laptop_mac,
    ),
    CatalogItem(
      id: '2',
      title: 'Smartphone Flagship',
      price: 'Rp 12.000.000',
      description: 'Smartphone layar OLED dengan sistem kamera profesional, pengisian daya cepat, dan daya tahan baterai tinggi.',
      icon: Icons.smartphone,
    ),
    CatalogItem(
      id: '3',
      title: 'Headphones Wireless',
      price: 'Rp 2.500.000',
      description: 'Headphone nirkabel dengan fitur Active Noise Cancelling (ANC), peredam bising, dan daya baterai hingga 30 jam.',
      icon: Icons.headset,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Katalog Produk'),
        backgroundColor: Colors.indigo,
        foregroundColor: Colors.white,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(12.0),
        itemCount: items.length,
        itemBuilder: (context, index) {
          final item = items[index];
          return Card(
            elevation: 3,
            margin: const EdgeInsets.symmetric(vertical: 8.0),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            child: ListTile(
              contentPadding: const EdgeInsets.all(12),
              leading: CircleAvatar(
                radius: 28,
                backgroundColor: Colors.indigo.shade100,
                child: Icon(item.icon, color: Colors.indigo, size: 28),
              ),
              title: Text(
                item.title,
                style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
              subtitle: Text(
                item.price,
                style: const TextStyle(color: Colors.indigo, fontWeight: FontWeight.w600),
              ),
              trailing: const Icon(Icons.arrow_forward_ios, size: 18),
              onTap: () {
                // Stack Navigation: Perpindahan Screen menggunakan Navigator.push
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DetailScreen(item: item),
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

// SCREEN 2: Detail Katalog (Wajib StatefulWidget)
class DetailScreen extends StatefulWidget {
  final CatalogItem item;

  const DetailScreen({super.key, required this.item});

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  // Pengelolaan State Interaktif (Event & State)
  bool isFavorite = false;
  int quantity = 1;

  void _toggleFavorite() {
    setState(() {
      isFavorite = !isFavorite;
    });
  }

  void _incrementQuantity() {
    setState(() {
      quantity++;
    });
  }

  void _decrementQuantity() {
    if (quantity > 1) {
      setState(() {
        quantity--;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // AppBar otomatis menyediakan tombol Back ke Screen 1
      appBar: AppBar(
        title: Text(widget.item.title),
        backgroundColor: Colors.indigo,
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Visual Icon Utama
            Center(
              child: Container(
                height: 100,
                width: 100,
                decoration: BoxDecoration(
                  color: Colors.indigo.shade50,
                  shape: BoxShape.circle,
                ),
                child: Icon(widget.item.icon, size: 50, color: Colors.indigo),
              ),
            ),
            const SizedBox(height: 20),

            // Text Nama Katalog dan Tombol Favorit (Event & State)
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    widget.item.title,
                    style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                ),
                IconButton(
                  icon: Icon(
                    isFavorite ? Icons.favorite : Icons.favorite_border,
                    color: isFavorite ? Colors.red : Colors.grey,
                    size: 28,
                  ),
                  onPressed: _toggleFavorite,
                ),
              ],
            ),

            // Text Harga
            Text(
              widget.item.price,
              style: const TextStyle(fontSize: 18, color: Colors.indigo, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),

            // Container Berlatar Warna Pastel + Padding untuk Deskripsi
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                color: const Color(0xFFE8F5E9), // Warna Pastel Hijau Muda
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: Colors.green.shade200),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Deskripsi Produk:',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14, color: Colors.green),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    widget.item.description,
                    style: const TextStyle(fontSize: 14, height: 1.4, color: Colors.black87),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),

            // Komponen Tambahan Pengujian Event & State (Kuantitas)
            Row(
              children: [
                const Text('Jumlah Pesanan: ', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                const Spacer(),
                IconButton(
                  onPressed: _decrementQuantity,
                  icon: const Icon(Icons.remove_circle_outline),
                ),
                Text('$quantity', style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                IconButton(
                  onPressed: _incrementQuantity,
                  icon: const Icon(Icons.add_circle_outline),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}