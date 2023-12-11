class User {
  final String uid;
  final String email;
  final String name;
  final int age;

  User({
    required this.uid,
    required this.email,
    required this.name,
    required this.age,
  });

  // Named constructor to create a User from a FirebaseUser
  factory User.fromFirebaseUser(User user) {
    return User(
      uid: user.uid,
      email: user.email,
      name: user.name, // handle null display name
      age: 0, // default age, update this based on your logic
    );
  }
}
