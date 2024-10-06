class UserModel {
    final String token;

    UserModel({
        required this.token,
    });

    UserModel copyWith({
        String? token,
    }) => 
        UserModel(
            token: token ?? this.token,
        );
}
