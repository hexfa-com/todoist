import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';
import 'package:todoist/data/models/project_model_response.dart';

import '../../core/constants/constants_value.dart';

part 'project_service.g.dart';

@RestApi(baseUrl: baseUrl)
abstract class ProjectService {
  factory ProjectService(Dio dio, {String baseUrl}) = _ProjectService;

  @GET("projects")
  Future<List<ProjectModelResponse>> getProjects();
}
