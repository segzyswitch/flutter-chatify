import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreService {
  final CollectionReference posts = FirebaseFirestore.instance.collection('posts');

  // Create post
  Future<void> addPost(String post) {
    return posts.add({
      'text': post,
      'timestamp': Timestamp.now()
    });
  }

  // Fetch Posts
  Stream<QuerySnapshot> getPostStream() {
    final postStream = posts.orderBy('timestamp', descending: true).snapshots();
    return postStream;
  }

  // Update post
  Future<void> updatePost(String postId, String post) {
    return posts.doc(postId).update({
      'text': post,
      'timestamp': Timestamp.now(),
    });
  }

  // Delete post
  Future<void> deletePost(String postId) {
    return posts.doc(postId).delete();
  }
}