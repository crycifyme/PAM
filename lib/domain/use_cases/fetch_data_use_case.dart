import '../repositories/repository.dart';
import '../entities/category.dart';

class FetchCategoriesUseCase {
  final Repository repository;

  FetchCategoriesUseCase(this.repository);

  Future<List<Category>> call() async {
    return await repository.getCategories();
  }
}
