class NewProductModel {
    final String title;
    final int price;
    final String description;
    final int categoryId;
    final List<String> images;

    NewProductModel({
        required this.title,
        required this.price,
        required this.description,
        required this.categoryId,
        required this.images,
    });

    NewProductModel copyWith({
        String? title,
        int? price,
        String? description,
        int? categoryId,
        List<String>? images,
    }) => 
        NewProductModel(
            title: title ?? this.title,
            price: price ?? this.price,
            description: description ?? this.description,
            categoryId: categoryId ?? this.categoryId,
            images: images ?? this.images,
        );
}
