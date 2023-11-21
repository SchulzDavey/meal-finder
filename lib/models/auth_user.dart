class AuthUser {
  const AuthUser({
    required this.id,
    required this.email,
    required this.username,
    required this.imageUrl,
  });

  final String id;
  final String email;
  final String username;
  final String imageUrl;
}
