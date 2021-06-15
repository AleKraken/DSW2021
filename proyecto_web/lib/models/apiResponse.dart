class ApiResponse {
  Object _data;
  Object _apiError;

  Object get Data => _data;
  set Data(Object data) => _data = data;

  Object get ApiError => _apiError;
  set ApiError(Object error) => _apiError = error;
}
