import '../../domain/entities/category.dart';

class CategoryModel extends Category {
  CategoryModel({required String title, required String icon})
      : super(title: title, icon: icon);

  factory CategoryModel.fromJson(Map<String, dynamic> json) {
    return CategoryModel(
      title: json['title'],
      icon: json['icon'],
    );
  }
}
