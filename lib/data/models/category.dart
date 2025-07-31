class Category {
  final int id;
  final String name;
  final String iconName;

  Category({
    required this.id,
    required this.name,
    required this.iconName,
  });

  factory Category.fromMap(Map<String, dynamic> map) => Category(
    id: map['id'],
    name: map['name'],
    iconName: map['icon'],
  );

  Map<String, dynamic> toMap() => {
    'id': id,
    'name': name,
    'icon': iconName,
  };
}