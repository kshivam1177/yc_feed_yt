import 'package:yc_app/shared/models/api_state.model.dart';
import 'package:yc_app/shared/resources/video_quality_api_provider.dart';

class VideoQualityRepository {
  final VideoQualityApiProvider _VideoQualityApiProvider =
      VideoQualityApiProvider();

  Future<ApiState> getAvailableVideoQualities() =>
      _VideoQualityApiProvider.getAvailableVideoQualities();
}

final VideoQualityRepository videoQualityRepository = VideoQualityRepository();
