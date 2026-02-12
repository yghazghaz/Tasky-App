import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:tasky/features/auth/data/model/user_model.dart';

abstract class AuthFirebaseDatabase {
  static CollectionReference<UserModel> get _getCollection {
    return FirebaseFirestore.instance
        .collection(UserModel.collection)
        .withConverter<UserModel>(
          fromFirestore: (snapshot, _) => UserModel.fromjson(snapshot.data()!),
          toFirestore: (user, _) => user.toMap(),
        );
  }

  static Future<void> addUser(UserModel user) async {
    await _getCollection.doc(user.id).set(user);
  }
}
