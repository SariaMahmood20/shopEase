class UserProfileModel {
  final Data data;
  final Support support;

  UserProfileModel({
    required this.data,
    required this.support,
  });

  // Factory constructor for creating a new instance from a JSON map
  factory UserProfileModel.fromJson(Map<String, dynamic> json) {
    return UserProfileModel(
      data: Data.fromJson(json['data']),
      support: Support.fromJson(json['support']),
    );
  }

  // Method to create a copy of the object with updated fields
  UserProfileModel copyWith({
    Data? data,
    Support? support,
  }) =>
      UserProfileModel(
        data: data ?? this.data,
        support: support ?? this.support,
      );
}

class Data {
  final int id;
  final String email;
  final String firstName;
  final String lastName;
  final String avatar;

  Data({
    required this.id,
    required this.email,
    required this.firstName,
    required this.lastName,
    required this.avatar,
  });

  // Factory constructor for creating a new instance from a JSON map
  factory Data.fromJson(Map<String, dynamic> json) {
    return Data(
      id: json['id'],
      email: json['email'],
      firstName: json['first_name'],
      lastName: json['last_name'],
      avatar: json['avatar'],
    );
  }

  // Method to create a copy of the object with updated fields
  Data copyWith({
    int? id,
    String? email,
    String? firstName,
    String? lastName,
    String? avatar,
  }) =>
      Data(
        id: id ?? this.id,
        email: email ?? this.email,
        firstName: firstName ?? this.firstName,
        lastName: lastName ?? this.lastName,
        avatar: avatar ?? this.avatar,
      );
}

class Support {
  final String url;
  final String text;

  Support({
    required this.url,
    required this.text,
  });

  // Factory constructor for creating a new instance from a JSON map
  factory Support.fromJson(Map<String, dynamic> json) {
    return Support(
      url: json['url'],
      text: json['text'],
    );
  }

  // Method to create a copy of the object with updated fields
  Support copyWith({
    String? url,
    String? text,
  }) =>
      Support(
        url: url ?? this.url,
        text: text ?? this.text,
      );
}
