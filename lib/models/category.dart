class Category {
  String id;
  String name;
  double budgetedAmount;
  double spentAmount;

  Category({
    required this.id,
    required this.name,
    required this.budgetedAmount,
    required this.spentAmount,
  });

  factory Category.fromMap(Map<String, dynamic> data, String documentId) {
    return Category(
      id: documentId,
      name: data['name'] ?? '',
      budgetedAmount: data['budgetedAmount']?.toDouble() ?? 0.0,
      spentAmount: data['spentAmount']?.toDouble() ?? 0.0,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'budgetedAmount': budgetedAmount,
      'spentAmount': spentAmount,
    };
  }
}
