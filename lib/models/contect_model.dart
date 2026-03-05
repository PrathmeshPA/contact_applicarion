class Contact {
  int? id;
  String name;
  String phone;
  String email;
  String address;
  String work;
  int favorite;

  Contact({
    this.id,
    required this.name,
    required this.phone,
    required this.email,
    required this.address,
    required this.work,
    this.favorite = 0,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'phone': phone,
      'email': email,
      'address': address,
      'work': work,
      'favorite': favorite,
    };
  }

  factory Contact.fromMap(Map<String, dynamic> map) {
    return Contact(
      id: map['id'],
      name: map['name'],
      phone: map['phone'],
      email: map['email'],
      address: map['address'] ?? '',
      work: map['work'] ?? '',
      favorite: map['favorite'] ?? 0,
    );
  }
}