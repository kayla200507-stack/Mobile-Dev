class UserModel {
  final int id;
  final String name;
  final String email;
  final String? phone;
  final String? address;

  // 1. Constructor Utama (Named Parameters)
  UserModel({
    required this.id,
    required this.name,
    required this.email,
    this.phone,
    this.address,
  });

  // 2. Factory Constructor (Deserialization: JSON -> Objek)
  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'] as int? ?? 0,
      name: json['name'] as String? ?? 'Unknown',
      email: json['email'] as String? ?? 'No Email',
      phone: json['phone'] as String?,
      address: json['address'] as String?,
    );
  }

  // 3. Method toJson (Serialization: Objek -> JSON)
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

// 4. Eksekusi dan Pengujian
void main() {
  // Simulasi JSON dari API (beberapa field sengaja kosong/null)
  Map<String, dynamic> jsonResponse = {
    'name': 'Budi Santoso',
    // 'id', 'email', 'phone', dan 'address' tidak dikirim oleh server
  };

  // Konversi JSON ke Objek Dart
  UserModel user = UserModel.fromJson(jsonResponse);

  print('--- Hasil Deserialization (JSON ke Objek) ---');
  print('ID: ${user.id}');           // Output: 0 (nilai default)
  print('Nama: ${user.name}');       // Output: Budi Santoso
  print('Email: ${user.email}');     // Output: No Email (nilai default)
  print('Phone: ${user.phone}');     // Output: null
  print('Address: ${user.address}'); // Output: null

  // Konversi kembali Objek ke JSON
  print('\n--- Hasil Serialization (Objek ke JSON) ---');
  print('To JSON: ${user.toJson()}');
}