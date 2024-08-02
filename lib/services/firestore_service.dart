import 'package:cloud_firestore/cloud_firestore.dart';

import '../models/category.dart';

class FirestoreService {
  final CollectionReference _categoryCollection =
      FirebaseFirestore.instance.collection('categories');

  Future<void> addCategory(Category category) {
    return _categoryCollection.add(category.toFirestore());
  }

  Future<void> updateCategory(Category category) {
    return _categoryCollection.doc(category.id).update(category.toFirestore());
  }

  Future<void> deleteCategory(String id) {
    return _categoryCollection.doc(id).delete();
  }

  Stream<List<Category>> getCategories() {
    return _categoryCollection.snapshots().map((QuerySnapshot snapshot) {
      return snapshot.docs.map((DocumentSnapshot doc) {
        return Category.fromFirestore(doc.data() as Map<String, dynamic>);
      }).toList();
    });
  }
}
