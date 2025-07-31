class Company {
  final int id;
  final String name;
  final String logo;
  final String about;
  final String address;
  final String facility;
  final String size;
  final String specialization;

  Company({
    required this.id,
    required this.name,
    required this.logo,
    required this.about,
    required this.address,
    required this.facility,
    required this.size,
    required this.specialization,
  });

  factory Company.fromMap(Map<String, dynamic> map) => Company(
    id: map['id'],
    name: map['name'],
    logo: map['logo'],
    about: map['about'],
    address: map['address'],
    facility: map['facility'],
    size: map['size'],
    specialization: map['specialization'],
  );

  Map<String, dynamic> toMap() => {
    'id': id,
    'name': name,
    'logo': logo,
    'about': about,
    'address': address,
    'facility': facility,
    'size': size,
    'specialization': specialization,
  };
}