class UserModel {
  final int id;
  final String name;
  final String email;
  final String? phone;
  final String? address;

  // Constructor
  UserModel({
    required this.id,
    required this.name,
    required this.email,
    this.phone,
    this.address,
  });

  // Factory Constructor (Deserialization)
  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'] as int? ?? 0,
      name: json['name'] as String? ?? 'Unknown',
      email: json['email'] as String? ?? 'No Email',
      phone: json['phone'] as String?,
      address: json['address'] as String?,
    );
  }

  // Method toJson (Serialization)
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

// Fungsi Testing
void main() {
  Map<String, dynamic> jsonResponse = {
    'name': 'Budi Santoso',
  };

  UserModel user = UserModel.fromJson(jsonResponse);

  print('--- Hasil Deserialization ---');
  print('ID: ${user.id}');
  print('Nama: ${user.name}');
  print('Email: ${user.email}');
  print('Phone: ${user.phone}');
  print('Address: ${user.address}');

  print('\n--- Hasil Serialization ---');
  print('To JSON: ${user.toJson()}');
}