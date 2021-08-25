class User {
  final String uid;
  final String? email;
  final String? name;
  final String? phoneNumber;
  final String? photoURL;
  final bool emailVerified;

  User(
    this.uid,
    this.email,
    this.name,
    this.phoneNumber,
    this.photoURL,
    this.emailVerified,
  );
}
