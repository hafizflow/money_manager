class MValidator {
  MValidator._();

  /// Empty text validation
  static String? validateEmptyText(String? fieldName, String? value) {
    if (value == null || value.isEmpty) {
      return '$fieldName is required';
    }
    return null;
  }

  /// Empty invalid amount
  static String? validateInvalidAmount(String? fieldName, String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter a budget amount';
    }
    if (double.tryParse(value) == null) {
      return 'Please enter a valid number';
    }
    return null;
  }
}
