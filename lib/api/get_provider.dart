import 'package:get/get.dart';

class GetProvider extends GetConnect {
  // Get request
  Future<Response> getUser(int id) => get('http://youapi/users/$id');

  // Post request
  Future<Response> sendPost(Map data) => post('http://youapi/users', data,
      contentType: 'application/json; charset=UTF-8');

  // Post request with File
  Future<Response> postCases(List<int> image) {
    final form = FormData({
      'file': MultipartFile(image, filename: 'avatar.png'),
      'otherFile': MultipartFile(image, filename: 'cover.png'),
    });
    return post('http://youapi/users/upload', form);
  }

  GetSocket userMessages() {
    return socket('https://yourapi/users/socket');
  }
}
