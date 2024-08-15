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

  /// factory keyword is used to define a constructor that doesn't necessarily
  /// create a new instance of the class every time it's called
  factory Category.fromJson(Map<String, dynamic> data, String documentId) {
    return Category(
      id: documentId,
      name: data['name'] ?? '',
      budgetedAmount: data['budgetedAmount']?.toDouble() ?? 0.0,
      spentAmount: data['spentAmount']?.toDouble() ?? 0.0,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'budgetedAmount': budgetedAmount,
      'spentAmount': spentAmount,
    };
  }
}
