class Category {
  String id;
  String name;
  double budget;
  double spent;

  Category(
      {required this.id,
      required this.name,
      required this.budget,
      required this.spent});

  factory Category.fromFirestore(Map<String, dynamic> data) {
    return Category(
      id: data['id'],
      name: data['name'],
      budget: data['budget'],
      spent: data['spent'],
    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      'id': id,
      'name': name,
      'budget': budget,
      'spent': spent,
    };
  }
}
