// lib/domain/use_cases/fetch_banners_use_case.dart
import '../repositories/repository.dart';
import '../entities/banner_data.dart';

class FetchBannersUseCase {
  final Repository repository;

  FetchBannersUseCase(this.repository);

  Future<List<BannerData>> call() async {
    return await repository.getBanners();
  }
}
