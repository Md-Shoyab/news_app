class ApiErrors {
  // Error Status Code = null.
  static const String noInternet = 'Network Error!';
  static const String noInternetDetails = 'No Internet Connection.';

  // Error Status Code = 400.
  static const String badRequest = 'Bad Request Error!';
  static const String badRequestDetails =
      'Invalid Input. Some inputs are missing while creating a request.';

  // Error Status Code = 401.
  static const String unauthorised = 'Invalid Credentials!';
  static const String unauthorisedDetails =
      'The provided credentials are incorrect. Please try again.';

  // Error Status Code = 403.
  static const String forbidden = 'Forbidden Error!';
  static const String forbiddenDetails =
      "You don't have permission to access resource on this server.";

  // Error Status Code = 404.
  static const String serverNotFound = 'Server Not Found!';
  static const String serverNotFoundDetails =
      "The page you were trying to reach couldn't be found on our server.";

  // Error Status Code = 408.
  static const String serverTimeOut = 'Server Timeout!';
  static const String serverTimeOutDetails =
      'Server timeout. Please try again later.';

  // Error Status Code = 500 to 599.
  static const String serverError = 'Internal Server Error!';
  static const String serverErrorDetails =
      'Something went wrong with the server. Please try again later.';

  // For unidentified errors.
  static const String unknownError = 'Unknown Error Occured!';
  static const String unknownErrorDetails =
      'Something went wrong. Please try again later.';

  static const String sessionExpired = 'Session Expired!';
  static const String sessionExpiredDeatils =
      'Your session has been expired. Please Click login button to login again.';

  static const String passwordsNotMatching = 'Invalid Credentials!';
  static const String passwordsNotMatchingDetails =
      "Password & confirm password doesn't matches. Please enter both passwords again.";
}
