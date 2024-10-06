class ProductModel {
    final int id;
    final String title;
    final int price;
    final String description;
    final List<String> images;
    final DateTime creationAt;
    final DateTime updatedAt;
    final Category category;

    ProductModel({
        required this.id,
        required this.title,
        required this.price,
        required this.description,
        required this.images,
        required this.creationAt,
        required this.updatedAt,
        required this.category,
    });

    ProductModel copyWith({
        int? id,
        String? title,
        int? price,
        String? description,
        List<String>? images,
        DateTime? creationAt,
        DateTime? updatedAt,
        Category? category,
    }) => 
        ProductModel(
            id: id ?? this.id,
            title: title ?? this.title,
            price: price ?? this.price,
            description: description ?? this.description,
            images: images ?? this.images,
            creationAt: creationAt ?? this.creationAt,
            updatedAt: updatedAt ?? this.updatedAt,
            category: category ?? this.category,
        );
}

class Category {
    final int id;
    final Name name;
    final String image;
    final DateTime creationAt;
    final DateTime updatedAt;

    Category({
        required this.id,
        required this.name,
        required this.image,
        required this.creationAt,
        required this.updatedAt,
    });

    Category copyWith({
        int? id,
        Name? name,
        String? image,
        DateTime? creationAt,
        DateTime? updatedAt,
    }) => 
        Category(
            id: id ?? this.id,
            name: name ?? this.name,
            image: image ?? this.image,
            creationAt: creationAt ?? this.creationAt,
            updatedAt: updatedAt ?? this.updatedAt,
        );
}

enum Name {
    CLOTHES,
    FURNITURE,
    MISCELLANEOUS,
    SHOES
}
